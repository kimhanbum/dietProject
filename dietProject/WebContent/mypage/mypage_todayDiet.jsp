<%--210812.목 마무리, 다시하기 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>today_diet</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/today_diet.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src='js/today_diet_detail_contents.js'></script>
<style>
/* select ▼ */
.sel_wrap{ }

select{ 
width: 50px;
height: 32px;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
background: url('images/btn_select.jpg') no-repeat 30% 50%;  /* 화살표 아이콘 추가 */
border-radius: 0px;
-webkit-appearance: none; /*화살표없애기 for chrome*/
-moz-appearance: none;  /* 화살표 없애기 for firefox*/
appearance: none; /* 화살표 없애기 공통*/
}
select::-ms-expand {
    display: none;  /* 화살표 없애기 for IE10, 11*/
}
#mo_body{ overflow: scroll;}

.btn_submit{
    background-color:white; 
    border:none;
    }
.user-info-circle{
  	display:inline-block;
	width:170px; height:35px;
	border-radius:30%;
	margin:0 auto;
	text-align: left;
}    
 
.btn_submit{
    background-color:white; 
    border:none;
    }
    
.snack_container { 
	position: relative; 
	width: 100px; 
	height: 100px; 
	float: left; 
	margin: 20px; 
}

.snack_checkbox { 
	position: absolute !important; 
	bottom: 84px !important; 
	right: 84px !important; 
}

</style>

</head>
<body class="goto-here">

	<!-- 헤더 영역  -->
	<jsp:include page="../comm/header.jsp" />

	<!-- 중간 이미지 & 텍스트 출력부 -->
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">My</a></span> <span>home</span>
					</p>
					<h1 class="mb-0 bread">마이페이지</h1>
				</div>
			</div>
		</div>
	</div>

	<!-- 마이 페이지 좌측 side 메뉴들 -->
	<aside class="ftco-section">
		<div class="asideLeft_container">
			<a href="#"><span class="icon-home2">&nbsp;&nbsp;</span>마이홈페이지 </a>
			<ul>
				<hr>
				<li><p class="icon-receipt">&nbsp;&nbsp;콘텐츠</p>
					<ul>
						<li><a href="${pageContext.request.contextPath}/infoCheck.my">내정보</a></li>
						<li><a href="${pageContext.request.contextPath}/dietDetail.to">Today 식단</a></li>
						<li><a href="${pageContext.request.contextPath}/dietpage.dt">식단 리스트</a></li>
						<li><a href="#"></a></li>
					</ul></li>
				<hr>
				<li><p class="icon-chat_bubble_outline">&nbsp;&nbsp;댓글·방명록</p>

					<ul>
						<li><a href="#">나의 공유식단</a></li>
						<li><a href="#">나의 레시피</a></li>
						<li><a href="#">내가 남긴 댓글</a></li>
						<li><a href="#">내게 남긴 댓글</a></li>
					</ul></li>
			</ul>
		</div>
	</aside>


	<!-- 마이페이지 중앙 article -->
	<article class="ftco-section">
		<div class="container" style="border:1px solid black; min-height: 500px;">
			<div class="title_today" style="padding-top: 15px;">
			   Today 식단
			</div>
			   
			<hr>
			<div class="week_today">
			    2021.07.21.수요일
			</div>
			<hr>

			<div class="week d-flex justify-content-around">
			 <a href="이동될 페이지 주소" target="blank" style="padding:0px">
				<img src="images/pointer_left.png" alt="pointer_left"
						  class="pointer_left">  
			 </a> 
		     <input class="sun" type="button" value="일"></input> 
			 <input class="mon" type="button" value="월"></input>
			 <input class="tue" type="button" value="화"></input> 
			 <input class="wed" type="button" value="수"></input> 
			 <input class="thu" type="button" value="목"></input> 
			 <input class="fri" type="button" value="금"></input>
			 <input class="sat" type="button" value="토"></input> 
			 <a href="이동될 페이지 주소" target=_blank>
			 <img src="images/pointer_right.png" alt="pointer_right"
				  class="pointer_right" >
			 </a> 
			</div>
			
			<!-- Button to Open the Modal -->
			<hr>
			
			<span id="record">물/체중/운동 추가</span> 
			<button type="button" style="background:white; border:0px;outline:0px">
			    +
			</button>
			<div style="min-height: 30px;">
			    <div class="week d-flex justify-content-around">
			    	<div class="p-2 user-info-circle" style="border: 1px solid blue; color:blue;">
			    		<span style="margin:0px 12px 0px 12px">마신물</span>
			    		<button type="button" style="height:5px;background:white; border:0px;outline:0px">
			    			-
						</button>
						<span>4잔</span>
						<button type="button" style="height:5px;background:white; border:0px;outline:0px">
			    			+
						</button>
			    	</div>
			    	<div class="p-2 user-info-circle" style="border: 1px solid red; color:red;">
			    		<span style="margin:0px 12px 0px 12px">체중</span>
			    		<button type="button" style="height:5px;background:white; border:0px;outline:0px">
			    			-
						</button>
						<span>50kg</span>
						<button type="button" style="height:5px;background:white; border:0px;outline:0px">
			    			+
						</button>
			    	</div>
			    	<div class="p-2 user-info-circle" style="border: 1px solid green; color:green;">
			    		<span style="margin:0px 12px 0px 12px">운동</span>
			    		<button type="button" style="height:5px;background:white; border:0px;outline:0px">
			    			-
						</button>
						<span>30분</span>
						<button type="button" style="height:5px;background:white; border:0px;outline:0px">
			    			+
						</button>
			    	</div>
			    </div>
			</div>
			<hr>

				
				
				
				
				
				
	<!-- modal detail_contents  -->
	<div class="container">
  <!-- Button to Open the Modal -->
  <span id="record">기록한 식단</span> 
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    +
  </button>
  
  <div style="overflow:auto;max-height:200px;">
			  	<div style="border:1px solid black; min-height:100px;margin:10px">
			  	</div>
			  	<div style="border:1px solid black; min-height:100px;margin:10px">
			  	</div>
			  	<div style="border:1px solid black; min-height:100px;margin:10px">
			  	</div>
			</div>
		</div>
		</div>
	</article>	


  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content modal-xl">
              <!-- Modal Header -->
        <div class="modal-header">
        <!-- 파일 불러오기 이미지 처리 -->
        <div class="fileimg">
           <label for="upfile"> 
             <img src="images/openimg.png" alt="파일첨부" class="openimg">
           </label>
        </div>
        <input type="file" id="upfile" name="detailfile" accept="image/*">
        <span id="filevalue"></span>
        
        <label for="meal_choice"></label>
        <span id="domain" style="width:80px; color:black; margin:auto;">아침</span>
       	<select name="downbtn" id="downbtn" style="height:10px; border:none; margin:auto 74px auto 0px; ">
               <option value=""></option>
               <option value="아침" selected>아침</option>
               <option value="점심">점심</option>
               <option value="저녁">저녁</option>
               <option value="간식">간식</option>
       	</select> 

        
         <!-- submodal 이동버튼 -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#submodal">
    		meal
  		</button>
	      
	      
	      
	      
	      <!-- modal 창 닫기 버튼 -->
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <textarea id="mo_body2" rows="5" cols="60" style="border-top-style:none;resize:none"></textarea>
        </p>
        
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button class="btn_submit" id="btn_submit" type="submit" onclick="ex3:클릭시 이동 할 주소">
             <img src="images/btn_check.jpg" alt="btn_check"  ></button>  
        </div>
        
      </div>
    </div>
  </div>

<!--submodal-->
<!-- The Modal -->
  <div class="modal" id="submodal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- SubModal Header -->
        <div class="modal-header">
          <h4 class="modal-title" >Meal</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
         <!-- SubModal body -->
        <div class="modal-body">
			<div class="snack_container">
			<div class="snack_container">
	    			<img src="images/dietSnack/감자칩.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
	    			<img src="images/dietSnack/김치볶음밥.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/김치찌개.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/다크초콜릿.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/닭갈비.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/돈까스.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/돼지갈비.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/된장찌개.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/떡볶이.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/마늘빵.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/만두.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/머핀.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/물냉면.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/브라우니.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/비빔냉면.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/샌드위치.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/생크림케이크.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/소불고기.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="../images/dietSnack/순대.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/순두부찌개.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/애플파이.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/와플.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/요거트.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/우유.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/제육볶음.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/짜장면.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/짬뽕.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/치즈케이크.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/콩국수.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/쿠키.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/탕수육.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/튀김.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/티라미슈.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/파스타.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/푸딩.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/피자.png" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/핫도그.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/해물볶음밥.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/해물칼국수.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
			<div class="snack_container">
	    			<img src="images/dietSnack/햄버거.jpg" class="imgsnack">
	    			<input type="checkbox" class="snack_checkbox" id="check1" />
			</div>
        </div>
        
        <!-- SubModal footer -->
        <div class="modal-footer">
          <button class="btn_submit" type="submit" data-dismiss="modal" >
           <img src="images/btn_check.jpg" alt="btn_check"  ></button>
        </div>
        
      </div>
    </div>
  </div>
  
	  <!--  모달 저장 -->	 
<script>
 $(#btn_submit).on('click', function(){
	$.ajax({
		url:'${pageContext.request.contextPath}/',
		type: 'post',
		succes: function(result){
			$(#btn_submit).modal('show');
			console.log(result);
		}
		
		
	})
	
	 
 })
		 
		 
</script>


		 
		<!-- 서브모달 -->
<script>
	$(document).ready(function() {
		$('#submodal').on('beforeShow', function() {
			console.log('Submodal beforeShow event');
		}).on('show', function() {
			console.log('Submodal show event');
		}).on('beforeHide', function() {
			console.log('Submodal beforeHide event');
		}).on('hide', function() {
			console.log('Submodal hide event');
		});
	});
</script>		
		

	<!-- 마이페이지 우측 side -->
	<aside class="ftco-section">
		<div class="asideRight_container">
			<fieldset>
				<span class='title'>목 표 / 현재 / 섭취가능</span>
				<div>
					<div class="one">
						<div>칼로리</div>
					</div>
					<div class='title'>1750 / ${totalinfo.total_cal} / 900</div>
				</div>
				<div>
					<div class="two">
						<div>영양소</div>
						<div>탄수화물</div>
					</div>
					<div class='title'>100 / ${totalinfo.total_carb} / 30</div>
				</div>
				<div>
					<div class="three">
						<div>영양소</div>
						<div>단백질</div>
					</div>
					<div class='title'>100 / ${totalinfo.total_protein} / 40</div>
				</div>
				<div>
					<div class="four">
						<div>영양소</div>
						<div>지방</div>
					</div>
					<div class='title'>100 / ${totalinfo.total_fat} / 50</div>
				</div>
				<div>
					<div class="five">
						<div>물</div>
					</div>
					<div class='title'>8잔 / ${totalinfo.total_water} / 3잔</div>
				</div>
				<div>
					<div class="six">
						<div>운동</div>
						<div>(kcal)</div>
					</div>
					<div class='title'>800 / ${totalinfo.total_workout} / 600</div>
				</div>
			</fieldset>
		</div>
	</aside>

	<!-- footer 영역1 -->
	<jsp:include page="../comm/footer_Subcribe.jsp" />

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />


<script>
$('input[type=file]').change(function(event){
   console.log('change');
	  var inputfile = $(this).val().split('\\');
	  var filename=inputfile[inputfile.length - 1];
	  var pattern = /(gif|jpg|jpeg|png)$/i;//플래그 i는 대소문자 구분 없는 검색
	  if (pattern.test(filename)) {
			$('#filename').text(filename);//inputfile.length - 1=2
	      
			var reader = new FileReader(); //파일을 읽기 위한 객체 생성		       
	     //DataURL 형식으로 파일을 읽어옵니다. 
	     //읽어온 결과는 reader객체의 result 속성에 저장됩니다.
	     //event.target.files[0] : 선택한 그림의 파일객체에서 첫번째  객체를 가져옵니다.
		   reader.readAsDataURL(event.target.files[0]);
	         
	       reader.onload = function(event) {//읽기에 성공했을 때 실행되는 이벤트 핸들러	
		     $('#myModal p ').append('<img  class="textimg" src="' 
		    		              + event.target.result + '">');
	       }; 
		}else{
			alert('확장자는 gif, jpg, jpeg, png가 가능합니다.');
		}
})//$('input[type=file]').change() end
</script>



</body>
</html>