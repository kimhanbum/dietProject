<%--210812.목 마무리, 다시하기 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>today_diet</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/today_diet.css" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='js/today_diet_detail_contents.js'></script>
<style>
/* select ▼ */
.sel_wrap {
	
}

select {
	width: 50px;
	height: 32px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('images/btn_select.jpg') no-repeat 30% 50%;
	/* 화살표 아이콘 추가 */
	border-radius: 0px;
	-webkit-appearance: none; /*화살표없애기 for chrome*/
	-moz-appearance: none; /* 화살표 없애기 for firefox*/
	appearance: none; /* 화살표 없애기 공통*/
}

select::-ms-expand {
	display: none; /* 화살표 없애기 for IE10, 11*/
}

#mo_body {
	overflow: scroll;
}

.btn_submit {
	background-color: white;
	border: none;
}

.user-info-circle {
	display: inline-block;
	width: 170px;
	height: 35px;
	border-radius: 30%;
	margin: 0 auto;
	text-align: left;
}

.btn_submit {
	background-color: white;
	border: none;
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

#recordimg {
	width: 200px;
	height: 200px;
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
			<a href="mypage.my"><span class="icon-home2">&nbsp;&nbsp;</span>마이홈페이지
			</a>
			<ul>
				<hr>
				<li><p class="icon-receipt">&nbsp;&nbsp;콘텐츠</p>
					<ul>
						<li><a href="infoCheck.my">내정보</a></li>
						<li><a href="todayDiet.to">Today 식단</a></li>
						<li><a href="dietpage.dt">식단 리스트</a></li>
						<li><a href="#"></a></li>
					</ul></li>
				<hr>
				<li><p class="icon-chat_bubble_outline">&nbsp;&nbsp;댓글·방명록</p>

					<ul>
						<li><a href="dietSharePage.dt">나의 공유식단</a></li>
						<li><a href="recipePage.rc">나의 레시피</a></li>
						<li><a href="replyTo.rp">내가 남긴 댓글</a></li>
						<li><a href="replyFrom.rp">내게 남긴 댓글</a></li>
					</ul></li>
			</ul>
		</div>
	</aside>


	<!-- 마이페이지 중앙 article -->
	<article class="ftco-section">
		<div class="container"
			style="border: 1px solid black; min-height: 500px;">
			<div class="title_today" style="padding-top: 15px;">Today 식단</div>

			<hr>
			<div class="week_today">
				<button id="weekLeftbtn" type="button"
					style="background: white; border: 0px; ourline: 0px">◀</button>
				<span id="currDate">${totalinfo.total_date}</span>
				<button id="weekRightbtn" type="button"
					style="background: white; border: 0px; ourline: 0px">▶</button>
			</div>
			<hr>

			<span id="record">물/체중/운동 추가</span>
			<button type="button"
				style="background: white; border: 0px; outline: 0px">+</button>
			<div style="min-height: 30px;">
				<div class="week d-flex justify-content-around">
					<div class="p-2 user-info-circle"
						style="border: 1px solid blue; color: blue;">
						<span style="margin: 0px 12px 0px 12px">마신물</span>
						<button type="button"
							style="height: 5px; background: white; border: 0px; outline: 0px">
							-</button>
						<span>4잔</span>
						<button type="button"
							style="height: 5px; background: white; border: 0px; outline: 0px">
							+</button>
					</div>
					<div class="p-2 user-info-circle"
						style="border: 1px solid red; color: red;">
						<span style="margin: 0px 12px 0px 12px">체중</span>
						<button type="button"
							style="height: 5px; background: white; border: 0px; outline: 0px">
							-</button>
						<span>50kg</span>
						<button type="button"
							style="height: 5px; background: white; border: 0px; outline: 0px">
							+</button>
					</div>
					<div class="p-2 user-info-circle"
						style="border: 1px solid green; color: green;">
						<span style="margin: 0px 12px 0px 12px">운동</span>
						<button type="button"
							style="height: 5px; background: white; border: 0px; outline: 0px">
							-</button>
						<span>30분</span>
						<button type="button"
							style="height: 5px; background: white; border: 0px; outline: 0px">
							+</button>
					</div>
				</div>
			</div>
			<hr>
			<!-- modal detail_contents  -->
			<div class="container">
				<!-- Button to Open the Modal -->
				<span id="record">기록한 식단</span>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">+</button>

				<div style="overflow: auto; max-height: 200px;">
					<div
						style="border: 1px solid black; min-height: 400px; margin: 10px">
						<h5> 아침</h5>
						<s:out value="${bf.name}" />
						&nbsp;&nbsp;
						<s:out value="${bf.cal}" />
						kcal&nbsp;(100g 당)&nbsp; <br> 
						<img src="images/dietSnack/${bf.imgname}" onerror="this.src='images/dietSnack/imgmessage.jpg'" id="recordimg">
						<hr>
						<h5> 점심</h5>
						<s:out value="${lunch.name}" />
						&nbsp;&nbsp;
						<s:out value="${lunch.cal}" />
						kcal&nbsp;(100g 당)&nbsp; <br> 
						<img src="images/dietSnack/${lunch.imgname}" onerror="this.src='images/dietSnack/imgmessage.jpg'" id="recordimg">
						<hr>
						<h5> 저녁</h5>
						<s:out value="${dinner.name}" />
						&nbsp;&nbsp;
						<s:out value="${dinner.cal}" />
						kcal&nbsp;(100g 당)&nbsp; <br> 
						<img src="images/dietSnack/${dinner.imgname}" onerror="this.src='images/dietSnack/imgmessage.jpg'" id="recordimg">
						<hr>
						<h5> 간식</h5>
						<s:out value="${snack.name}" />
						&nbsp;&nbsp;
						<s:out value="${snack.cal}" />
						kcal&nbsp;(100g 당)&nbsp; <br> 
						<img src="images/dietSnack/${snack.imgname}" onerror="this.src='images/dietSnack/imgmessage.jpg'" id="recordimg">
						<hr>
					</div>
				</div>
			</div>
		</div>
	</article>





	<!-- 마이페이지 우측 side -->
	<aside class="ftco-section">
		<div class="asideRight_container">
			<fieldset>
				<span class='title'>목 표 / 현재 / 섭취가능</span>
				<div>
					<div class="one">
						<div>칼로리</div>
					</div>
					<div class='title'>${totalrmr} / ${totalinfo.total_cal} / ${totalrmr - totalinfo.total_cal}</div>
				</div>
				<div>
					<div class="two">
						<div>영양소</div>
						<div>탄수화물</div>
					</div>
					<div class='title'>${calcucarbpro} / ${totalinfo.total_carb} / ${calcucarbpro - totalinfo.total_carb}</div>
				</div>
				<div>
					<div class="three">
						<div>영양소</div>
						<div>단백질</div>
					</div>
					<div class='title'>${calcucarbpro} / ${totalinfo.total_protein} / ${calcucarbpro - totalinfo.total_protein}</div>
				</div>
				<div>
					<div class="four">
						<div>영양소</div>
						<div>지방</div>
					</div>
					<div class='title'>${calcufat} / ${totalinfo.total_fat} /${calcufat - totalinfo.total_fat}</div>
				</div>
				<div>
					<div class="five">
						<div>물</div>
						<div>(mL)</div>
					</div>
					<div class='title'>${calcuwater} / ${totalinfo.total_water * 240} / ${calcuwater- totalinfo.total_water}</div>
				</div>
				<%-- <div>
					<div class="six">
						<div>운동</div>
						<div>(주 150분)</div>
					</div>
					<div class='title'> / ${totalinfo.total_workout} / 600</div>
				</div> --%>
			</fieldset>
		</div>
	</aside>

	<!-- footer 영역1 -->
	<jsp:include page="../comm/footer_Subcribe.jsp" />

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />


	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content modal-xl">
				<!-- Modal Header -->
				<div class="modal-header">
					<!-- 파일 불러오기 이미지 처리 -->
					<div class="fileimg">
						<label for="upfile"> <img src="images/openimg.png"
							alt="파일첨부" class="openimg">
						</label>
					</div>
					<input type="file" id="upfile" name="detailfile" accept="image/*">
					<span id="filevalue"></span> <label for="meal_choice"></label> <span
						id="domain" style="width: 80px; color: black; margin: auto;">아침</span>
					<select name="downbtn" id="downbtn"
						style="height: 10px; border: none; margin: auto 74px auto 0px;">
						<option value=""></option>
						<option value="아침" selected>아침</option>
						<option value="점심">점심</option>
						<option value="저녁">저녁</option>
						<option value="간식">간식</option>
					</select>

					<!-- submodal 이동버튼 -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#submodal">meal</button>

					<!-- modal 창 닫기 버튼 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<textarea id="mo_body2" rows="5" cols="60"
						style="border-top-style: none; resize: none"></textarea>
					<p id="showimgfile"></p>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="btn_submit" id="btn_submit" type="submit">
						<img src="images/btn_check.jpg" alt="btn_check">
					</button>
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
					<h4 class="modal-title">Meal</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- SubModal body -->
				<div class="modal-body">
					<div class="snack_container">
						<img src="images/dietSnack/kimstew.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1"
							onclick='Chk();'>
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/kimrice.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1"
							onclick='Chk();'>
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/pork.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1"
							onclick='Chk();'>
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/hotdog.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1"
							name="snackimg">
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/hamburger.jpg" class="imgsnack"
							name="snackimg"> <input type="checkbox"
							class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/soystew.jpg" class="imgsnack"
							name="snackimg"> <input type="checkbox"
							class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/jaeyuk.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/mul.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/bibim.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/pizza.png" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/soynoodle.jpg" class="imgsnack">
						<input type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/sundu.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/haemulrice.jpg" class="imgsnack">
						<input type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/man.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/pasta.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/tang.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/jajang.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/jjam.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/porkrib.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/sobul.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/chickenrib.jpg" class="imgsnack">
						<input type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/haemulcal.jpg" class="imgsnack">
						<input type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/tteok.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/sundae.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/fried.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/cake.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/tira.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/muffin.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/brownie.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/cheesecake.jpg" class="imgsnack">
						<input type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/cookie.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/waffle.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/darkchoco.jpg" class="imgsnack">
						<input type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/garlic.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/pudding.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/icecream.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/chip.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/applepie.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/milk.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/sandwich.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
					<div class="snack_container">
						<img src="images/dietSnack/yogurt.jpg" class="imgsnack"> <input
							type="checkbox" class="snack_checkbox" id="check1" />
					</div>
				</div>

				<!-- SubModal footer -->
				<div class="modal-footer">
					<button class="btn_submit" type="submit">
						<img src="images/btn_check.jpg" alt="btn_check">
					</button>
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
	});
 });
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


	<!-- submodal 이미지 미리보기 -->
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
}) <!--  $('input[type=file]').change() end   -->
</script>



	<!-- 서브모달 체크박스 이미지 모달에 띄우기 -->
	<script>
$('input:checkbox[name=snackimg]:checked').each(function(){
	var checkVal = $(this).val();  //체크된 값의 value값 가져오기
	console.log(checkVal);
	
	
/* 	reader.onload = function(event){
		$('#myModal p ').append('<img  class="textimg" src="' 
	              + event.target.result + '">');
    };  */
});

</script>






	<%-- 요일 버튼
<script>
   function Chk() {
	   var reault = 
   }
	
</script>
 --%>

	<!-- 서브모달 선택이미지 모달에 미리보기 0819-->
	<%-- 
<script>
reader.onload = function(event) {
    $('button[type=submit]').change(function(event){
       console.log('change');
           reader.onload = function(event){
             $('#mymodal p ').append('<img class="textimg" src="'
                                     + event.target.result + '">');
           };
})
</script>
--%>



</body>
</html>