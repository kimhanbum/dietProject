<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								 <input class="p-2" type="text" placeholder="검색어 입력하세요" required maxlength="12">
							</div>
						</div>
					</div>
					<br>
					
					<div class="row">
						<div class="col-md-6 col-lg-2 ftco-animate">
							<label><b>식자재별</b> </label>
						</div>
    					<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType2" value="2">&nbsp;&nbsp;&nbsp;과일류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType3" value="3">&nbsp;&nbsp;&nbsp;어류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType4" value="4">&nbsp;&nbsp;&nbsp;육류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType5" value="5">&nbsp;&nbsp;&nbsp;해조류
						</div>
						<div class="col-md-6 col-lg-2 ftco-animate">
							<input type="checkbox" name="foodType" id="foodType6" value="6">&nbsp;&nbsp;&nbsp;견과류
						</div>
					</div>
					<hr>
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
    	<section class="ftco-section">
	    	<div class="container">
	    		<div class="row">
	    			<div class="col-md-6 col-lg-3 ftco-animate" style="max-height:384px;">
	    				<div class="product" style="max-height:354px;">
	    					<a href="#" class="img-prod" data-toggle="modal" data-target="#myModal">
							    <img  width="328px" height="232px"  src="images/bread.jpg" alt="Colorlib Template">
	    						<div class="overlay"></div>
	    					</a>
	    					<img  style="position: relative; right:-5px; top: -35px;z-index:1000 " width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px; z-index:1000"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">BREAD</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span class="price-sale">고소한 빵과 샐러드와의 조합</span></p>
			    					</div>
		    					</div>
		    					<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px"  src="images/fruit.jpg" alt="Colorlib Template">
	    						<div class="overlay"></div>
	    					</a>
	    					<img  style="position: relative; right:-5px; top: -35px;" width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px;"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">FRUIT</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span>과일 식단</span></p>
			    					</div>
		    					</div>
	    						<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px" src="images/salad.jpg" alt="Colorlib Template">
		    					<div class="overlay"></div>
		    				</a>
		    				<img  style="position: relative; right:-5px; top: -35px;" width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px;"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">SALAD</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span>영양만점 샐러드</span></p>
			    					</div>
		    					</div>
	    						<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px"  src="images/fish.jpg" alt="Colorlib Template">
	    						<div class="overlay"></div>
	    					</a>
	    					<img  style="position: relative; right:-5px; top: -35px;" width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px;"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">FISH</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span>연어와새러드의 만남</span></p>
			    					</div>
		    					</div>
	    						<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="row">
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px"  src="images/bread.jpg" alt="Colorlib Template">
	    						
	    						<div class="overlay"></div>
	    					</a>
	    					<img  style="position: relative; right:-5px; top: -35px;" width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px;"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">BREAD</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span class="price-sale">고소한 빵과 샐러드와의 조합</span></p>
			    					</div>
		    					</div>
		    					<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px"  src="images/fruit.jpg" alt="Colorlib Template">
	    						<div class="overlay"></div>
	    					</a>
	    					<img  style="position: relative; right:-5px; top: -35px;" width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px;"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">FRUIT</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span>과일 식단</span></p>
			    					</div>
		    					</div>
	    						<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px" src="images/salad.jpg" alt="Colorlib Template">
		    					<div class="overlay"></div>
		    				</a>
		    				<img  style="position: relative; right:-5px; top: -35px;" width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px;"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">SALAD</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span>영양만점 샐러드</span></p>
			    					</div>
		    					</div>
	    						<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px"  src="images/fish.jpg" alt="Colorlib Template">
	    						<div class="overlay"></div>
	    					</a>
	    					<img  style="position: relative; right:-5px; top: -35px;" width="30px" height="30px" src="images/like.png" alt="like">
	    					<span style="position: relative; right:-4px; top: -30px;"><b style="color:black;">124</b></span>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">FISH</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span>연어와새러드의 만남</span></p>
			    					</div>
		    					</div>
	    						<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							    </a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
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
   	
   		<%-- 게시판 view end --%>
	<%-- modal시작 --%>
	<div class="modal" id="myModal" style="overflow:auto;">
		<div class="modal-dialog modal-lg" style="width:700px;">
			<div class="modal-content"style=" padding:30px;">
					<div class="row">
						<div class="col-sm-12 text-center" style="background:#82AD46">
							<div style="font-size:30px; color:black; margin-bottom:-10px;">채소 인간 식단</div>
							<div style="font-size:20px;">(1200kcal/탄수화물100g/단백질100g/지방100g)</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-12 text-center">
							<div style="font-size:20px; margin-bottom:-10px;">채소위주의 저열량 저지방 식단입니다.</div>
						</div>
					</div>
					<br>
					<div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-1.jpg); background-size: 100px; "></div>
						<div class="col-sm-2"><h5>파프리카</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-2.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>딸기</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-3.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>콩</h5></div>
					</div>
	    			<div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-4.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>양상추</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-5.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>토마토</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-6.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>브루콜리</h5></div>
					</div>
					<div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-7.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>당근</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-8.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>과일주스</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-9.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>양파</h5></div>
				   </div>	
				   <div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-1.jpg); background-size: 100px; "></div>
						<div class="col-sm-2"><h5>파프리카</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-2.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>딸기</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-3.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>콩</h5></div>
					</div>
	    			<div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-4.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>양상추</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-5.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>토마토</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-6.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>브루콜리</h5></div>
					</div>
					<div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-7.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>당근</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-8.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>과일주스</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-9.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>양파</h5></div>
				   </div>	
				   				   <div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-1.jpg); background-size: 100px; "></div>
						<div class="col-sm-2"><h5>파프리카</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-2.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>딸기</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-3.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>콩</h5></div>
					</div>
	    			<div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-4.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>양상추</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-5.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>토마토</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-6.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>브루콜리</h5></div>
					</div>
					<div class="row"  style="text-align: center; ">
						<div class="col-sm-2 img" style="background-image:url(images/product-7.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>당근</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-8.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>과일주스</h5></div>
						<div class="col-sm-2 img" style="background-image:url(images/product-9.jpg); background-size: 100px;"></div>
						<div class="col-sm-2"><h5>양파</h5></div>
				   </div>	
				   <br>
				   <span style="padding-bottom:10px; text-align: right;">
				        <img width="30px" height="30px" src="images/like.png" alt="like">
				        <b style="color:black; padding-left:5px;">124</b>
				   </span>		
				   <br>
				   
					<div class="CommentBox">
						<div class="comment_option">
							<h3 class="comment_title">
								댓글<sup id="count"></sup>
							</h3>
							<div class="comment_tab">
								<ul class="comment_tab_list">
									<li class="comment_tab_item red " >
										<a href="javascript:getList(1)" class="comment_tab_button">등록순</a>
									</li>
									<li class="comment_tab_item red " >
										<a href="javascript:getList(2)" class="comment_tab_button">최신순</a>
									</li>
								</ul>
							</div>
						</div>
						<ul class="comment_list">
							<li id="10" class="CommentItem">
								<div class="comment_area">
									<img  src="images/profile.png" alt="pic" width="36" height="36">
									<div class="comment_box">
										<div class="comment_nick_box">
											<div class="comment_nick_info">
												<div class="comment_nickname">admin</div>
											</div>                 
										</div>
									</div>
								
									<div class="comment_text_box">
										<p class="comment_text_view">
											<span class="text_comment">댓글 샘플입니다.</span>
										</p>
									</div>
									<div class="comment_info_box">
										<span class="comment_info_date">2021-08-14 13:00:00</span>
										<a href="javascript:replyform(1,0,0,1)" class="comment_info_button">답글쓰기</a>
									</div>
													   
									<div class="comment_tool">
										<div title="더보기" class="comment_tool_button">
											<div>&#46;&#46;&#46;</div>
										</div>
										<div id="commentItem1"  class="LayerMore"> //스타일에서 display:none; 설정함
											<ul class="layer_list">							   
												<li class="layer_item">
													<a href="javascript:updateForm(1)" class="layer_button">수정</a>
													&nbsp;&nbsp;
													<a href="javascript:del(1)" class="layer_button">삭제</a>
												</li>
											</ul>
										</div>
									</div>			   
								</div>
							</li>
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
				   
				   
				   
				   <div class="row">
						<div class="col-sm-6 text-center" >
				   			<button id="add_diet" type="button" class="btn btn-dark">담기</button>
						</div>
						<div class="col-sm-6 text-center" >
				   			<button id="recomm_diet" type="button" class="btn btn-dark">추천하기</button>
						</div>
					</div>
    		</div>
		</div>
	</div>
   	
   	
   	<script>

</script>
  </body>
</html>