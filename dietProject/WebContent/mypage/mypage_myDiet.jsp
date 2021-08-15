<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지 기본양식 입니다</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/myPage.css" type="text/css">
<style>
/* 버튼을 해당 행에 놓을 경우에만 보이도록 표시 */
tbody button{
 	visibility: hidden;
}
tbody>tr:hover>td:nth-child(4)>button{
	visibility: visible !important;
}
/* 테이블의 앞 2개 컬럼의 텍스트 좌측 정렬*/
td>div{
	text-align: left;
}

/* 컬럼마다 margin을 따로 줌 */
tbody td:nth-child(1) {
	padding: 10px 0px 10px 20px !important;
}
tbody td:nth-child(2), tbody td:nth-child(3){
	padding: 10px 0px 10px 0px !important;
}
tbody td:nth-child(4) {
	padding: 10px 10px 10px 0px !important;
}

/*내 식단 관리 인원 표시 좌측 정렬 */
thead>tr:nth-child(1)>th:first-child{
	 text-align:left;
}	
/*식단 구성 버튼 우측 정렬 */
thead>tr:nth-child(1)>th:last-child{
	text-align:right; 
}	

/*리스트 검색 input 크기 지정 */
thead input[type=text]{
	width:150px;
	height:30px;
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
					<h1 class="mb-0 bread">마이페이지</h1>
				</div>
			</div>
		</div>
	</div>

	<!-- 마이 페이지 좌측 side 메뉴들 -->
	<aside class="ftco-section">
		<div class="asideLeft_container">
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
	</aside>

	<!-- 마이페이지 중앙 article -->
	<article>
		<div class="article_container">
			<table style='min-width: 0px !important;' class="table table-borderless">
				<thead>
					<tr>
						<th colspan="3"><h5>내 식단 관리 10</h5></th> 
						<th colspan="2">
							<button type="button" class="btn btn-secondary">
											식단 구성하기
							</button>
						</th>
					</tr>
					<tr>
						<th style="background:#dcdcdc;" colspan="5">
							<div class="d-flex flex-row-reverse">
							 <img class="p-2" src="images/search.png" width="30px" height="30px" alt="search">
							 <input class="p-2" type="text" placeholder="검색어 입력하세요" required maxlength="12">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><div>맛없는 식단</div></td>
							<td><div>총 칼로리:900000 Kcal</div></td>
							<td><span>야채위주의 식단으로 구성하였고 맛이없습니다.</span></td>
							<td colspan="2" style="text-align: right !important;">
								<button type="button" class="btn btn-secondary">보기</button>
								<button type="button" class="btn btn-secondary">추천</button>
								<button type="button" class="btn btn-secondary">수정</button>
								<button type="button" class="btn btn-secondary">삭제</button>
							</td>
						</tr>
						<tr>
							<td><div>맛없는 식단</div></td>
							<td><div>총 칼로리:900000 Kcal</div></td>
							<td><span>야채위주의 식단으로 구성하였고 맛이없습니다.</span></td>
							<td colspan="2" style="text-align: right !important;">
								<button type="button" class="btn btn-secondary">보기</button>
								<button type="button" class="btn btn-secondary">추천</button>
								<button type="button" class="btn btn-secondary">수정</button>
								<button type="button" class="btn btn-secondary">삭제</button>
							</td>
						</tr>
						<tr>
							<td><div>맛없는 식단</div></td>
							<td><div>총 칼로리:900000 Kcal</div></td>
							<td><span>야채위주의 식단으로 구성하였고 맛이없습니다.</span></td>
							<td colspan="2" style="text-align: right !important;">
								<button type="button" class="btn btn-secondary">보기</button>
								<button type="button" class="btn btn-secondary">추천</button>
								<button type="button" class="btn btn-secondary">수정</button>
								<button type="button" class="btn btn-secondary">삭제</button>
							</td>
						</tr>
						<tr>
							<td><div>맛없는 식단</div></td>
							<td><div>총 칼로리:900000 Kcal</div></td>
							<td><span>야채위주의 식단으로 구성하였고 맛이없습니다.</span></td>
							<td colspan="2" style="text-align: right !important;">
								<button type="button" class="btn btn-secondary">보기</button>
								<button type="button" class="btn btn-secondary">추천</button>
								<button type="button" class="btn btn-secondary">수정</button>
								<button type="button" class="btn btn-secondary">삭제</button>
							</td>
						</tr>
				</tbody>
			</table>
			<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
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
	
	<!-- 마이페이지 우측 side -->
	<aside class="ftco-section">
	</aside>

	<!-- footer 영역1 -->
 	<jsp:include page="../comm/footer_Subcribe.jsp" />  

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />  

</body>
</html>