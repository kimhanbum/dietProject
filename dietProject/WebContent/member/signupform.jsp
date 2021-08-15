<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../comm/header.jsp"/>
<link href="css/signup_style.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body class="goto-here">

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
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
    
	
	  <form name="myform" method="get" action="send.html"
	id='myform' >
	
	<div class="containner">
	<fieldset style="padding:5px" >
	
	<label for="id" style="margin-top:30px"><b>아이디</b></label>
	<div>
	<input type="text" placeholder="아이디를 입력하세요" name="id" id="id">
	<input type="button" value="ID중복체크"  id='idcheck' ><br>
	
	</div>
	<label for="pass"><b>비밀번호</b></label>
	<input type="password" placeholder="비밀번호를 입력하세요(문자,숫자,특수문자로 구성된 8~15자리입니다)" name="pass" id="pass">
	<span id='span5'>비밀번호를 입력하세요</span><br>
	
	<div style="margin-top:-20px">
	<label for="pass_" ><b>비밀번호 재입력</b></label>
	<input type="password" placeholder="비밀번호를 다시 입력하세요" name="pass" id="pass_">
	<span id='span5'>비밀번호를 다시 입력하세요</span><br>
	</div>
	
	<div style="margin-top:2px">
	<label for="name"><b>이름</b></label>
	<input type="text" placeholder="비밀번호를 다시 입력하세요" name="pass" id="name">
	<span id='span5'>이름을 입력하세요</span><br>
	</div>
	
	<div style="margin-top:-20px">
	<label for="birth_year"><b>출생년월일</b></label>
	<div >
	<input type="text" placeholder="출생년도4자리" name="birth_year" id="birth_year" style="width:35%">
	<span>년</span>
	<select name="birth_month" id="birth_month"  style="width:29%;color:white">
	            <option value=""></option>
	            <option value="1">1</option>
	            <option value="2">2</option>
	            <option value="3">3</option>
	            <option value="4">4</option>
	            <option value="5">5</option>
	            <option value="6">6</option>
	            <option value="7">7</option>
	            <option value="8">8</option>
	            <option value="9">9</option>
	            <option value="10">10</option>
	            <option value="11">11</option>
	            <option value="12">12</option>	
	</select>
	<span>월</span>
	<select name="birth_day" id="birth_day"  style="width:28% ;color:white">
	            <option value=""></option>
	            <option value="1">1</option>
	            <option value="2">2</option>
	            <option value="3">3</option>
	            <option value="4">4</option>
	            <option value="5">5</option>
	            <option value="6">6</option>
	            <option value="7">7</option>
	            <option value="8">8</option>
	            <option value="9">9</option>
	            <option value="10">10</option>
	            <option value="11">11</option>
	            <option value="12">12</option>
	            <option value="13">13</option>
	            <option value="14">14</option>
	            <option value="15">15</option>	
	            <option value="16">16</option>
	            <option value="17">17</option>
	            <option value="18">18</option>
	            <option value="19">19</option>
	            <option value="20">20</option>
	            <option value="21">21</option>
	            <option value="22">22</option>
	            <option value="23">23</option>
	            <option value="24">24</option>
	            <option value="25">25</option>
	            <option value="26">26</option>	
	            <option value="27">27</option>
	            <option value="28">28</option>
	            <option value="29">29</option>
	            <option value="30">31</option>
	            <option value="31">31</option>
	            
	</select>
	<span>일</span>
	</div>
</div>
	<div style="margin-top:-10px">
	<label for="jumin1"><b>주민번호</b></label><br>
	<input type="text" placeholder="주민번호 앞6자리" name="jumin1" id="jumin1"  size="6"
	         maxLength="6">
	       
	         
	<label for="jumin2"><b> - </b></label>
	<input type="text" placeholder="주민번호 뒤7자리" name="jumin2" id="jumin2"  size="7"
	         maxLength="7">
	</div>
	
	
	
	<label for="email"><b> E-Mail </b></label><br>
	<input type="text" name="email" id="email"> @
	<input type="text" name="domail" id="domain"> 
	<select name="sel" id="sel" >
	            <option value="">직접입력</option>
	            <option value="naver.com">naver.com</option>
	             <option value="daum.com">daum.com</option>
	                <option value="nate.com">nate.com</option>
	                 <option value="gmail.com">gmail.com</option>
	
	
	</select>
	<label><b>성별</b></label><br>
	
	<div class="container2">
	<input type="radio" name="gender" value="m" id="gender1">남자&nbsp;&nbsp;&nbsp;
	<input type="radio" name="gender" value="f" id="gender2">여자
	</div>
	<br>
	<div style="margin-top:-10px;width:101%">
	<label for="tel_1"><b>전화번호</b></label><br>
	<input type="text" placeholder="전화번호 앞2~3자리" name="tel_1" id="tel_1" 
	         maxLength="3" style="width:32%">
	       
	         
	<label for="tel_2"><b> - </b></label>
	<input type="text" placeholder="중간번호 4자리" name="tel_2" id="tel_2"  
	         maxLength="4"  style="width:32%">
	<label for="tel_3"><b> - </b></label>
	<input type="text" placeholder="뒤번호 4자리" name="tel_3" id="tel_3"  
	         maxLength="4" style="width:32%">        
	</div>
	 <br>
	 
	 <label><b>우편번호</b></label><br>
	 <input type="text" size="5" maxLength="5" name="post1" id="post1">
	 <input type="button" value="우편검색" id='postcode'  >
	 


     <label><b>주소</b></label><br>
	 <input type="text" size="50"  name="address" id="address">
	 
	 
	 
	 
	 <div class ="clearfix">
	 <button type="reset" class="cancelbtn btn btn-danger">취소</button>
	 <button type="submit" class="signupbtn btn btn-primary" >다음</button>
	 
	 
	 </div>
	 
	</fieldset>
	
	
	</div>
	
	
	
	
	</form>



	<hr style="margin-top:4rem">


	<jsp:include page="../comm/footer_Subcribe.jsp"/>
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>