
   $(document).ready(function(){
	   
     $("#downbtn").change(function(){
       if($("#downbtn").val() == ""){  
    	  $("#domain").text("").focus();
    	  $("#domain").prop("readonly",false);
       }else{    
    	  $("#domain").text($("#downbtn").val());
    	  $("#domain").prop("readOnly",true);
     }
    }); 
   });
     
/* 날짜변경  버튼 이미지 클릭 이벤트 */    
$("#weekLeftbtn").click(function(){
	location.href="todayDiet.to?today1=";
})    
   
   
   
