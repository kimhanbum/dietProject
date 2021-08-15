<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지 기본양식 입니다</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/mymessage_from.css" type="text/css">
<style>
/* 버튼을 해당 행에 놓을 경우에만 보이도록 표시 */
<style>
button{
  float: right;
  position:relative;
  top:20px;
  right:120px;
 }
table> thead > tr > th:nth-child(1){width:10%;padding-left:30px}
table> thead > tr > th:nth-child(2){width:20%}
table> thead > tr > th:nth-child(3){width:5%}
table> tbody > tr > td:nth-child(1){padding-left:30px}
table>thead>tr{
  height:40px;

}
table>tbody>tr {
  
  height:50px !important;

}

table tr{
border-bottom: 1px solid #d2cfcfbf;

}
 
</style>

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
					<h1 class="mb-0 bread">내가 남긴 댓글</h1>
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
   <div>
	<!-- 마이페이지 중앙 article -->
	<article style="margin-left:30px">
		<div class="article_container">
			<table class="table-hover" style="border-top:2px solid #82ae46;width:100%;margin-top:30px;" >
    <thead>
      <tr style="background-color: #d2cfcfbf;color:white">
        <th>번 호</th>
        <th>내가 남긴 댓글</th>       
        <th>날 짜</th>     
      </tr>
    </thead>
    <tbody>
      <tr >
        <td>1</td>
        <td >ㅇ</td>
        <td>날짜1</td>     
      </tr>
      <tr>
        <td>2</td>
        <td >ㄹ</td>
        <td>날짜2</td>         
      </tr>
      <tr>
        <td>3</td>
        <td >ㅎ</td>        
        <td>날짜3</td>    
      </tr>
    </tbody>
  </table>
			<div class="row mt-5">
          <div class="col text-center" style="margin-top:120px ">
            <div class="block-27">
              <ul style="font-size:10px">
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
		</div>
	</article>
	</div>
	<!-- 마이페이지 우측 side -->
	<aside class="ftco-section">
	</aside>

	<!-- footer 영역1 -->
 	<jsp:include page="../comm/footer_Subcribe.jsp" />  

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />  

</body>
</html>