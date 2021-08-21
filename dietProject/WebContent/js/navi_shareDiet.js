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
    					   +'               <button id="DetailDietbtn" value="'+item.diet_code+'" class="img-prod" data-toggle="modal" data-target="#myModal">'
    					   +'               	<img  width="328px" height="200px"  style="object-fit:fill !important;" '
    					   +'                 	 src="images/food/'+item.diet_img_name+'.jpg" alt="Colorlib Template">'
						   +'               	<div class="overlay"></div>'
						   +'               </button>'
						   +'             </div>'
						   +'             <img  style="position: relative; right:-5px; top: -35px;z-index:1000 " width="30px" height="30px" src="images/like.png" alt="like">'
						   +'             <span style="position: relative; right:-4px; top: -30px; z-index:1000"><b id="'+item.diet_code+'"style="color:black;">'+item.diet_recomm+'</b></span>'
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
	    				   +'			           <a href="javascript:addMyDietList(\''+item.diet_code+'\')" class="buy-now d-flex justify-content-center align-items-center mx-1">'
	    				   +' 			             <span><i class="ion-ios-cart"></i></span>'
	    			       +'                      </a>'
	    				   +'			           <a href="javascript:addlike(\''+item.diet_code+'\')" class="buy-now d-flex justify-content-center align-items-center mx-1">'
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
			else if(data==2){
			   alert('이미 담은 식단입니다.');
			}
			else if(data==3){
			   alert('내 식단은 담을 수 없습니다.');
			}
		},//success end
		error:function(data){
			alert('로그인이 필요한 서비스입니다.');
			location.href='login.net';
		}//success end
	});//ajax end
}

function displayReplyList(data){
	$('.comment_list').empty();
	
	//detain view comment count 
	$('#count').text(data.commentlist.length);
	
	if(option==1){  //등록순인 경우 등록순이 'red', 최신순이 'gray'로 글자색을 나타냅니다.
		$('#order_olddate').attr('class','comment_tab_item red');
		$('#order_newdate').attr('class','comment_tab_item gray');
	}else if(option==2){ //최신순인 경우 등록순이 'gray', 최신순이 'red'로 글자색을 나타냅니다.
		$('#order_olddate').attr('class','comment_tab_item gray');
		$('#order_newdate').attr('class','comment_tab_item red');
	}
	
	console.log("id : " + $("#loginid").val());
	console.log("dietCode : " + $("#reply_dietCode").val());
	
	var output="";
	//detail view comment
	if(data.commentlist.length > 0)
	{
		output="";
		$(data.commentlist).each(function(index,item){
			output +=' <li id="'+this.diet_re_num+'" class="CommentItem">'
				    +'     <div class="comment_area">'
					+'        <img  src="images/profile.png" alt="pic" width="36" height="36">'
					+'        <div class="comment_box">'
				    +'             <div class="comment_nick_box">'
	                +'                  <div class="comment_nick_info">'
					+'                      <div class="comment_nickname">'+item.id+'</div>'
					+'		            </div>'                 
					+'	           </div>'
					+'        </div>'
			        +'        <div class="comment_text_box">'
				    +'           <p class="comment_text_view">'
					+'              <span class="text_comment">'+item.diet_re_content+'</span>'
					+'           </p>'
					+'        </div>'
					+'        <div class="comment_info_box">'
				    +'           <span class="comment_info_date">'+item.diet_re_date+'</span>'
					+'        </div>';
					
				if($("#loginid").val()==item.id){  
					output +='<div class="comment_tool">'
					+'             <div title="더보기" class="comment_tool_button">'
				    +'			        <div>&#46;&#46;&#46;</div>'
					+'             </div>'
					+'             <div id="commentItem'+this.diet_re_num+'"  class="LayerMore">' //스타일에서 display:none; 설정함
					+'                <ul class="layer_list">'							   
					+'                    <li class="layer_item">'
					+'                       <a href="javascript:updateForm(' + this.diet_re_num + ')" class="layer_button">수정</a> &nbsp;&nbsp;'     
				    +'                       <a href="javascript:del(' + this.diet_re_num + ')" class="layer_button">삭제</a>'
				    +'                    </li>'
					+'                </ul>'
				    +'            </div>'
					+'       </div>	';	
				}
					
			output +='    </div>'
			        +'</li>';
		});
	}
	$(".comment_list").append(output);
}
function getList(state){
    option=state;//현재 선택한 댓글 정렬방식을 저장합니다. 1=>등록순, 2=>최신순
	$.ajax({
		type:"post",
		url:"dietReplyLoad.dt",
		data : {
				"reply_dietCode" : $("#reply_dietCode").val() , 
			     state:state
			   },
		dataType:"json",
		success:function(data){
			displayReplyList(data);
		}//success end
	});//ajax end
}//function(getList) end
function updateForm(num){
	//선택한 내용을 구합니다.
	var content = $("#"+num).find(".text_comment").text();
	
	var selector = '#'+num+' .comment_area';
	$(selector).hide();  //selector 영역 숨겨요 -수정에서취소를 선택하면 보여줄 예정입니다.
	
	//글이 있던영역에 글을 수정할 수 있는 폼으로 바꿉니다.
	selector=$('#'+num);
	selector.append($('.comment_list+.CommentWriter').clone());
	
	//댓글 쓰기 영역 숨깁니다.
	$('.comment_list+.CommentWriter').hide();
	
	//수정폼의 textarea에 내용을 나타냅니다.
	selector.find('textarea').val(content);
	
	//.btn_register 영역에 수정할 글 번호를 속성 data-id에 나타내고 클래스 update를 추가하며 등록을 수정 완료
	selector.find('.btn_register').attr('data-id',num).addClass('update').text('수정완료');
	
	//폼에서 취소를 사용할 수 있도록 보이게 합니다.
	selector.find('.btn_cancel').css('display','block').addClass('update_cancel');

	selector.find('.comment_inbox_count').text(content.length + "/200");
}
function del(num){
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}
	$.ajax({
		url : "dietReplydelete.dt",
		data : {num:num},
		success:function(rdata){
			if(rdata==1){
				getList(option);
			}
		}
	});
}
$(function(){
	option=1; //기본은 등록순으로 시작
	
	/* 식단 상세보기 버튼 이벤트*/
	$(".img-prod").on("click","#DetailDietbtn",function(){
		option=1;
		var dcode=$(this).val();
		var data ="dcode="+dcode+"&state="+option;
		$.ajax({
			url :"dietDetail.dt",
			type :"post", 
			data : data,
			dataType : "json",
			cache : false,
			success : function(data){
				var output='';
				$('.modal-content>div:eq(1)').empty();
				
				
				//detail view header 
				$('#detailTitle').text(data.diet_name);
			    var dietInfo="("+data.diet_total_cal+"kcal/"
	            				+"탄수화물"+data.diet_total_carb+"g/"
	            				+"단백질"+data.diet_total_protein+"g/"
	            				+"지방"+data.diet_total_fat+"g"+")";
	            $('#detailNutr').text(dietInfo);

				
				//detail view img & food name 
				var divIdx=0;
				output=""; 
				$(data.foodlist).each(function(index,item){
					if(divIdx%3==0)
						output+="<div class='row'  style='text-align: center;'>";
				
					output+="<div class='col-sm-2 img' "
							+ " style='background-image:url(images/food/"+item.food_img_name+".jpg); "
							+ "background-size: 100px;'></div>";
					output+="<div class='col-sm-2'><h5>" + item.food_name+ "</h5></div>";
					console.log("i : " + divIdx +", foodname : "+item.food_name + ", foodimgname : "+ item.food_img_name);
					if(divIdx%3==2)
						output+="</div>";
					divIdx++;
				});
				if(divIdx%3!=2)
					output+="</div>";
				$('.modal-content>div:eq(1)').append(output);
				
				//detail view like count & img
				$('#detailComm').text(data.diet_recomm);
				
				//set hiden tag value(current diet code) 
				$("#reply_dietCode").val(data.diet_code);
				
				//display reply list
				displayReplyList(data);
			},
			error : function(){
				console.log('에러');
			}
		});
	});
	
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
	
	/*	댓글입력시 타이핑 글자수 증가*/
	$('.CommentBox').on('keyup','.comment_inbox_text',function(){
		var length=$(this).val().length;
		$(this).prev().text(length+'/200');
	});
	
	
	
	$('ul+.CommentWriter .btn_register').click(function(){
		var content = $('.comment_inbox_text').val();
		if(!content){
			alert("댓글을 입력하세요");
			return;
		}
		$.ajax({
			url : 'dietReplyAdd.dt',
			data : {
				id:$('#loginid').val(),
				diet_code : $("#reply_dietCode").val(),
				content : content
			},
			type : "post",
			success : function(rdata){
				if(rdata==1){
					getList(option);
				}
			}
		});
		
		$('.comment_inbox_text').val(''); 	//textarea 초기화
		$('.comment_inbox_count').text(''); //입력한 글 카운트 초기화
	});
	
	$(".comment_list").on("click",".comment_tool_button",function(){
		var selector = $(this).next();
		
		if($(".comment_list+.CommentWriter").css('display') == 'block'){
			selector.toggle();
			
			//더보기를 여러개 선택하더라도 최종 선택한 더보기 한개만 보이도록 합니다.
			if(selector.css('display')=='block'){
				$('.LayerMore').not(selector).css("display",'none');
			}
		}else{
			alert('작업 완료 후 선택해 주세요');
		}
	});
	
	$(".comment_list").on("click",".LayerMore",function(){
		$(this).hide();
	});
	
	
	$('.CommentBox').on('click','.update',function(){
		console.log("수정완료");
		
		var content = $(this).parent().parent().find('textarea').val();
		if(!content){
			alert("수정할 내용을 입력하세요");
			return
		}
		$('.comment_list+.CommentWriter').show();
		$.ajax({
			url:"dietReplyUpdate.dt",
			data : { num:$(this).attr('data-id'), content:content},
			success :function(rdata){
				if(rdata==1){
					getList(option);
				}
			}
		});
	});
	
	$('.CommentBox').on('click','.update_cancel',function(){
		//댓글 번호를 구합니다.
		var num = $(this).next().attr('data-id');
		var selector ="#"+num;
		
		//selecotr의 후소눙 .CommentWriter 영역을 삭제합니다.
		$(selector + ' .CommentWriter').remove();
		
		//댓글 쓰기 영역 보이도로 합니다.
		$('.comment_list+.CommentWriter').show();
		
		//숨겨두었던 comment_Area 영역 보여줍니다.
		$(selector + '>.comment_area').css('display','block');
	});
	
});


