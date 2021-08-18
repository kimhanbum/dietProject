<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지-나의 식단</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/mydiet.css" type="text/css">
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
#searchDiet:hover {
	opacity: 0.5;
}
#searchDiet:active {
	opacity: 1.0;
}
#add_diet, #recomm_diet{
	width:310px;
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


	<!-- 헤더 영역  -->
 	<jsp:include page="../comm/asideLeft.jsp" />  
 	
	<!-- 마이페이지 중앙 article -->

	<article>
		<div class="article_container">
			<table style='min-width: 0px !important;' class="table table-borderless">
				<thead>
					<tr>
						<th colspan="3"><h5>내 식단 관리 ${listcount}</h5></th> 
						<th colspan="2">
							<button id="compDiet" type="button" class="btn btn-secondary">
											식단 구성하기
							</button>
						</th>
					</tr>
					<tr>
						<th style="background:#dcdcdc;" colspan="5">
							<div class="d-flex flex-row-reverse">
							 <img id="searchDiet" class="p-2" src="images/search.png" width="30px" height="30px" alt="search">
							 <input id="searchText" class="p-2" type="text" placeholder="검색어 입력하세요" required maxlength="12">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:if test="${listcount > 0 }">
						<s:forEach var="b" items="${diList}">	
							<tr>
	  							<td>
	  								<div>
										<s:out value="${b.diet_name}"/><%--식단 이름 --%>	
							    	</div>
	  							</td>
	  							<td>
	  								<div>
	  									총 칼로리: ${b.diet_total_cal} Kcal
	  								</div>
	  							</td>
								<td>
									<span>
										탄수화물 : ${b.diet_total_carb}g / 지방 : ${b.diet_total_fat}g / 단백질 : ${b.diet_total_protein}g 
									</span>
								</td>
	  							<td colspan="2" style="text-align: right !important;">
									<s:if test="${b.diet_share == true}">
										<button type="button" class="btn btn-secondary" disabled>공유중</button>
									</s:if>
									<s:if test="${b.diet_share == false}">
										<button type="button" id="shareDietbtn"  value="${b.diet_code}" class="btn btn-secondary">공유</button>
									</s:if>
									<button type="button" id="DetailDietbtn" value="${b.diet_code}" class="btn btn-secondary" data-toggle="modal" data-target="#myModal">상세</button>
									<button type="button" id="UpdateDietbtn" value="${b.diet_code}" class="btn btn-secondary">수정</button>
									<button type="button" id="DeleteDietbtn" value="${b.diet_code}" class="btn btn-secondary">삭제</button>
								</td>	
	  					</s:forEach>
					</s:if>	
					<s:if test="${listcount == 0 }">
						<tr><td colspan="5">등록된 글이 없습니다.</td></tr>
					</s:if>
				</tbody>
			</table>
			<s:if test="${listcount > 0 }">
				<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		              	 <s:if test="${page <= 1 }">
		              	 	<li>
		              	 		<a style="background:gray; color:white">&lt;</a>
		              	 	</li>
			 			 </s:if>
		                 <s:if test="${page > 1 }">
		              	 	<li>
		              	 		<a href="dietpage.dt?page=${page-1}">&lt;</a>
		              	 	</li>
			 			 </s:if>
			 			<s:forEach var="a" begin="${startpage}" end="${endpage}">
							<s:if test="${a == page }">
								<li class="active"><span>${a}</span></li>
							</s:if>
							<s:if test="${a != page }">
								<li><a href="dietpage.dt?page=${a}"><span>${a}</span></a></li>
							</s:if>
						</s:forEach>
			 			<s:if test="${page >= maxpage }">
							<li>
				   				<a style="background:gray; color:white">&gt;</a> 
							</li>
						</s:if>
						<s:if test="${page < maxpage }">
			  				<li>
								<a href="dietpage.dt?page=${page+1}">&gt;</a>
			  				</li>	
						</s:if>
		              </ul>
		            </div>
		          </div>
		        </div>
		   </s:if>
		</div>
	</article>

	<!-- 마이페이지 우측 side -->
	<aside class="ftco-section">
	</aside>

	<!-- footer 영역1 -->
 	<jsp:include page="../comm/footer_Subcribe.jsp" />  

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />  
	
	
	<%-- modal시작 --%>
	<div class="modal" id="myModal" style="overflow:auto;">
		<div class="modal-dialog modal-lg" style="width:700px;">
			<div class="modal-content"style=" padding:30px;">
					<div class="row">
						<div class="col-sm-12 text-center" style="background:#82AD46">
							<div id="detailTitle" style="font-size:30px; color:black; margin-bottom:-10px;">채소 인간 식단</div>
							<div id="detailNutr" style="font-size:20px;">(1200kcal/탄수화물100g/단백질100g/지방100g)</div>
						</div>
					</div>
					<br>
					<div>
					</div>
				    <br>
				    <span style="padding-bottom:10px; text-align: right;">
				        <img width="30px" height="30px" src="images/like.png" alt="like">
				        <b id="detailComm" style="color:black; padding-left:5px;">124</b>
				    </span>		
				    <br>
				   
					<div class="CommentBox">
						<div class="comment_option">
							<h3 class="comment_title">
								댓글<sup id="count"></sup>
							</h3>
							<div class="comment_tab">
								<ul class="comment_tab_list">
									<li id="order_olddate" class="comment_tab_item" >
										<a href="javascript:getList(1)" class="comment_tab_button">등록순</a>
									</li>
									<li id="order_newdate" class="comment_tab_item" >
										<a href="javascript:getList(2)" class="comment_tab_button">최신순</a>
									</li>
								</ul>
							</div>
						</div>
						<ul class="comment_list">
						</ul>
						<div class="CommentWriter">
							<div class="comment_inbox">
								<b class="comment_inbox_name">${id}</b>
								<span class="comment_inbox_count">0/200</span>
								<textarea  style="height:18px;" placeholder="댓글을 남겨보세요" rows="1"
										class="comment_inbox_text" maxLength="200"></textarea>			
							</div>
							<div class="register_box">
								<div class="button btn_cancel">취소</div>
								<div class="button btn_register">등록</div>
							</div>
						</div>
				   </div>
    		</div>
		</div>
		<input type="hidden" name="num" value="0" id=reply_dietCode>
		<input type="hidden" id="loginid" value="${id}" name="loginid">
	</div>
	
	
	
	<script type="text/javascript" src="js/myDiet.js" charset="utf-8"></script>

</body>
</html>