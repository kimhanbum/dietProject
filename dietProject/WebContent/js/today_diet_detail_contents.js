/* 모달 식사 타입 선택 ▼ */
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
	location.href="todayDiet.to?today=-1";
})    
$("#weekRightbtn").click(function(){
	location.href="todayDiet.to?today=+1";
})

/*$(document).on('click','#weekLeftbtn',function(){
})
*/

$(".mon").click(function(){
	location.href="todayDiet.to?today=-5";
})    
$(".tue").click(function(){
	location.href="todayDiet.to?today=-4";
})    
$(".wed").click(function(){
	location.href="todayDiet.to?today=-3";
})    
$(".thu").click(function(){
	location.href="todayDiet.to?today=-2";
})    
$(".fri").click(function(){
	location.href="todayDiet.to?today=-1";
})    
$(".sun").click(function(){
	location.href="todayDiet.to?today=+1";
})    

  /* 서브모달 이미지 선택 이벤트 */

   
   
