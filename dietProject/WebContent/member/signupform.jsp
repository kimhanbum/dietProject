<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/comm/header.jsp" />
<link href="css/signup_style.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
 $(function(){
	
	
	 $('#myform').submit(function(){

	      if($('#confirmIdcheck').val()=='y'){
	    	  alert('아이디중복체크를 하세요');
	    	 
	    	  return false;
	      }; 		 		   
		    
		 
		 if(!$.isNumeric($('#post1').val())){
		    	alert('우편번호는 숫자만 입력 가능합니다');
		    	return false;
		    };
		   
        
		      if(!pandan){
		    	  return false;
		      }
		      
		     
		      
		      
		    });

		  $('#idcheck').click(function(){
			var input_id=$.trim($('#id').val());
			  if(input_id == ''){
				  alert('ID를 입력하세요');
				  $('#id').focus();
				  return false;
			  }else{
				  pattern= /^[a-zA-Z0-9_]{4,20}$/;
				   pandan= pattern.test(input_id);				  
				  if(!pandan){
					  alert('아이디는  대소문자,숫자,_로 총 4-20자 여야 합니다');
					  $('#id').val('').focus();
				  }else{
					  $.ajax({
					  url: "idcheck.net",
					  data:{id:input_id},
					  type:"post",
					  success:function(rdata){
						  if(rdata=="y"){
							  alert("이미 존재하는 아이디입니다.");
							  pandan=false;
						  }else{
							  alert("사용가능한 아이디 입니다.");
							 
							  $("#confirmIdcheck").val(rdata);
						  }
					  }
					  
					  
					  });				  
				  }
			  }
		  });
		 
		  
		
		  $('#sel').change(function(){
			 if($('#sel').val()==''){
				 $('#domain').val('').focus();
				 $('#domain').prop('readOnly',false);
			 } else{
				 $('#domain').val($('#sel').val());
				 $('#domain').prop('readOnly',true);
			 }
		  });
		 
		  $('#jumin1').focusout(function(){
			  if($("#jumin1").val().length==6){
				  pattern=/^[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
				  pandan= pattern.test($('#jumin1').val());
				  if(pandan){
					 $("#jumin2").focus(); 
				  }else{
					  alert("주민번호 앞자리를 숫자 또는 형식에 맞게 입력하세요[yymmdd]");
					  $("#jumin1").val('');
					 
				  }
			  }
		  });
		  
		  
		  
		  $('#jumin2').focusout(function(){
			  if($("#jumin2").val().length==7){
				  pattern=/^[[12345][0-9]{6}$/;
				   pandan=pattern.test($('#jumin2').val());
				  if(pandan){
					  var c=$("#jumin2").val().substring(0,1);
					  var index=(c-1)%2
					  
					  $("input[type=radio]").eq(index).prop("checked",true);
				  }else{
					  alert("주민번호 뒤자리를 형식에 맞게 입력하세요[12345][0-9]{6}");
					  $("#jumin2").val('');
					 
				  }
			  }
		  });
		  
		 
		     
		
		   
		    $('.cancelbtn').click(function(){
		    	
				location.href="login.net";
		    });
		    
		 
		    
		    $('#pass_').focusout(function(){
			   
		       if($("#pass_").val()!=""&&$("#pass_").val()!=$("#pass").val()){
		    	   $("#span3").css("visibility","visible");
		    	   $("#span3").html("입력한 비밀번호와 일치 하지 않습니다.");
		    	   
		    	   pandan=false;
		       }else{
		    	   $("#span3").css("visibility","hidden");
		       }	
		    
			  });
		    
		    $('#pass').keyup(function(){
		        if($("#pass_").val()!=null&&$("#pass_").val()!=''){
		        	if($("#pass").val()==$("#pass_").val()){
		        		 $("#span3").css("visibility","hidden");
		        	}
		        }	
		    
		    
		    })
		    $('#tel_1').focusout(function(){
			    pattern=/^[0][0-7]{2,3}$/ 
			    pandan = pattern.test( $('#tel_1').val());
		       if(!pandan){
		    	   alert("전화번호를 앞자리를 형식에 맞게 입력해주세요");
		       }	
		    
			  });
		    
		    $('#tel_2').focusout(function(){
			    pattern=/^[0-9]{4}$/ 
			    pandan = pattern.test( $('#tel_2').val());
		       if(!pandan){
		    	   alert("전화번호 중간자리를 형식에 맞게 입력해주세요");
		       }	
		    
			  });
		    $('#tel_3').focusout(function(){
			    pattern=/^[0-9]{4}$/ 
			    pandan = pattern.test( $('#tel_3').val());
		       if(!pandan){
		    	   alert("전화번호 중간자리를 형식에 맞게 입력해주세요");
		       }	
		    
			  });
		    
		
		   
		    $('#pass').focusout(function(){
		     	
				
				var pattern=/^[A-za-z0-9]{8,15}$/;
		        
		        var pass=$.trim($('#pass').val());
				
				pandan=pattern.test(pass);
				
				if(!pandan){
					
					$('#span2').html('영문자,숫자 구성됩니다(총8자리~15자리)');
					$('#span2').css('visibility','visible');
					
				
				}else {

					$('#span2').css('visibility','hidden');
					}
			

			});
		    $('#pass').focus(function(){
				 if($.trim($("#id").val())==''){	
					$('#span2').html('이름을 입력하세요')
					$('#id').focus();
					$('#span2').css('visibility','visible');
					$('#span2').css('color','red');
				 }else 
					 $('#span2').css('visibility','hidden');
		        });
			  
			
			
			
			
});
			
			
				
			  



 function execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 참고 항목 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if (data.buildingName !== '' && data.apartment === 'Y') {
                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if (extraRoadAddr !== '') {
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }
             
          // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
             if(fullRoadAddr !== ''){
                 fullRoadAddr += extraRoadAddr;
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('post1').value = data.zonecode;
             document.getElementById("address").value = fullRoadAddr;

             
         }
     }).open();
 }


</script>

</head>
<body class="goto-here">

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.jsp">Home</a></span> <span>DIET</span>
					</p>
					<h1 class="mb-0 bread">Welcome</h1>
				</div>
			</div>
		</div>
	</div>


	<form name="myform" method="post" action="joinProcess.net"
		id='myform'>

		<div class="containner">
			<fieldset style="padding: 5px">

				<label for="id" style="margin-top: 30px"><b>아이디</b></label>
				<div>
					<input type="text" placeholder="아이디를 입력하세요" name="id" id="id"
						required> 
						<input type="button" value="ID중복체크" id='idcheck'
						name="idcheck"><br> 
						<input type="hidden" value="y"
						id="confirmIdcheck"> <span id="span1"></span>
				</div>
				<label for="pass"><b>비밀번호</b></label> <input type="password"
					placeholder="비밀번호를 입력하세요(문자,숫자,특수문자로 구성된 8~15자리입니다)" name="pass"
					id="pass" required> <span id='span2' style="color: red"></span><br>

				<div>
					<label for="pass_"><b>비밀번호 재입력</b></label> <input type="password"
						placeholder="비밀번호를 다시 입력하세요" name="pass" id="pass_" required>
					<span id='span3' style="color: red"></span><br>
				</div>

				<div style="margin-top: 2px">
					<label for="name"><b>이름</b></label> <input type="text"
						placeholder="이름을 입력하세요" name="name" id="name" required>

				</div>

				</div>
				<div style="margin-top: -10px">
					<label for="jumin1"><b>주민번호</b></label><br> <input type="text"
						placeholder="주민번호 앞6자리" name="jumin1" id="jumin1" size="6"
						maxLength="6" required> <label for="jumin2"><b>
							- </b></label> <input type="text" placeholder="주민번호 뒤7자리" name="jumin2"
						id="jumin2" size="7" maxLength="7" required>
				</div>



				<label for="email"><b> E-Mail </b></label><br> <input
					type="text" name="email" id="email" required> @ <input
					type="text" name="domain" id="domain" required> <select
					name="sel" id="sel">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.com">daum.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>


				</select> <label><b>성별</b></label><br>

				<div class="container2">
					<input type="radio" name="gender" value="남" id="gender1">남자&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여" id="gender2">여자
				</div>
				<br>
				<div style="margin-top: -10px; width: 101%">
					<label for="tel_1"><b>전화번호</b></label><br> <input type="text"
						placeholder="전화번호 앞2~3자리" name="tel_1" id="tel_1" maxLength="3"
						style="width: 32%" required> <label for="tel_2"><b>
							- </b></label> <input type="text" placeholder="중간번호 4자리" name="tel_2"
						id="tel_2" maxLength="4" style="width: 32%" required> <label
						for="tel_3"><b> - </b></label> <input type="text"
						placeholder="뒤번호 4자리" name="tel_3" id="tel_3" maxLength="4"
						style="width: 32%" required>
				</div>
				<br> <label><b>우편번호</b></label><br> <input type="text"
					size="5" maxLength="5" name="post1" id="post1" required> <input
					type="button" value="우편검색" id='postcode'
					onclick="execDaumPostcode()"> <label><b>주소</b></label><br>
				<input type="text" size="50" name="address" id="address" required>




				<div class="clearfix">
					<button type="reset" class="cancelbtn btn btn-danger">취소</button>
					<button type="submit" class="signupbtn btn btn-primary">가입</button>


				</div>

			</fieldset>


		</div>




	</form>



	<hr style="margin-top: 4rem">


	<jsp:include page="/comm/footer_Subcribe.jsp" />
	<jsp:include page="/comm/footer_info.jsp" />





</body>
</html>