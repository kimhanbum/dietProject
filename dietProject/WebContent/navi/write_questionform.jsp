<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="css/write_questionform.css" type="text/css">
<jsp:include page="../comm/header.jsp" />
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

.form-group>button:nth-child(1):hover {
	background-color: white;
	color: red;
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
					<h1 class="mb-0 bread">문의 작성</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="width: 65%; margin-top: 40px">

		<form action="RecipeAddAction.bo" method="post">

			<div class="form-group">
				<fieldset style="border: 1px solid #80808040">
					<legend style="text-align: center; width: 35%">문의 제목</legend>
					<input name="question_subject" id="question_subject" type="text"
						class="form-control" style="border: none">
				</fieldset>
			</div>

			<div class="form-group">
				<fieldset style="border: 1px solid #80808040">
					<legend style="text-align: center; width: 35%">문의 내용</legend>
					<textarea name="question_content" rows="7" class="form-control"
						id="question_content" style="border: none"></textarea>
				</fieldset>
			</div>


			<div class="form-group" style="margin-top: -10px; float: right">
				<button type="reset" class="btn btn-danger">취소</button>
				&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">등록</button>
			</div>
		</form>

	</div>
	<div class="container" style="width: 65%; margin-top: 40px">
	<div class="CommentBox">
		<div class="comment_option" style="margin-top: 30px;">

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
			<div>
			<input type="checkbox"  name="lock" id="lock" value="lock" >
			<span>비밀글</span>
			</div>
			
			<div class="register_box">
				<div class="button btn_cancel">취소</div>
				<div class="button btn_register">등록</div>
			</div>

		</div>

	</div>
</div>

	<hr style="margin-top: 4rem">


	<jsp:include page="../comm/footer_Subcribe.jsp" />
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>