<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
 <head>
 <jsp:include page="../comm/header.jsp"></jsp:include>
 <link rel="stylesheet" href="css/shareDiet.css" type="text/css">
 <link rel="stylesheet" href="css/dietmenu.css" type="text/css">
 <style>
	#add_diet, #recomm_diet{
		width:310px;
	}
	article{
		width:100% !important;
	}
	#seach_diet{
	   margin-top : 30px;
	   font-size:1.4rem;
	   border-radius:10px;
	   width: 300px;
	   height: 50px;
	}
 </style>
 </head>
  <body class="goto-here">
		
     <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.net">Home</a></span> <span>DIET</span></p>
            <h1 class="mb-0 bread">Share Diet</h1>
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
							<label><b>영양소별</b> </label>
						</div>
    					<div class="col-md-6 col-lg-3 ftco-animate">
							<input type="checkbox" name="nutrType" id="nutrType1" value="DIET_TOTAL_CARB">&nbsp;&nbsp;&nbsp;탄수 위주 식단	
						</div>
						<div class="col-md-6 col-lg-3 ftco-animate">
							<input type="checkbox" name="nutrType" id="nutrType2" value="DIET_TOTAL_FAT">&nbsp;&nbsp;&nbsp;지방 위주 식단
						</div>
						<div class="col-md-6 col-lg-3 ftco-animate">
							<input type="checkbox" name="nutrType" id="nutrType3" value="DIET_TOTAL_PROTEIN">&nbsp;&nbsp;&nbsp;단백질 위주 식단
						</div>
					</div>
		   	</div>
		   	<div class="container d-flex justify-content-center">
				<button id="seach_diet" type="button" class="btn btn-primary">검색 하기</button>
	   		</div>
		</section>
    	
    	
    	<section class="ftco-section" id="reloadArea">
	    	<div class="container" >
	    		<s:if test="${listcount > 0 }">
	    			 	<s:set var="index" value="1"/>
						<s:forEach var="b" items="${dietList}">	
							<s:if test="${index%4==1}">
								 <div class="row"> 
							</s:if>
									<div class="col-md-6 col-lg-3 ftco-animate">
					    				<div class="product">
					    					<div class="img-prod" style="text-align : center;">
					    						<button id="DetailDietbtn" value="${b.diet_code}" class="img-prod" data-toggle="modal" data-target="#myModal">
						    						<img width="328px" height="200px"  style="object-fit:fill !important;" src="images/food/${b.diet_img_name}.jpg" alt="Colorlib Template">
		    										<div class="overlay"></div>
	    										</button>
	    									</div>
	    									<img  style="position: relative; right:-5px; top: -35px; z-index:1000 " width="30px" height="30px" src="images/like.png" alt="like">
	    									<span style="position: relative; right:-4px; top: -30px; z-index:1000"><b id="${b.diet_code}" style="color:black;">${b.diet_recomm}</b></span>
					    					<div class="text py-3 pb-4 px-3 text-center">
					    						<input type="hidden" name="num" value="0" id=reply_dietCode>
					    						<h3 id="food_name_text">${b.diet_name}</h3>
					    						<div class="d-flex">
					    							<div class="pricing">
							    						<p class="price" style="">
							    							<span class="price-sale">칼로리  : ${b.diet_total_cal}kcal</span>
							    							<br>
							    							<span class="price-sale">(탄:${b.diet_total_carb}g / 단:${b.diet_total_protein}g / 지:${b.diet_total_fat}g)</span>
							    						</p>
							    					</div>
						    					</div>
						    					<div class="bottom-area d-flex px-3">
						    						<div class="m-auto d-flex">
						    							<a href="javascript:addMyDietList('${b.diet_code}')" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    												<span><i class="ion-ios-cart"></i></span>
		    											</a>
		    											<a href="javascript:addlike('${b.diet_code}')" class="heart d-flex justify-content-center align-items-center ">
															<span><i class="ion-ios-heart"></i></span>
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
			            			<a href="javascript:reloadPage(${page-1})">&gt;</a> 
			              	 	</li>
				 			 </s:if>
				 			<s:forEach var="a" begin="${startpage}" end="${endpage}">
								<s:if test="${a == page }">
									<li class="active"><span>${a}</span></li>
								</s:if>
								<s:if test="${a != page }">
									<li>
										<a href="javascript:reloadPage(${a})"><span>${a}</span></a>
									</li>
								</s:if>
							</s:forEach>
				 			<s:if test="${page >= maxpage }">
								<li>
					   				<a style="background:gray; color:white">&gt;</a> 
								</li>
							</s:if>
							<s:if test="${page < maxpage }">
				  				<li>
				  					<a href="javascript:reloadPage(${page+1})">&gt;</a>
				  				</li>	
							</s:if>
			              </ul>
			            </div>
			          </div>
			        </div>
			   </s:if>
	  		
   	   </section>
   </article>

		
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
   
   
   <script type="text/javascript" src="js/navi_shareDiet.js" charset="utf-8"></script>
  </body>
</html>