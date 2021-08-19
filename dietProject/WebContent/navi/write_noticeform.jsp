<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../comm/header.jsp"/>
<style>
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

.tool_button{
 float:right;
 transform:rotate(90deg);
 font-size:25px;
 margin-top:-44px;
 margin-right:-10px;
}
</style>

</head>
<body class="goto-here">

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="main.net">Home</a></span> <span>DIET</span>
					</p>
					<h1 class="mb-0 bread">공지 작성</h1>
				</div>
			</div>
		</div>
	</div>
    
	<div class="container" style="width: 65%;margin-top:80px">
		<div class="tool_button">...</div>
		<form action="RecipeAddAction.bo" method="post" >
			
			<div class="form-group" ">
				 <fieldset style="border:1px solid #80808040;">
				   <legend style="text-align:center;width:35% ">공지 제목</legend>
				   <textarea name="notice_subject" rows="1" class="form-control" 
				     id="notice_subject"  style="border:none"></textarea>
				</fieldset> 	
			</div>

			<div class="form-group">
				<fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">공지 내용</legend>
				<textarea name="notice_content" rows="7" class="form-control" 
				     id="notice_content"  style="border:none"></textarea>
				  </fieldset> 	
			</div>


			<div class="form-group" style="margin-top:-10px; float:right">
				<button type="reset" class="btn btn-danger">취소</button>&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">등록</button>
			</div>
		</form>

	</div>


	<hr style="margin-top:4rem">


	<jsp:include page="../comm/footer_Subcribe.jsp"/>
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>