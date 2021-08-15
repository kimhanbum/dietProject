<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../comm/header.jsp"/>
<link href="../css/login_style.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body class="goto-here">

	<div class="hero-wrap hero-bread"
		style="background-image: url('../images/bg_1.jpg');">
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
    
	<div class="container" style="margin-top:2px">
	<form  id='my-form' action="메인.html" method="get"  >
	<div class="main" > 

		<div class="login-form" style="width:50%"  >
			<h2>LogIn</h2> 
			<div class="agileits-top" style="margin-top:-30px">
				
					<div class="styled-input">
						<input type="text" name="name" id='name' 
						       required oninvalid="setCustomValidity('이름을 입력하세요');" 
						       oninput="setCustomValidity('');" >
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
					<div class="wthree-text"> 
						<ul> 
							<li>							
								<button id="register">회원가입</button>  
							</li>
							<li> <button id="findpassword">비밀번호 찾기</button></li>
						</ul>
						<div class="clear"> </div>
						 
					</div>  
			        
			       
			       
			</div>
			
			<div class="agileits-bottom">
				
					      <input type="submit" value="로그인" >
				
			</div>	
		</div>	
	</div>
	
		
</form>
</div>


	<hr style="margin-top:4rem">


	<jsp:include page="../comm/footer_Subcribe.jsp"/>
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>