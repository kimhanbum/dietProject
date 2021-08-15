
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
     
     
