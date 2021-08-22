function go(page){
	
	var data='state=ajax&page='+page;
	ajax(data);
}

      

function ajax(sdata){
	  console.log("fdsa" + sdata);
	  output="";      
	  $.ajax({
		   url: "shareRecipe.sr",
		   type: "post",
		   dataType: "json",		   
		   data: sdata,		   
		   success: function(rdata){
			  
			   console.log(rdata);
			   $("#div_image").empty();
			   if(rdata.listCount>0){
					   
				   $(rdata.recipeList).each(function(index,item){
					   console.log(rdata.recipeList);
				   output+= '<div class="col-md-6 col-lg-3 ">';
				   output+= '<div class="product">';
				   output+= '<a href="shareRecipeDetail.sr?recipeCode=' + item.recipe_code + '" class="img-prod"><img width="328px" height="232px"'
						  + 'src="images/' + item.recipe_file + '" alt="Colorlib Template">';
				   output+= '<div class="overlay"></div> </a>';
				   output+= ' <div class="text py-3 pb-4 px-3 text-center"> ';
				   output+= '<h3>';
				   output+= '<a href="recipeDetail.rc?recipeCode=' + item.recipe_code + '">' + item.recipe_subject.replace(/</g,"&lt;").replace(/>/g,"&gt;") +'</a>';	   
				   output+= '</h3>';
				   output+= '<div class="d-flex">';
				   output+= '<div class="pricing">';
				   output+= '<p class="price">';
				   output+= '<span class="price-sale">' + item.recipe_content.replace(/</g,"&lt;").replace(/>/g,"&gt;") + '</span>';
				  
				   output+= '</p></div></div>';
				   output+= '<div class="bottom-area d-flex px-3">';
				   output+= '<div class="m-auto d-flex">';
				   output+= '<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">';
				   output+= '<span><i class="ion-ios-menu"></i></span></a>';
				   output+= '<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">';
				   output+= '<span><i class="ion-ios-cart"></i></span>';
				   output+= '</a> <a href="#" class="heart d-flex justify-content-center align-items-center "> ';
				   output+= '<span><i class="ion-ios-heart"></i></span></a></div></div></div></div></div>';	   
				   })
				   output+= '</div>';  
				   $("#div_image").append(output);
				
				   
				   
				   $("#ul_paging").empty();
				   
				   output="";
				   if(rdata.page<=1){
					   output+=' <li><a class="active">&lt;</a></li>';			   
				   }else{
					   output+=' <li><a href="javascript:go('+ (rdata.page - 1) + ')" class="lin">&lt;</a></li>';
				   }
				   for(var i=rdata.startPage;i<=rdata.endPage;i++){
					   if(i==rdata.page){
						   output+='<li><a class="active">'+i + '</a></li>';
					   }else{
						   output+='<li><a href="javascript:go('+i + ')" class="lin">' + i + '</a></li>';
					   }
				   }
				   console.log(i);
				   if(rdata.page>=rdata.maxPage){
					   output+='<li><a class="active">&gt;</a></li>';
				   }else{
					   output+='<li><a href="javascript:go('+ (rdata.page + 1) + ')" class="lin">&gt;</a></li>';
				   }
				   
				   $("#ul_paging").append(output);
				   console.log(output);
			   }
			   
			   
		   },
		   error:function(){
				console.log("에러");
			}	  
	  });	
};


$(function(){
	
    $("button").click(function(){
    	
    	 location.href="shareRecipeInsert.sr";
    })


    


})











