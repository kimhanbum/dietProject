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
.snack_container{
	width: 160px !important;
	padding-right: 0px !important;
}
/* 
.snack_container {
	position: relative;
	width: 100px;
	height: 100px;
	float: left;
	margin: 20px;
}
*/
.snack_checkbox {
	position: absolute;
    left: 18px;
    top: 29px;
} 

#recordimg {
	width: 200px;
	height: 200px;
}
.snack_container > div{
	text-align: center;
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
					<button type="button" id="mealCheck" class="btn btn-primary" data-toggle="modal"
						data-target="#submodal">meal</button>
					<br>
						<!-- submodal 이동버튼 -->
					<button type="button" id="dietCheck" class="btn btn-primary" data-toggle="modal"
						data-target="#submodal2">Diet</button>

					<!-- modal 창 닫기 버튼 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div id="selectedMealDiet" class="modal-body">
<%-- 					<img src="images/dietSnack/pork.jpg" id="recordimg">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span> 돈까스</span>
					 <s:out value="돈까스" /> 
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span> 500kcal</span>
					 <s:out value="500" />kcal&nbsp;&nbsp;  --%>
					<!-- <textarea id="mo_body2" rows="5" cols="60"
						style="border-top-style: none; resize: none"></textarea>
					<p id="showimgfile"></p> -->
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="insertTotalInfo" class="btn_submit" id="btn_submit" type="submit">
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
					<button type="button" class="close" data-dismiss="modal">x</button>
				</div>

				<!-- SubModal body -->
				<div id="mealbody" class="modal-body">
				</div>

				<!-- SubModal footer -->
				<div class="modal-footer">
					<button id="selectMeal" class="btn_submit" type="submit">
						<img src="images/btn_check.jpg" alt="btn_check">
					</button>
				</div>

			</div>
		</div>
	</div>


		<!--submodal-->
	<!-- The Modal -->
	<div class="modal" id="submodal2">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- SubModal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Diet</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- SubModal body -->
				<div id="dietbody" class="modal-body">
				</div>

				<!-- SubModal footer -->
				<div class="modal-footer">
					<button id="selectDiet"class="btn_submit" type="submit">
						<img src="images/btn_check.jpg" alt="btn_check">
					</button>
				</div>

			</div>
		</div>
	</div>
	
	<input type="hidden" id="loginid" value="${id}" name="loginid">
	
</body>
</html>