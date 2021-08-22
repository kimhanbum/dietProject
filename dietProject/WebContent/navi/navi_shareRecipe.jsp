<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="../comm/header.jsp"></jsp:include>

<style>
button {
	float: right;
	position: relative;
	top: -90px;
	right: 5px;
}
ul>li>.lin:hover{
  background-color:#8bc34a;
  color:white;

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
					<h1 class="mb-0 bread">RECIPES</h1>
				</div>
			</div>
		</div>
	</div>
 
	<section class="ftco-section">
		<div class="container" id="cont">
			<c:if test="${listCount>0}">	
			<div class="row" id='div_image'>
			  <c:forEach var="list" items="${recipeList}">
				
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="recipeDetail.rc?recipeCode=${list.recipe_code}" class="img-prod"><img width="328px" height="232px"
							src="images/${list.recipe_file}" alt="Colorlib Template">

							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="recipeDetail.rc?recipeCode=${list.recipe_code}">${list.recipe_subject}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="price-sale">${list.recipe_content }</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>	

	</div>		
				
			
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul id='ul_paging'>
						<c:if test="${page<=1}">
						    <li><a class="active">&lt;</a></li>	
						</c:if>
						<c:if test="${page>1}">
						   <li><a href="javascript:go(${page-1})" class="lin" >&lt;</a></li>
						</c:if>
						
						<c:forEach var="p" begin="${startPage}" end="${endPage}">
						   <c:if test="${p==page}">
						      <li><a class="active">${p}</a></li>
						   </c:if>
						   <c:if test="${p!=page}">
						    <li><a href="javascript:go(${p})" class="lin">${p}</a></li>
						    </c:if>
						</c:forEach>
						
						<c:if test="${page>=maxPage}">
						   <li><a class="active">&gt;</a></li>
						 </c:if>
                       <c:if test="${page<maxPage}">
                           <li><a href="javascript:go(${page+1})" class="lin">&gt;</a></li>
                       </c:if>    
						</ul>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${listCount==0}">
		    <font size=5>등록된 레시피가 없습니다.</font>
		 </c:if>		
			<button type="button" class="btn btn-primary"
				style="font-size: 1.2rem; border-radius: 10px">레시피 작성</button>
		</div>


	</section>



	<section class="ftco-section img"
		style="background-image: url(images/bg_3.jpg);">
		<div class="container">
			<div class="row justify-content-end">
				<div
					class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
					<span class="subheading">Best wishes For You</span>
					<h2 class="mb-4">Cheating Day</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
					<h3>
						<a href="#">Lucky</a>
					</h3>


				</div>
			</div>
		</div>
	</section>



	<hr>


	<jsp:include page="../comm/footer_Subcribe.jsp" />
	<jsp:include page="../comm/footer_info.jsp" />

<script src="js/shareRecipe.js"></script>



</body>
</html>