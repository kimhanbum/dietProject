<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지 기본양식 입니다</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/mymessage_from_form.css" type="text/css">
<link rel="stylesheet" href="css/login_style.css" type="text/css">
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
	
	width:33%;
	
}
.confirm{
   margin-left:90px;
 
}
.cancel{
   margin-left: 44px;

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
					<h1 class="mb-0 bread">개인 정보 확인</h1>
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
			
			   
			
			<form  id='my-form' action="메인.html" method="get"  >
	<div class="main" style="margin-top:-70px"> 

		<div class="login-form"  >
			<h2>개인 정보 확인</h2> 
			<div class="agileits-top"  style="margin-top:-30px">
				
					<div class="styled-input">
						<input type="text" name="name" id='name' 
						       required oninvalid="setCustomValidity('이름을 입력하세요');" 
						       oninput="setCustomValidity('');"/>
						<label>아이디</label>
					
					</div>
					<span id=span1></span><br>
					<div class="styled-input">
						<input type="password" name="pass" id='pass' 
						       required oninvalid="setCustomValidity('비밀번호를 입력하세요');"
						        oninput="setCustomValidity('');"> 
						<label>비밀번호</label>
						
					</div> 
					<span id=span2></span><br>
					<div class="styled-input">
						<input type="password" name="passCheck" id='passCheck' 
						       required oninvalid="setCustomValidity('비밀번호를 다시 입력하세요');"
						        oninput="setCustomValidity('');"> 
						<label>비밀번호 재입력</label>
						
					</div> 
					<span id=span3></span><br>
			       
			       <div class="clearfix" >
			       <button class="cancel btn btn-danger" type="reset">취소</button> 
			       <button class="confirm btn btn-primary" type="submit">확인</button>
			       </div>
			</div>
			
			
		</div>	
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