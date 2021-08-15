<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지 기본양식 입니다</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/mymessage_from_form.css" type="text/css">
<link rel="stylesheet" href="../css/modify_user_info.css" type="text/css">
<style>
/* 버튼을 해당 행에 놓을 경우에만 보이도록 표시 */

h1 {
	font-size: 1.5rem;
	text-align: center;
	color: #1a92b9
}

label {
	font-weight: bold
}

#upfile {
	display: none
}

img {
	width: 20px;
}

.form-group>button:nth-child(1):hover{
     background-color:white; 
     color:red;
}
.cancel, .confirm {
	float: left;
	width: 30%;
	margin: 5px 25px;
}
.confirm:hover{
	background-color:#8cbb4c !important;
	color:white !important;
}

/**/
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
					<h1 class="mb-0 bread">내 정보 수정</h1>
				</div>
			</div>
		</div>
	</div>

	<!-- 마이 페이지 좌측 side 메뉴들 -->
	<aside class="ftco-section">
		<div class="asideLeft_container">
			<div>
			<a href="#"><span class="icon-home2">&nbsp;&nbsp;</span>마이홈페이지 </a>			
			<ul>
				<hr>
				<li><p class="icon-receipt">&nbsp;&nbsp;콘텐츠</p>
					<ul>
						<li><a href="#">내정보</a></li>
						<li><a href="#">Today 식단</a></li>
						<li><a href="#">식단 리스트</a></li>
						<li><a href="#"></a></li>
					</ul>
				</li>
				<hr>
				<li><p class="icon-chat_bubble_outline">&nbsp;&nbsp;댓글·방명록</p>
					
					<ul>
						<li><a href="#">나의 공유식단</a></li>
						<li><a href="#">나의 레시피</a></li>
						<li><a href="#">내가 남긴 댓글</a></li>
						<li><a href="#">내게 남긴 댓글</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</div>
	</aside>

	<!-- 마이페이지 중앙 article -->
	<article >
		
		<div class="article_container">
			
			   
			
	   <form name="myform" method="get" action="send.html"
	id='myform' style="width:60%" >
	
	<div class="containner">
	<fieldset style="margin-left:-50px" >
	
	<div style="margin-left:20%;margin-top:20px;color:white;">
	<label for="goal" style="margin-top:30px"><b>목표</b></label><br>	
	<div style="display:inline-block">
	<input type="radio" name="goal" value="m" id="gender1">체중감량
	</div>
	
	<div style="margin-left:20%;display:inline-block">
	<input type="radio" name="goal" value="f" id="gender2">체중유지
	</div>
	
	<div style="margin-left:20%;display:inline-block">
	<input type="radio" name="goal" value="f" id="gender3">체중증가
	</div>	
	</div>
	
	<br>
	<div style="margin-left:20%; margin-bottom:20px;margin-top:20px">
	<div style="display:inline-block; width:32%">
	<label for="tel_1"><b>&nbsp;&nbsp;&nbsp;&nbsp;키</b></label><br>
	<input type="text"  name="tel_1" id="tel_1" 
	         maxLength="3" style="width:55%">
	<label for="tel_2"><b>cm&nbsp;&nbsp; </b></label>
	</div>      
	         
	<div style="display:inline-block; width:32%">        
	<label for="tel_1"><b>체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중</b></label><br>
	<input type="text"  name="tel_2" id="tel_2"  
	         maxLength="3"  style="width:55%">
	 <label for="tel_3"><b> kg </b></label>        
	</div> 
	
	<div style="display:inline-block; width:32%">        
	<label for="tel_1"><b>목표체중</b></label><br>
	<input type="text"  name="tel_3" id="tel_3"  
	         maxLength="3" style="width:55%"> 
	 <label for="tel_3"><b> kg </b></label>         
	</div>                
	</div>
	
	 
	 <div class ="clearfix"style="margin-left:17%;margin-bottom:25px">
	 <button type="reset" class="cancelbtn btn btn-danger" style="width:30%">취소</button>
	 <button type="submit" class="signupbtn btn btn-primary" style="width:30%;margin-left:15%" >수정완료</button>
	 
	 
	 </div>
	 
	</fieldset>
	
	
	</div>
	
	
	
	
	</form>
	 
			
		</div>
		

	</article>
	
	<!-- 마이페이지 우측 side -->
	<aside class="ftco-section">
	</aside>

	<!-- footer 영역1 -->
 	<jsp:include page="../comm/footer_Subcribe.jsp" />  

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />  

</body>
</html>