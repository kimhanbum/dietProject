<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지 기본양식 입니다</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/mymessage_from_form.css" type="text/css">
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
.tool_button{
 float:right;
 transform:rotate(90deg);
 font-size:25px;
 
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
					<h1 class="mb-0 bread">내게 남긴 댓글</h1>
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
		
		<div class="tool_button">
		   <div>...</div>
		</div>   
		<div class="article_container">
			
			   
			
			<form action="RecipeAddAction.bo" method="post"
			enctype="multipart/form-data" name="RecipeAddform"  >
			<div class="form-group">
				 <fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">레시피 별칭</legend>
				   <input name="recipe_subject"
					id="recipe_subject"  type="text"
					class="form-control"  style="border:none" readonly="readonly">
				</fieldset> 	
			</div>

			<div class="form-group">
				<fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">만드는 방법</legend>
				<textarea name="recipe_content" rows="3" class="form-control" 
				     id="recipe_content" style="border:none" readonly="readonly"></textarea>
				  </fieldset> 	
			</div>


			<div class="form-group">
				<fieldset style="border:1px solid #80808040">
				   <legend style="text-align:center;width:35%">특 징</legend>
				<textarea name="recipe_summary" id="recipe_summary" rows="3"
					class="form-control" style="border:none" readonly="readonly"></textarea>
				</fieldset>	
			</div>

			<div class="form-group">
				<fieldset style="border:1px solid #80808040;  margin-bottom:40px">
				 <legend style="text-align:center;width:35%">레시피 이미지</legend>		
				<textarea name="recipe_image" id="recipe_image" rows="5"
					class="form-control" style="border:none" readonly="readonly" ></textarea>				
				</fieldset>	
			</div>

			
		</form>
			
		</div>
		
<div class="CommentBox">
		  <div class="comment_option">
		    
		     <div class="comment_tab">
		        <ul class="comment_tab_list">
		        </ul>
		     
		     </div>
	     </div>
		 <ul class="comment_list">
		 </ul>
		 <div class="CommentWriter">
		    <div class="comment_inbox">
		       <b class="comment_inbox_name">${id}</b> <span 
		       class="comment_inbox_count">0/200</span>
		       
		     <textarea placeholder="댓글을 남겨보세요" rows='1' 
		     class="comment_inbox_text" maxlength="200"></textarea>  
		       
  
		    </div>
		    <div class="register_box">
		       <div class="button btn_cancel">취소</div> 
		        <div class="button btn_register">등록</div> 
		    </div>
		 
		 </div>
		
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