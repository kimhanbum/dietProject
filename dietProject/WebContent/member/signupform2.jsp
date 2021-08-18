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
    
	
	  <form name="myform" method="post" action="joinAddProcess.net"
	id='myform' style="width:60%" >
	
	<div class="containner">
	<fieldset >
	
	<div style="margin-left:20%;margin-top:20px">
	<label for="goal" style="margin-top:30px"><b>목표</b></label><br>	
	<div style="display:inline-block">
	<input type="radio" name="goal" value="1" >체중감량
	</div>
	
	<div style="margin-left:20%;display:inline-block">
	<input type="radio" name="goal" value="2" >체중유지
	</div>
	
	<div style="margin-left:20%;display:inline-block">
	<input type="radio" name="goal" value="3" >체중증가
	</div>	
	</div>
	
	<br>
	<div style="margin-left:20%; margin-bottom:20px;margin-top:20px">
	<div style="display:inline-block; width:32%">
	<label for="height"><b>&nbsp;&nbsp;&nbsp;&nbsp;키</b></label><br>
	<input type="text"  name="height" id="height" 
	         maxLength="3" style="width:34%">
	<label ><b>cm&nbsp;&nbsp; </b></label>
	</div>      
	         
	<div style="display:inline-block; width:32%">        
	<label for="wight"><b>체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중</b></label><br>
	<input type="text"  name="wight" id="weight"  
	         maxLength="3"  style="width:34%">
	 <label ><b> kg </b></label>        
	</div> 
	
	<div style="display:inline-block; width:32%">        
	<label for="goal_weight"><b>목표체중</b></label><br>
	<input type="text"  name="goal_weight" id="goal_weight"  
	         maxLength="3" style="width:34%"> 
	 <label ><b> kg </b></label>         
	</div>                
	</div>
	
	 
	 <div class ="clearfix"style="margin-left:17%;margin-bottom:25px">
	 <button type="reset" class="cancelbtn btn btn-danger" style="width:30%">취소</button>
	 <button type="submit" class="signupbtn btn btn-primary" style="width:30%;margin-left:15%" >가입</button>
	 
	 
	 </div>
	 
	</fieldset>
	
	
	</div>
	
	
	
	
	</form>


    <div style="margin-top:-120px">
	<hr>
    </div>

	<jsp:include page="../comm/footer_Subcribe.jsp"/>
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>