<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
 <jsp:include page="../comm/header.jsp"></jsp:include>
 <link rel="stylesheet" href="css/dietmenu.css" type="text/css">
 <style>
	aside>div:nth-child(1){
		text-align:center;
		border: 1px solid gray; 
		min-height:500px;
		max-height:500px;
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
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product">
	    					<a href="#" class="img-prod"><img  width="328px" height="232px"  src="images/bread.jpg" alt="Colorlib Template">
	    						
	    						<div class="overlay"></div>
	    					</a>
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
		
   <aside>
   		<div class="asideRight_container float_sidebar">
   			<div> 내가 담은 식자재 갯수 : 80</div>
   			<div> (0 kcal / 800 kcal)</div>
   			<div class="box">
				<table style='min-width: 0px !important;'class="table">
					<tbody>
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마1</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마2</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마3</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마4</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마5</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마6</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마7</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마8</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마9</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
							<tr class="text-center">
								<td class="image-prod" ><div class="img"></div></td>
								<td class="product-name" style="width:130px;">
									<h3 style="margin:5px !important;">호박고구마10</h3>
								</td>
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
							</tr><!-- END TR-->	
					</tbody>
				</table>
			</div>
			<div> 식단 이름</div>
			<input class="p-2" type="text" required maxlength="15">
			<br>
			<br>
			<div> 식단 설명</div>
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
   	
   	<script> 
   		$(function(){ 
   			var $win = $(window); 
   			var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
   			
   			/*사용자 설정 값 시작*/ 
   			var speed = 400; //따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec) 
			var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing 
			var $layer = $('.float_sidebar'); // 레이어 셀렉팅 
			var layerTopOffset = 0; // 레이어 높이 상한선, 단위:px 
			$layer.css('position', 'relative').css('z-index', '1'); 
			/*사용자 설정 값 끝*/ 
			
			// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해 
			if (top > 0 ) 
				$win.scrollTop(layerTopOffset+top); 
			else 
				$win.scrollTop(0); 
			
			//스크롤이벤트가 발생하면 
			$(window).scroll(function(){ 
				yPosition = $win.scrollTop() - 400; //이부분을 조정해서 화면에 보이도록 맞추세요 
				console.log("$win.scrollTop(): " + $win.scrollTop());
				console.log("yPosition : " + yPosition);
				if (yPosition < 0) 
				{ 
					yPosition = 0; 
				} 
				if(yPosition > 520){
					yPosition = 520;
				}
				$layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false}); 
			}); 
		});
   		</script>
  </body>
</html>