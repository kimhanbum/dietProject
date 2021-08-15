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
.cancel, .next {
	float: left;
	width: 40%;
	
}

.next{
  margin-left:100px;
}
.cancel{
   margin-left:-20px;

}
.next:hover{
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
					<h1 class="mb-0 bread">내정보 수정</h1>
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
	id='myform' >
	
	<div class="containner">
	<fieldset style="padding: 0 10px;" >
	
	<label for="pass" style="margin-top:30px"><b>비밀번호</b></label>
	<input type="password" placeholder="비밀번호를 입력하세요(문자,숫자,특수문자로 구성된 8~15자리입니다)" name="pass" id="pass">
	<span id='span5'>비밀번호를 입력하세요</span><br>
	
	<div style="margin-top:-20px;width:100.3%">
	<label for="pass_" ><b>비밀번호 재입력</b></label><br>
	<input type="password" placeholder="비밀번호를 다시 입력하세요" name="pass" id="pass_" >
	<input type="button" value="확인"  id='passcheckConfirm' style="margin-right:3px" ><br>
	<span id='span5'>비밀번호를 다시 입력하세요</span><br>
	</div>
	
	
	
	<label for="email"><b> E-Mail </b></label><br>
	<input type="text" name="email" id="email"> <span style="color:white">@</span>
	<input type="text" name="domail" id="domain"> 
	<select name="sel" id="sel"  >
	            <option value="">직접입력</option>
	            <option value="naver.com">naver.com</option>
	             <option value="daum.com">daum.com</option>
	                <option value="nate.com">nate.com</option>
	                 <option value="gmail.com">gmail.com</option>
	
	
	</select>
	
	<br>
	<div style="margin-top:-10px;width:102.3%">
	<label for="tel_1"><b>전화번호</b></label><br>
	<input type="text" placeholder="전화번호 앞2~3자리" name="tel_1" id="tel_1" 
	         maxLength="3" style="width:30%">
	       
	         
	<label for="tel_2"><b> - </b></label>
	<input type="text" placeholder="중간번호 4자리" name="tel_2" id="tel_2"  
	         maxLength="4"  style="width:32%">
	<label for="tel_3"><b> - </b></label>
	<input type="text" placeholder="뒤번호 4자리" name="tel_3" id="tel_3"  
	         maxLength="4" style="width:32%">        
	</div>
	 <br>
	 
	 <div style="width:100.3%">
	 <label><b>우편번호</b></label><br>
	 <input type="text" size="5" maxLength="5" name="post1" id="post1">
	 <input type="button" value="우편검색" id='postcode'  >
	 </div>


     <label><b>주소</b></label><br>
	 <input type="text" size="50"  name="address" id="address">
	 
	 
	 
	 
	 <div class ="clearfix" style="margin-left:90px">
	 <button type="reset" class="cancel btn btn-danger">취소</button>
	 <button type="submit" class="next btn btn-primary" >다음</button>
	 
	 
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