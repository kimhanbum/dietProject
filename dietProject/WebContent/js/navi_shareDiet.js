//pagination,검색(체크박스 or 검색어)를 통한 화면 reload 함수
function reloadPage(page){
	var data='state=ajax&page='+page+'&';
	if($.trim($("#searchText").val()) !=""){
		data+="search="+$("#searchText").val()+"&";
	}
	
	if($('input[type="checkbox"]:checked').length> 0)
	{
	   data+="nutrient_type="+$('input[type="checkbox"]:checked').val();+"&";
	}
	console.log("data: " + data);
	
	$.ajax({
		type:"post",
		url:"shareDietMain.sd",
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
				$(data.dietList).each(function(index,item){
					if(rowIdx%4==1)
						output+='<div class="row">';
				    output+='      <div class="col-md-6 col-lg-3" ftco-animate>'
    				       +'          <div class="product">'
    					   +'             <div class="img-prod" style="text-align : center;">'
    					   +'               <img  width="328px" height="200px"  style="object-fit:fill !important;" '
    					   +'                  src="images/'+"product-1"+'.jpg" alt="Colorlib Template">'
						   +'               <div class="overlay"></div>'
						   +'             </div>'
						   +'             <img  style="position: relative; right:-5px; top: -35px;z-index:1000 " width="30px" height="30px" src="images/like.png" alt="like">'
						   +'             <span style="position: relative; right:-4px; top: -30px; z-index:1000"><b style="color:black;">'+item.diet_recomm+'</b></span>'
						   +'             <div class="text py-3 pb-4 px-3 text-center">'
						   +'                <h3 id="food_name_text">'+item.diet_name+'</h3>'
						   +'                <div class="d-flex">'
						   +'                  <div class="pricing">'
		    	           +'                     <p class="price">'
		    			   +'                       <span class="price-sale">칼로리  : '+item.diet_total_cal+'kcal</span>'
		    			   +' 			            <br>'
		    			   +'                       <span class="price-sale">(탄:'+item.diet_total_carb+'g / 단:'+item.diet_total_protein+'g / 지:'+item.diet_total_fat+'g)</span>'
		    			   +'	                  </p>'
		    			   +'                  </div>'
	    				   +'               </div>'
	    				   +'               <div class="bottom-area d-flex px-3">'
	    				   +'	                <div class="m-auto d-flex">'
	    				   +'			           <a href="javascript:addMyDietList('+item.diet_code+')" class="buy-now d-flex justify-content-center align-items-center mx-1">'
	    				   +' 			             <span><i class="ion-ios-cart"></i></span>'
	    			       +'                      </a>'
	    				   +'			           <a href="javascript:addlike('+item.diet_code+')" class="buy-now d-flex justify-content-center align-items-center mx-1">'
	    				   +' 			             <span><i class="ion-ios-heart"></i></span>'
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

//좋아요 클릭 ajax 이벤트
function addlike(code){
	console.log("likecode :" + code);
	$.ajax({
		type:"post",
		url:"shareDietLike.sd",
		data : {
			"likeCode":code
		},
		dataType:"json",
		success:function(data){
			if(data==1){
				alert("좋아요를 눌렀습니다.");
				var updateCode='#'+code;
			    var currCnt = $(updateCode).text();
			    $(updateCode).text(Number(currCnt)+1);
			}
			else{
			   alert('이미 좋아요를 누른 식단입니다.');
			}
		},//success end
		error:function(data){
			alert('로그인이 필요한 서비스입니다.');
			location.href='login.net';
		}//success end
	});//ajax end
}

//식단 담기 클릭시 발생 ajax이벤트
function addMyDietList(code){
	console.log("addDietcode :" + code);
	$.ajax({
		type:"post",
		url:"shareDietAdd.sd",
		data : {
			"addDietCode":code
		},
		dataType:"json",
		success:function(data){
			if(data==1){
				alert("식단을 담았습니다.");
			}
			else{
			   alert('이미 담은 식단입니다.');
			}
		},//success end
		error:function(data){
			alert('로그인이 필요한 서비스입니다.');
			location.href='login.net';
		}//success end
	});//ajax end
}

$(function(){
	//식자재 리스트 검색 버튼 클릭시 화면 갱신
	$("#seach_diet").click(function(){
		reloadPage(1);
	});

	//체크박스 선태은 하나만 체크하도록하는 클릭 이벤트
	$('input[type="checkbox"]').click(function(){
		 if($(this).prop('checked')){
			 $('input[type="checkbox"]').prop('checked',false);
			 $(this).prop('checked',true);
		 }
		  
	 });
});


