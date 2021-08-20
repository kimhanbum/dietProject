//pagination,검색(체크박스 or 검색어)를 통한 화면 reload 함수
function reloadPage(page){
	var data='state=ajax&page='+page+'&';
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
				console.log("pagination start");
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
			               +'			 <a href="javascript:reloadPage('+(data.page-1)+')">&lt;</a>'           
			               +'		  </li>';
		            	   
		               }
                       for(var a=data.startpage;a<=data.endpage;a++){
                    	   if(a == data.page){
                    		 output+='<li class="active"><span>'+a+'</span></li>';   
                    	   }
                    	   else{
                    		 output+='<li><a href="javascript:reloadPage('+a+')">'
                    		        +'<span>'+a+'</span></a></li>';
                    		 /*output+='<li><a href="configDiet.cf?page='+a+'"><span>'+a+'</span></a></li>';*/
                    	   }
                       }
		               if(data.page >= data.maxpage){
			            	 output+='<li>'
				               +'		  <a style="background:gray; color:white">&gt;</a>'         
				               +'	  </li>';  
			               }
			               else{
			            	 output+='<li>'             
				               +'		 <a href="javascript:reloadPage('+(data.page+1)+')">&gt;</a>'          
				               +'	 </li>';
			            	   
			               }             
		               +'		</ul>'	              
		               +'	  </div>'		              
		               +'  </div>'	
		               +'</div>';
		               
				$("#reloadArea>.container").after(output);
				console.log("pagination end");
			}
		}//success end
	});//ajax end
}
//장바구니 식자재 추가 함수
function addDietCart(foodCode){
	console.log("addCart : " + foodCode);
	$.ajax({
		type:"post",
		url:"cfDietAdd.cf",
		data : { "foodCode" : foodCode },
		dataType:"json",
		success:function(data){
			output=""
			output+='<tr id="'+cartindex+'" class="text-center">'
				   +'<input type="hidden" value="'+data.food_code+'">'
			       +'<td class="image-prod" >'
				   +'<div class="img" style="background-image: url(images/food/'+data.food_img_name+'.jpg)">'
				   +'</div>'
				   +'</td>'
				   +'<td class="product-name" style="width:130px;">'
				   +'<h3 style="margin:5px !important;">'+data.food_name+'</h3>'				
				   +'</td>'
				   +'<td class="product-remove">'
				   +'<a href="javascript:removeDietCart('+(cartindex++)+','+data.food_cal+','+data.food_carb+','+data.food_protein+','+data.food_fat+')"><span class="ion-ios-close"></span></a></td></tr>';
			$('#CartList').append(output);
			$(".box").scrollTop($('.box')[0].scrollHeight);
			
			var count=$('#addCartCnt').text();
			$('#addCartCnt').text(Number(count)+1);
			
			var totalCal=$("#addCartCal").text();
			$("#addCartCal").text(Number(totalCal) + data.food_cal);
			
			var totalTan=$("#addCartTan").text();
			$("#addCartTan").text(Number(totalTan) + data.food_carb);
			
			var totalDan=$("#addCartDan").text();
			$("#addCartDan").text(Number(totalDan) + data.food_protein);
			
			var totalJi=$("#addCartJi").text();
			$("#addCartJi").text(Number(totalJi) + data.food_fat);
			
		}//success end
	});//ajax end
}
//장바구니 식자재 제거 함수
function removeDietCart(addindex,food_cal,food_carb,food_protein,food_fat){
	var count=$('#addCartCnt').text();
	$('#addCartCnt').text(Number(count)-1);
	
	var totalCal=$("#addCartCal").text();
	$("#addCartCal").text(Number(totalCal) - food_cal);
	
	var totalTan=$("#addCartTan").text();
	$("#addCartTan").text(Number(totalTan) - food_carb);
	
	var totalDan=$("#addCartDan").text();
	$("#addCartDan").text(Number(totalDan) - food_protein);
	
	var totalJi=$("#addCartJi").text();
	$("#addCartJi").text(Number(totalJi) - food_fat);
	
	var removeid='#'+addindex;
	$(removeid).remove();
	
	$(".box").scrollTop($('.box')[0].scrollHeight);
}
$(function(){
	cartindex=1;
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
	
	
	//스크롤이벤트가 발생시 장바구니 aside 따라오기 기능 동작
	$(window).scroll(function(){ 
		yPosition = $win.scrollTop() - 400; //이부분을 조정해서 화면에 보이도록 맞추세요 
		//console.log("$win.scrollTop(): " + $win.scrollTop());
		//console.log("yPosition : " + yPosition);
		if (yPosition < 0) 
		{ 
			yPosition = 0; 
		} 
		if(yPosition > 437){
			yPosition = 437; //357;
		}
		$layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false}); 
	}); 
	
	//식자재 리스트 검색 버튼 클릭시 화면 갱신
	$("#seach_food").click(function(){
		reloadPage(1);
	});
	
	//식단 구성 확인 클릭시, ajax로 식단 구성
	$('#make_diet').click(function(){
		if($('#addCartCnt').text() == '0'){
			alert('하나이상의 식자재를 담아주세요.');
			return false;
		}
		if($.trim($("#dietnameText").val())==""){
			alert('식단이름을 작성해주세요.');
			return false;
		}
		
		if(confirm('식단을 생성하시겠습니까?')){
			var diet_name = $('#dietnameText').val();
			var totalTan=$("#addCartTan").text();
			var totalDan=$("#addCartDan").text();
			var totalJi=$("#addCartJi").text();
			var totalCal=$("#addCartCal").text();
			
			var count=Number($('#addCartCnt').text());
			var diet_form=""
			$('tr>input:hidden').each(function(index,item){
				diet_form+=$(this).val();
				if((index+1) != count)
					diet_form+=',';
			});
	
			$.ajax({
				type:"post",
				url:"cfDietProcess.cf",
				data : { 
						"diet_name" : diet_name,
						"diet_form" : diet_form,
						"total_tan" : totalTan,
						"total_dan" : totalDan,
						"total_ji"  : totalJi,
						"total_cal" : totalCal,
					},
				dataType:"json",
				success:function(data){
					alert($('#dietnameText').val() + ' 식단이 생성되었습니다.');
					location.href="configDiet.cf";
//					$('#dietnameText').val('');
//					$('#addCartCnt').text('0');
//					$("#addCartCal").text('0');
//					$("#addCartTan").text('0');
//					$("#addCartDan").text('0');
//					$("#addCartJi").text('0');
//					$('#CartList').empty();
				},//success end
				error:function(data){
					alert('로그인이 필요한 서비스입니다.');
					location.href='login.net';
				}//success end
			});//ajax end
		
		}
	});
	
	//장바구니에 담은 식자재 및 식단 이름 모두 초기화
	$('#reset_cart').click(function(){
		if(confirm('카트에 담긴 내용을 초기화 하시겠습니까?')){
			$('#dietnameText').val('');
			$('#addCartCnt').text('0');
			$("#addCartCal").text('0');
			$("#addCartTan").text('0');
			$("#addCartDan").text('0');
			$("#addCartJi").text('0');
			$('#CartList').empty();
			
		}
	});
});


