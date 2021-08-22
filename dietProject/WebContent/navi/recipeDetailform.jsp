<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../comm/header.jsp"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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



.form-group>button:nth-child(1):hover{
     background-color:white; 
     color:red;
}

#button{
 display:none;
}

#attach{
display:none;

}
#img{
 width:120px;
 height:120px;


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
					<h1 class="mb-0 bread">Detail  RECIPES</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="width: 65%;margin-top:40px">
		<form action="RecipeUpdateAction.bo" method="post"
			enctype="multipart/form-data" name="RecipeAddform" >
			<div class="form-group">
				 <fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">레시피 별칭</legend>
				   <input name="recipe_subject"
					id="recipe_subject"  type="text"
					class="form-control" placeholder="레시피 별칭을 작성해주세요" style="border:none;text-align:center" readonly
					value="${recipeInfo.recipe_subject}">
					
				</fieldset> 	
			</div>

			<div class="form-group">
				<fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">만드는 방법</legend>
				<textarea name="recipe_content" rows="5" class="form-control" 
				     id="recipe_content" placeholder="방법을 작성해주세" style="border:none;text-align:center" readonly>
				     ${recipeInfo.recipe_content}</textarea>
				  </fieldset> 	
			</div>


			<div class="form-group">
				<fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">특 징</legend>
				<textarea name="recipe_summary" id="recipe_summary" rows="3"
					class="form-control" placeholder="특징을 적어주세요(옵션)"style="border:none;text-align:center" readonly >${recipeInfo.recipe_summary}</textarea>
				</fieldset>	
			</div>

		<div class="form-group">
		    <fieldset style="border:1px solid #80808040; height:14rem; margin-bottom:40px">
				 <legend style="text-align:center;width:35%">레시피 이미지</legend>
			  <div id="file" style="margin:20px 10px">
				  <label for="recipe_file"> <img id="attach"
					src="images/attach.png" alt="파일 첨부">
				 
				<span id="showImage" style="margin-left:320px">
				  <c:if test='${empty imglist}'>
				    <c:set var="src" value=''/>
				  </c:if>
				  <c:if test='${!empty imglist}'>
				    <c:forEach var="list" items="${imglist}">
				       <c:set var='src' value='${"images/" }${list}'/>
				        <img src="${src}" id="img" >
				    </c:forEach>       
				   </c:if>
				  
				    
				</span>
				
				<input type="file" id="recipe_file" multiple="multiple" name="recipeFile" accept="image/*" 
				          style="display:none" readonly> 
				
				</label>	
			  </div> 	
			</fieldset>	
		</div>
            
			<input type="button" name='back' value="목록으로 돌아가기" id="back" style="background-color:#82ae46;color:white;border:none">
			
			<div id="button" class="form-group" style="margin-top:-23px; float:right">
				<button type="reset" class="btn btn-danger">삭제</button>&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">수정</button>
			</div>
			<input type="hidden" name='recipeCode' value="${recipeInfo.recipe_code}" id="recipeCode" >
		</form>
		

	</div>
<script>
$('input[type=file]').change(function(event){
	 
    var inputfile = $(this).val().split('\\');
    var filename = inputfile[inputfile.length-1];
    var pattern =/(git|jpg|jpeg|png)$/i;
    if(pattern.test(filename)){
  	  $('#filename').text(filename);
  	 //파일을 읽기 위한 객체 생성
  	  //DataURL 형식으로 파일을 읽어옵니다.
  	  //읽어온 결과는 reader객체의 result 속성에 저장됩니다.
  	  //event.target.files[0]: 선택한 그림의 파일객체에서 첫번째 객체를 가져옵니다.
  	  
  	  for(var i=0;i<event.target.files.length;i++){
  		var reader = new FileReader();
  	  reader.readAsDataURL(event.target.files[i]);
  	  
  	  reader.onload=function(event){
  		  $('#showImage').append('<img width="400px" height="100px" src="' + event.target.result + '">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
  		  
  	  };
  	 };  
    }else{
  	  alert('확장자는 gif,jpg,jpeg,png가 가능합니다');
  	  check=0;
    }


})

$(function(){
	
   $("#back").click(function(){
	   
         location.href="shareRecipe.sr";
   
   
   })
   



})


</script>

	<hr style="margin-top:4rem">


	<jsp:include page="../comm/footer_Subcribe.jsp"/>
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>