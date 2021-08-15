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
						<span class="mr-2"><a href="index.jsp">Home</a></span> <span>DIET</span>
					</p>
					<h1 class="mb-0 bread">MAKE A RECIPES</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="width: 65%;margin-top:40px">
		<form action="RecipeAddAction.bo" method="post"
			enctype="multipart/form-data" name="RecipeAddform">
			<div class="form-group">
				 <fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">레시피 별칭</legend>
				   <input name="recipe_subject"
					id="recipe_subject"  type="text"
					class="form-control" placeholder="레시피 별칭을 작성해주세요" style="border:none">
				</fieldset> 	
			</div>

			<div class="form-group">
				<fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">만드는 방법</legend>
				<textarea name="recipe_content" rows="5" class="form-control" 
				     id="recipe_content" placeholder="방법을 작성해주세" style="border:none"></textarea>
				  </fieldset> 	
			</div>


			<div class="form-group">
				<fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">특 징</legend>
				<textarea name="recipe_summary" id="recipe_summary" rows="3"
					class="form-control" placeholder="특징을 적어주세요(옵션)"style="border:none"></textarea>
				</fieldset>	
			</div>

			<div class="form-group">
				<fieldset style="border:1px solid #80808040; height:14rem; margin-bottom:40px">
				 <legend style="text-align:center;width:35%">레시피 이미지</legend>
				 <div id="file" style="margin:20px 10px">
				<label for="recipe_file"> <img
					src="images/attach.png" alt="파일 첨부">
				</label> <input type="file" id="recipe_file"  name="recipe_file" accept="image/*"> <span
					id="recipefilename"></span>
				</div> 	
				</fieldset>	
			</div>

			<div class="form-group" style="margin-top:-23px; float:right">
				<button type="reset" class="btn btn-danger">취소</button>&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">작성</button>
			</div>
		</form>

	</div>


	<hr style="margin-top:4rem">


	<jsp:include page="../comm/footer_Subcribe.jsp"/>
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>