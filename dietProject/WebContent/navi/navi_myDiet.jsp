<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>My 식단 페이지 입니다.</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage.css" type="text/css">
<link href='${pageContext.request.contextPath}/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/packages/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/packages/timegrid/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/packages/timegrid/main.js'></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 800px;
    margin: 0 auto;
  }
  #btn-group{
  	margin: 0 auto;
  }
  #colorList{
  	margin: 0 auto; width: 800px;
  }
  .color-circle{
  	display:inline-block;
	width:40px; height:30px;
	border-radius:90%;
	text-align:center;
	margin:0 auto;
	vertical-align:middle;
  }
  .color-info{
  	vertical-align:middle; 
  	margin-right:50px;
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
						<span class="mr-2"><a href="mypage.my">Home</a></span> <span>Diet</span>
					</p>
					<h1 class="mb-0 bread">My Diet</h1>
				</div>
			</div>
		</div>
	</div>

	<!-- 헤더 영역  -->
 	<jsp:include page="../comm/asideLeft.jsp" />  
 	

	<!-- 마이페이지 중앙 article -->
	<article class="ftco-section">
		<div style="border:1px solid black;">
			<div class="d-flex justify-content-around mb-3" style="margin:16px 0px 0px 0px !important">
		 		<button id="prev" class="p-2 btn btn-dark">이전달</button>
		 		<div id="yearMonth" style="vertical-align: center; font-size: 30px;"></div>
	  			<button id="next" class="p-2 btn btn-dark">다음달</button>
	  		</div>
	  		<br>
	  		<div id="colorList">
	  			<div class="color-circle" style="background-color:green;"></div>
	  			<span class="color-info">&nbsp;아침</span>
	  			<div class="color-circle" style="background-color:orange;"></div>
	  			<span class="color-info">&nbsp;점심</span>
	  			<div class="color-circle" style="background-color:yellow;"></div>
	  			<span class="color-info">&nbsp;저녁</span>
	  			<div class="color-circle" style="background-color:blue;"></div>
	  			<span class="color-info">&nbsp;간식</span>
	  			<div class="color-circle" style="background-color:pink;"></div>
	  			<span class="color-info">&nbsp;물</span>
	  		</div>
  		 	
	  		<br>
	  		<div id='calendar'></div>
	  		<br>
	  		
  		</div>
	</article>
	
	<!-- footer 영역1 -->
 	<jsp:include page="../comm/footer_Subcribe.jsp" />  

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />  
	<script type="text/javascript" src="js/navi_mydietCalendar.js" charset="utf-8"></script>
</body>
</html>