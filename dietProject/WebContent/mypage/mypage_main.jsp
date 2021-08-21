<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>mypage_main</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage.css" type="text/css">
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

<!-- 마이 페이지 좌측 asideLeft 메뉴들 -->
<jsp:include page="../comm/asideLeft.jsp"/>




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
					<div style="position : absolute; left:50px; bottom:114px;"class="sh_content">
					<a href="${pageContext.request.contextPath}/infoCheck.my" class="btn_model" 
					    onclick="clicker"><b class="btn2">관리</b></a>
					</div>
				</div>
				
				<!-- 내 식단 리스트 -->
				<div class="sh_group">
					<div class="sh_header">
						<h5>내 식단 리스트</h5>
					</div>
					 <div style="position : absolute; left:50px; top:463px;" class="sh_content">
						<a href="${pageContext.request.contextPath}/dietpage.dt" class="btn_model"
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
					<a style="margin-left:-3px;" href="${pageContext.request.contextPath}/todayDiet.to" class="btn_model"onclick="clicker"><b class="btn2" >관리</b></a>
				</div>
			</div>
		    </div>
		</div>
	</article>
	
	
	
	


	<!-- footer 영역1 -->
	<jsp:include page="../comm/footer_Subcribe.jsp" />

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />

</body>
</html>