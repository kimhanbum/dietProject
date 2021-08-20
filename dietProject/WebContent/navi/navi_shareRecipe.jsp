<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>

<script>
	

	
	
	
	
	
	var data = {
			list:[{image_id: 1, name:'bread.jpg'}, 
				{image_id: 2, name:'bread.jpg'}, 
				{image_id: 3, name:'bread.jpg'}, 
				{image_id: 4, name:'bread.jpg'}, 
				{image_id: 5, name:'bread.jpg'}, 
				{image_id: 6, name:'bread.jpg'}, 
				{image_id: 7, name:'bread.jpg'}, 
				{image_id: 8, name:'bread.jpg'}
			],
			maxIdx : 13
	}
	
	function aaa(){alert("iamge click");};
	
	var html = '\
		<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">\
		<div class="product">\
			<a href="javascript:aaa();" class="img-prod"><img width="328px" height="232px" src="images/bread.jpg" alt="Colorlib Template">\
				<div class="overlay"></div> </a>\
			<div class="text py-3 pb-4 px-3 text-center">\
				<h3>\
					<a href="#">BREAD</a>\
				</h3>\
				<div class="d-flex">\
					<div class="pricing">\
						<p class="price">\
							<span class="price-sale">고소한 빵과 샐러드와의 조합</span>\
						</p>\
					</div>\
				</div>\
				<div class="bottom-area d-flex px-3">\
					<div class="m-auto d-flex">\
						<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">\
							<span><i class="ion-ios-menu"></i></span>\
						</a> <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">\
							<span><i class="ion-ios-cart"></i></span>\
						</a> <a href="#" class="heart d-flex justify-content-center align-items-center ">\
							<span><i class="ion-ios-heart"></i></span>\
						</a>\
					</div>\
				</div>\
			</div>\
		</div>\
	</div>\
	';

	var pagesiz = 8;
	var onActiveIdx =7;
	var res = function(data) {
		if(data != undefined && data != null)
		{
			$('#div_image').html('');
			//이미지 바인딩
			$.each(data.list, function(i, n){
				$('#div_image').append(html);
				
			});
			
			//페이
			var ul_list = $('#ul_paging');
			ul_list.html('');
			ul_list.append('<li><a href="#">&lt;</a></li>');
			var startIdx = Math.round(onActiveIdx/5) * 5 + 1;
			for (var i = startIdx; i < startIdx + 5; ++i) {
				if(i >= data.maxIdx) break;
				if(i == onActiveIdx){
					ul_list.append('<li class="active"><a href="javascript:fn_click(' + i + ');">' + i + '</a></li>');
					
				}
				else{
					
					ul_list.append('<li><a href="javascript:fn_click(' + i + ');">' + i + '</a></li>');
				}
			}
			
			$.each(data.paginglist, function(i, n){
				
				
			});
			ul_list.append('<li><a href="#">&gt;</a></li>');
		}
		
	}
	
	$(document).ready(function(){
		res(data);
		
		$("button").click(function(){
			location.href='shareRecipeInsert.sr';
		})
		
	});
	
 function fn_click(page){
	 
          $.ajax({
              	  
               url: 'recipePage.rc',
               dataType:  'json',
               data: {page: page},
               type: 'post',
               success: function(rdata){
            	   
               } 
          
          
          })
 
 
 
 }
 
</script>
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
		<div class="container">
			<div class="row" id='div_image'>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/bread.jpg" alt="Colorlib Template">

							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">BREAD</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="price-sale">고소한 빵과 샐러드와의 조합</span>
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
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/fruit.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">FRUIT</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>과일 식단</span>
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
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/salad.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">SALAD</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>영양만점 샐러드</span>
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
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/fish.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">FISH</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>연어와새러드의 만남</span>
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
			
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/bread.jpg" alt="Colorlib Template">

							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">BREAD</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="price-sale">고소한 빵과 샐러드와의 조합</span>
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
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/fruit.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">FRUIT</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>과일 식단</span>
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
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/salad.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">SALAD</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>영양만점 샐러드</span>
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
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img width="328px" height="232px"
							src="images/fish.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">FISH</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>연어와새러드의 만남</span>
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
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul id='ul_paging'>
							<!-- <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="javascript:fn_click(2);">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li> -->
						</ul>
					</div>
				</div>
			</div>
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





</body>
</html>