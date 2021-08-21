$(document).ready(function() {
    var calendarEl = document.getElementById('calendar');
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);
    var dateString = year + '-' + month  + '-' + day;
    var yearMonth=year+"/"+month;
	
	var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid'],
      header: {
    	    left:   '',
    	    center: 'title',
    	    right:  ''
      },
      defaultDate:dateString,
      navLinks: false, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {  	  
    	if(confirm("현재 날짜의 정보를 조회하시겠습니까?")){
        	var month_eng=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];  
        	var array = String(arg.start).split(" ");
        	
        	
        	var sendYear= String(array[3]).substr(2,2);
        	console.log("sendYear : " + sendYear);
        	
        	var sendMonth=month_eng.indexOf(array[1])+1;
        	if(sendMonth < 10){
        		sendMonth = "0"+ sendMonth;
    		 }
        	console.log("sendMonth : " + sendMonth);
        	
        	var sendDay = array[2];
        	console.log("sendDay : " + sendDay);
    		
    		var searchDate=sendYear+"/"+sendMonth+"/"+sendDay;
    		console.log("searchDate : " + searchDate);
    		location.href="todayDiet.to?searchDate="+searchDate; 
    	}
        calendar.unselect()
      },
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events:function(info, successCallback, failureCallback){
    	  if (calendar === undefined)
    	  {	
    		  month = Number(month);
    		  console.log("calendar is undefined : " + month);
    		  
    	  }
    	  else{
    		  if(month < 10){
    			  month = "0"+ month;
    		  }
    		  yearMonth=year+"/"+month;
    		  console.log("calendar is def : " + yearMonth);
    	  }
          $.ajax({
                 url:  'myDietLoad.to', /* '/exampleTotal/getEvents.to',*/
                 data: {"yearMonth" : yearMonth },
                 type : "post",
                 dataType: 'json',
                 success: 
                     function(result) {
                         var events = [];
                         if(result!=null){
                             
                                 $.each(result, function(index, element) {
                                 
                                  events.push({
                                         title: element.title,
                                         start: element.start,
                                         end: element.end,  
                                         color : element.color,
                                  }); //.push()
                                              
                                  
                             }); //.each()
                             
                             console.log(events);
                             
                         }//if end                           
                         successCallback(events);                               
                     }//success: function end                          
          }); //ajax end
      }, //events:function end
      
    });
	
    calendar.render();	
    $(".fc-center h2").css("display","none");
    year=$(".fc-center h2").text().split(" ")[1];
    $('#yearMonth').text(year+'년 '+month+'월 ');
    
    $("#prev").click(function(){
    	month=Number(month)-1;
    	if(month==0){
    		month=12;
    		year=Number(year)-1;
    	}
    	console.log(month);
    	calendar.prev();
    	$(".fc-center h2").css("display","none");
    	year=$(".fc-center h2").text().split(" ")[1];
    	$('#yearMonth').text(year+'년 '+month+'월 ');
    });
    
    $("#next").click(function(){
    	month=Number(month)+1;
    	if(month==13){
    		month=1;
    		year=Number(year)+1;
    	}
    	console.log(month);
    	calendar.next();
    	$(".fc-center h2").css("display","none");
    	year=$(".fc-center h2").text().split(" ")[1];
    	$('#yearMonth').text(year+'년 '+month+'월 ');
    });
    
});