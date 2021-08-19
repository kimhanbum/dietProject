<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
 <head>
 <jsp:include page="../comm/header.jsp"></jsp:include>
 <link rel="stylesheet" href="css/dietmenu.css" type="text/css">
 <style>
	aside>div:nth-child(1){
		text-align:center;
		border: 1px solid gray;
		height:100%;
		max-height:420px;
	 }
	 .product-name, .product-remove{
	 	padding:0px !important; 
	 }
	 .image-prod{
	    padding:5px 20px 5px 20px !important; 
	    height:40px;
	    width:40px;
	 }
	 .image-prod>div{
	    margin:0px !important;
	    height:40px !important;
	    width:40px !important;
	    background-image:url(images/product-1.jpg);
	 }
 </style>
 </head>
  <body class="goto-here">
     <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>DIET</span></p>
            <h1 class="mb-0 bread">Composition Diet</h1>
          </div>
        </div>
      </div>
    </div>

	<article>
		<section class="ftco-section">
		   	<div class="container">
					<div class="row">
						<div class="col-md-6 col-lg-12 ftco-animate">
							<div class="d-flex justify-content-start">
								 <img class="p-2" src="images/search.png" width="40px" height="40px" alt="search">
								 <input id="searchText" class="p-2" type="text" placeholder="검색어 입력하세요" required maxlength="12">
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-6 col-lg-2 ftco-animate">
							<label><b>식자재별</b> </label>
						</div>
    					<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType2" value="1">&nbsp;&nbsp;&nbsp;채소류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType3" value="2">&nbsp;&nbsp;&nbsp;과일류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType4" value="3">&nbsp;&nbsp;&nbsp;어류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType5" value="4">&nbsp;&nbsp;&nbsp;육류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType6" value="5">&nbsp;&nbsp;&nbsp;해조류
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-2 ftco-animate">
						</div>
    					<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType2" value="6">&nbsp;&nbsp;&nbsp;견과류
						</div>
					</div>
					<br>
					<hr>
					<br>
					<div class="row">
						<div class="col-md-6 col-lg-2 ftco-animate">
							<label><b>영양소별</b> </label>
						</div>
    					<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="nutrType" id="nutrType1" value="1">&nbsp;&nbsp;&nbsp;탄수화물	
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="nutrType" id="nutrType2" value="2">&nbsp;&nbsp;&nbsp;지방
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="nutrType" id="nutrType3" value="3">&nbsp;&nbsp;&nbsp;단백질
						</div>
					</div>
		   	</div>
		   	<div class="container d-flex justify-content-center">
				<button id="seach_food" type="button" class="btn btn-primary">검색 하기</button>
	   		</div>
		</section>
	   	
    	<section class="ftco-section" id="reloadArea">
	    	<div class="container" >
	    		<s:if test="${listcount > 0 }">
	    			 	<s:set var="index" value="1"/>
						<s:forEach var="b" items="${foodList}">	
							<s:if test="${index%4==1}">
								 <div class="row"> 
							</s:if>
									<div class="col-md-6 col-lg-3 ftco-animate">
					    				<div class="product">
					    					<div class="img-prod" style="text-align : center;">
					    						<img  width="328px" height="200px"  style="object-fit:fill !important;" src="images/food/${b.food_img_name}.jpg" alt="Colorlib Template">
	    										<div class="overlay"></div>
	    									</div>
					    					<div class="text py-3 pb-4 px-3 text-center">
					    						<h3 id="food_name_text">${b.food_name }</h3>
					    						<div class="d-flex">
					    							<div class="pricing">
							    						<p class="price" style="">
							    							<span class="price-sale">칼로리  : ${b.food_cal}kcal</span>
							    							<br>
							    							<span class="price-sale">(탄:${b.food_carb}g / 단:${b.food_protein}g / 지:${b.food_fat}g)</span>
							    						</p>
							    					</div>
						    					</div>
						    					<div class="bottom-area d-flex px-3">
						    						<div class="m-auto d-flex">
						    							<a href="javascript:addDietCart(${b.food_code})" class="buy-now d-flex justify-content-center align-items-center mx-1">
						    								<span><i class="ion-ios-cart"></i></span>
						    							</a>
					    							</div>
					    						</div>
					    					</div>
					    				</div>
			    					</div>
	    					<s:if test="${index%4==0}">
								 </div> 
							</s:if>
							<s:set var="index" value="${index+1}"/>
	  					</s:forEach>
	  					<s:if test="${index%4!=0}">
								 </div> 
						</s:if>
				</s:if>	
			</div>	
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
			            			<s:set var="PrevUrl" value="configDiet.cf?page=${page-1}"/>
			              	 		<s:if test="${!empty searchText}">
			              	 			<s:set var="PrevUrl" value="${PrevUrl}&search=${searchText}"/>
			              	 		</s:if>
			              	 		<s:if test="${!empty checkList}">
			              	 			<s:forEach var="name" items="${checkList}">
			              	 				<s:set var="PrevUrl" value="${PrevUrl}&${checkType}=${name}"/>
	 									</s:forEach>
			              	 		</s:if>
			              	 		<a href="${PrevUrl}">&lt;</a>
			              	 	</li>
				 			 </s:if>
				 			<s:forEach var="a" begin="${startpage}" end="${endpage}">
								<s:if test="${a == page }">
									<li class="active"><span>${a}</span></li>
								</s:if>
								<s:if test="${a != page }">
									<s:set var="numUrl" value="configDiet.cf?page=${a}"/>
			              	 		<s:if test="${!empty searchText}">
			              	 			<s:set var="numUrl" value="${numUrl}&search=${searchText}"/>
			              	 		</s:if>
			              	 		<s:if test="${!empty checkList}">
			              	 			<s:forEach var="name" items="${checkList}">
			              	 				<s:set var="numUrl" value="${numUrl}&${checkType}=${name}"/>
	 									</s:forEach>
			              	 		</s:if>
									<li><a href="${numUrl}"><span>${a}</span></a></li>
								</s:if>
							</s:forEach>
				 			<s:if test="${page >= maxpage }">
								<li>
					   				<a style="background:gray; color:white">&gt;</a> 
								</li>
							</s:if>
							<s:if test="${page < maxpage }">
				  				<li>
				  					<s:set var="nextUrl" value="configDiet.cf?page=${page+1}"/>
			              	 		<s:if test="${!empty searchText}">
			              	 			<s:set var="nextUrl" value="${nextUrl}&search=${searchText}"/>
			              	 		</s:if>
			              	 		<s:if test="${!empty checkList}">
			              	 			<s:forEach var="name" items="${checkList}">
			              	 				<s:set var="nextUrl" value="${nextUrl}&${checkType}=${name}"/>
	 									</s:forEach>
			              	 		</s:if>
			              	 		
									<a href="${nextUrl}">&gt;</a>
				  				</li>	
							</s:if>
			              </ul>
			            </div>
			          </div>
			        </div>
			   </s:if>
	  		
   	   </section>
   </article>
		
   <aside>
   		<div class="asideRight_container float_sidebar">
   			<div> 내가 담은 식자재 갯수 : <span>0</span></div>
   			<div> (0 kcal) </div>
   			<div class="box" style="border:1px solid gray; min-height: 200px">
				<table style='min-width: 0px !important;'class="table">
					<tbody id="test11">
							<tr class="text-center">
								<td class="image-prod" ><div class="img" style="background-image: url(images/food/tomato.jpg)"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">토마토</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr>
					</tbody>
				</table>
			</div>
			<div> 식단 이름</div>
			<input class="p-2" type="text" required maxlength="15">
			<br>
			<br>
			<button id="make_diet" type="button" class="btn btn-success">생성</button>
			<button id="reset_diet" type="button" class="btn btn-danger">초기화</button>
		</div>
   </aside>	
		
    <section class="ftco-section img" style="background-image: url(images/bg_3.jpg);">
    	<div class="container">
			<div class="row justify-content-end">
		         <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
		         	<span class="subheading">Best wishes For You</span>
		            <h2 class="mb-4">Cheating Day</h2>
		            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
		            <h3><a href="#">Lucky</a></h3>
		         </div>
	        </div>   		   		
    	</div>
    </section>
    <hr>
   	<jsp:include page="../comm/footer_Subcribe.jsp"/>
   	<jsp:include page="../comm/footer_info.jsp"/>
   	<script type="text/javascript" src="js/compDiet.js" charset="utf-8"></script>
  </body>
</html>