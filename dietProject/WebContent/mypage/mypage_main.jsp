<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>mypage_main</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/myPage.css" type="text/css">
<style>
#content.section_home {
	line-height: 14px;
	zoom: 1;
	padding: 16px 12px 94px;
}

#content {
	position: relative;
	padding: 32px 51px 95px;
}

.section_home .column {
	float: left;
	width: 50%;
}

.sh_group {
	min-height: 185px;
}

.sh_group, .sh_group2, .sh_group3, .sh_group4 {
	margin: 16px 8px 0;
	padding: 32px 29px 30px;
	text-align: left;
	border: 1px solid #dadada;
	border-radius: 2px;
	background: #fff;
}

.section_home .column+.column {
	float: none;
	overflow: hidden;
	width: auto;
}

.section_home .desc_sub {
	padding-left: 8px;
}

.desc_sub {
	font-size: 12px;
	line-height: 14px;
	clear: left;
	padding-top: 15px;
	letter-spacing: -1px;
	color: #899197;
}

.section_home .desc_sub {
	padding-left: 8px;
}

.desc_sub+.desc_sub {
	padding-top: 14px;
}



.section_home .btn_area_btm {
	font-size: 0;
	padding: 17px 0 0 1px;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
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
						<li><a href="#">내정보</a></li>
						<li><a href="#">Today 식단</a></li>
						<li><a href="#">식단 리스트</a></li>
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
		<div id="content" class="section_home">
		 <h2 align="center">My 페이지</h2>
		 <hr>
			<div class="column">
				<!-- 내 정보 -->
				<div class="sh_group">
					<div class="sh_header">
						<h5>내 정보</h5>
					</div>
					<div style="position : absolute; left:10px; bottom:113px;"class="sh_content">
					<a href="연결할주소" class="btn_model" 
					    onclick="clicker"><b class="btn2">관리</b></a>
					</div>
				</div>
				
				<!-- 내 식단 리스트 -->
				<div class="sh_group">
					<div class="sh_header">
						<h5>내 식단 리스트</h5>
					</div>
					 <div style="position : absolute; left:10px; top:468px;" class="sh_content">
						<a href="연결할주소" class="btn_model"
							onclick="clicker"><b
							class="btn2" >관리</b></a>
					</div>
				</div>
			</div>
			<div class="column" style="positon:relative;">
				<!-- 식단 -->
				<div class="sh_group ">
					<div class="sh_header">
						<h5>Today 식단</h5>
					</div>
					<div style="position:absolute; z-index:1; top:247px" class="sh_content">
					<br>
					<a style="margin-left:-40px;" href="연결할주소" class="btn_model"onclick="clicker"><b class="btn2" >관리</b></a>
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
					<div class='title'>1750 / 850 / 900</div>
				</div>
				<div>
					<div class="two">
						<div>영양소</div>
						<div>탄수화물</div>
					</div>
					<div class='title'>100 / 70 / 30</div>
				</div>
				<div>
					<div class="three">
						<div>영양소</div>
						<div>단백질</div>
					</div>
					<div class='title'>100 / 60 / 40</div>
				</div>
				<div>
					<div class="four">
						<div>영양소</div>
						<div>지방</div>
					</div>
					<div class='title'>100 / 50 / 50</div>
				</div>
				<div>
					<div class="five">
						<div>물</div>
					</div>
					<div class='title'>8잔 / 5잔 / 3잔</div>
				</div>
				<div>
					<div class="six">
						<div>운동</div>
					</div>
					<div class='title'>800kcal / 200kcal / 600kcal</div>
				</div>
			</fieldset>
		</div>
	</aside>

	<!-- footer 영역1 -->
	<jsp:include page="../comm/footer_Subcribe.jsp" />

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />

</body>
</html>