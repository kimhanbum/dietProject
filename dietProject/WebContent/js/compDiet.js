function addDietCart(foodCode){
	console.log("code : " + foodCode);
	$.ajax({
		type:"post",
		url:"cfDietAdd.cf",
		data : { "foodCode" : foodCode },
		dataType:"json",
		success:function(data){
			output=""
			output+='<tr class="text-center">'
			       +'<td class="image-prod" >'
				   +'<div class="img" style="background-image: url(images/food/tomato.jpg)">'
				   +'</div>'
				   +'</td>'
				   +'<td class="product-name" style="width:130px;">'
				   +'<h3 style="margin:5px !important;">토마토</h3>'				
				   +'</td>'
				   +'<td class="product-remove">'
				   +'<a href="#"><span class="ion-ios-close"></span></a></td></tr>';
			$('#test11').append(output);
		}//success end
	});//ajax end
}
function removeDietCart(foodCode){
	/*console.log("code : " + foodCode);
	$.ajax({
		type:"post",
		url:"cfDietAdd.cf",
		data : { "foodCode" : foodCode },
		dataType:"json",
		success:function(data){
			alert("success");
		}//success end
	});//ajax end*/
}
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
//		console.log("$win.scrollTop(): " + $win.scrollTop());
//		console.log("yPosition : " + yPosition);
		if (yPosition < 0) 
		{ 
			yPosition = 0; 
		} 
		if(yPosition > 437){
			yPosition = 437; //357;
		}
		$layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false}); 
	}); 
	
	/* 식자재 리스트 검색 버튼 클릭 이벤트*/
	$("#seach_food").click(function(){
		//var data ="dcode="+dcode+"&state="+option;
		var data="state=ajax&";
		if($.trim($("#searchText").val()) !=""){
			data+="search="+$("#searchText").val()+"&";
		}
		
		if($('input[name="foodType"]:checked').length> 0  && $('input[name="nutrType"]:checked').length> 0)
		{
			alert("카테고리(식자재/영양소)를 섞어서 체크 할 수 없습니다.");
			$('input[name="foodType"]:checked').each(function(index,item){
				$(this).prop('checked',false);
			});
			$('input[name="nutrType"]:checked').each(function(index,item){
				$(this).prop('checked',false);
			});
			return false;
		}
		else{
			if($('input[name="foodType"]:checked').length> 0){
				$('input[name="foodType"]:checked').each(function(index,item){
					data+="food_type="+$(this).val()+"&";
				});
			}
			else if($('input[name="nutrType"]:checked').length> 0){
				$('input[name="nutrType"]:checked').each(function(index,item){
					data+="nutrient_type="+$(this).val()+"&";
				});
			}
		}
		console.log("data: " + data);
		
		$.ajax({
			type:"post",
			url:"configDiet.cf",
			data : data,
			dataType:"json",
			success:function(data){
				$("#reloadArea").empty();
				
				//food view img & pagination
				var rowIdx=1;
				var output='';
				if(data.listcount > 0 )
				{
					output+='<div class="container">';
					//food img
					$(data.foodList).each(function(index,item){
						if(rowIdx%4==1)
							output+='<div class="row">';
					    output+='      <div class="col-md-6 col-lg-3" ftco-animate>'
	    				       +'          <div class="product">'
	    					   +'             <div class="img-prod" style="text-align : center;">'
	    					   +'               <img  width="328px" height="200px"  style="object-fit:fill !important;" '
	    					   +'                  src="images/food/'+item.food_img_name+'.jpg" alt="Colorlib Template">'
							   +'               <div class="overlay"></div>'
							   +'             </div>'
							   +'             <div class="text py-3 pb-4 px-3 text-center">'
							   +'                <h3 id="food_name_text">'+item.food_name+'</h3>'
							   +'                <div class="d-flex">'
							   +'                  <div class="pricing">'
			    	           +'                     <p class="price">'
			    			   +'                       <span class="price-sale">칼로리  : '+item.food_cal+'kcal</span>'
			    			   +' 			            <br>'
			    			   +'                       <span class="price-sale">(탄:'+item.food_carb+'g / 단:'+item.food_protein+'g / 지:'+item.food_fat+'g)</span>'
			    			   +'	                  </p>'
			    			   +'                  </div>'
		    				   +'               </div>'
		    				   +'               <div class="bottom-area d-flex px-3">'
		    				   +'	                <div class="m-auto d-flex">'
		    				   +'			           <a href="javascript:addDietCart('+item.food_code+')" class="buy-now d-flex justify-content-center align-items-center mx-1">'
		    				   +' 			             <span><i class="ion-ios-cart"></i></span>'
		    			       +'                      </a>'
	    					   +'                  </div>'
	    					   +'               </div>'
	    					   +'             </div>'
	    				       +'          </div>'
					           +'     </div>';
						if(rowIdx%4==0)
							output+="</div>";
						rowIdx++;
					});
					if(rowIdx%4!=0)
						output+="</div>";
					output+="</div>";
					$("#reloadArea").append(output);
					
					//pagination
					output='';
					output+='<div class="row mt-5">'
						   +'   <div class="col text-center">'
						   +'      <div class="block-27">'
			               +'         <ul>';
			               if(data.page <=1){
			            	 output+='    <li>'
				               +'		     <a style="background:gray; color:white">&lt;</a>'         
				               +'		  </li>';  
			               }
			               else{
			            	 output+='	  <li>'             
				               +'			 <a href="configDiet.cf?page='+(data.page-1)+'">&lt;</a>'           
				               +'		  </li>';
			            	   
			               }
                           for(var a=data.startpage;a<=data.endpage;a++){
                        	   if(a == data.page){
                        		 output+='<li class="active"><span>'+a+'</span></li>';   
                        	   }
                        	   else{
                        		 output+='<li><a href="configDiet.cf?page='+a+'"><span>'+a+'</span></a></li>';
                        	   }
                           }
			               if(data.page >= data.maxpage){
				            	 output+='<li>'
					               +'		  <a style="background:gray; color:white">&gt;</a>'         
					               +'	  </li>';  
				               }
				               else{
				            	 output+='<li>'             
					               +'		 <a href="configDiet.cf?page='+(data.page+1)+'">&gt;</a>'          
					               +'	 </li>';
				            	   
				               }             
			               +'		</ul>'	              
			               +'	  </div>'		              
			               +'  </div>'	
			               +'</div>';
			               
					$("#reloadArea>.container").after(output);
				}
				
				
			}//success end
		});//ajax end
	});
	
});


