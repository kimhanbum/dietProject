<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지 기본양식 입니다</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/myPage.css" type="text/css">
<link href='../packages/core/main.css' rel='stylesheet' />
<link href='../packages/daygrid/main.css' rel='stylesheet' />
<link href='../packages/timegrid/main.css' rel='stylesheet' />
<script src='../packages/core/main.js'></script>
<script src='../packages/interaction/main.js'></script>
<script src='../packages/daygrid/main.js'></script>
<script src='../packages/timegrid/main.js'></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 800px;
    margin: 0 auto;
  }
  #btn-group{
  	margin: 0 auto;
  }
  #colorList{
  	margin: 0 auto; width: 800px;
  }
  .color-circle{
  	display:inline-block;
	width:40px; height:30px;
	border-radius:90%;
	text-align:center;
	margin:0 auto;
	vertical-align:middle;
  }
  .color-info{
  	vertical-align:middle; 
  	margin-right:50px;
  }
</style>
</head>
<body class="goto-here">

	<!-- 헤더 영역  -->
 	<jsp:include page="../comm/header.jsp" />  

	<!-- 중간 이미지 & 텍스트 출력부 -->
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">My</a></span> <span>home</span>
					</p>
					<h1 class="mb-0 bread">마이페이지</h1>
				</div>
			</div>
		</div>
	</div>

	<!-- 마이 페이지 좌측 side 메뉴들 -->
	<aside class="ftco-section">
		<div class="asideLeft_container">
			<a href="#"><span class="icon-home2">&nbsp;&nbsp;</span>마이홈페이지 </a>			
			<ul>
				<hr>
				<li><p class="icon-receipt">&nbsp;&nbsp;콘텐츠</p>
					<ul>
						<li><a href="#">내정보</a></li>
						<li><a href="#">Today 식단</a></li>
						<li><a href="#">식단 리스트</a></li>
						<li><a href="#"></a></li>
					</ul>
				</li>
				<hr>
				<li><p class="icon-chat_bubble_outline">&nbsp;&nbsp;댓글·방명록</p>
					
					<ul>
						<li><a href="#">나의 공유식단</a></li>
						<li><a href="#">나의 레시피</a></li>
						<li><a href="#">내가 남긴 댓글</a></li>
						<li><a href="#">내게 남긴 댓글</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</aside>

	<!-- 마이페이지 중앙 article -->
	<article class="ftco-section">
		<div style="border:1px solid black;">
			<div class="d-flex justify-content-around mb-3" style="margin:16px 0px 0px 0px !important">
		 		<button id="prev" class="p-2 btn btn-dark">이전</button>
		 		<div id="yearMonth" style="vertical-align: center; font-size: 30px;"></div>
	  			<button id="next" class="p-2 btn btn-dark">이후</button>
	  		</div>
	  		<br>
	  		<div id="colorList">
	  			<div class="color-circle" style="background-color:green;"></div>
	  			<span class="color-info">&nbsp;아침</span>
	  			<div class="color-circle" style="background-color:orange;"></div>
	  			<span class="color-info">&nbsp;점심</span>
	  			<div class="color-circle" style="background-color:yellow;"></div>
	  			<span class="color-info">&nbsp;저녁</span>
	  			<div class="color-circle" style="background-color:blue;"></div>
	  			<span class="color-info">&nbsp;간식</span>
	  			<div class="color-circle" style="background-color:pink;"></div>
	  			<span class="color-info">&nbsp;물</span>
	  		</div>
  		 	
	  		<br>
	  		<div id='calendar'></div>
	  		<br>
	  		
  		</div>
	</article>
	
	<!-- 마이페이지 우측 side -->
	<aside class="ftco-section">
		<div class="asideRight_container">
			<fieldset>
			<span class='title'>목 표  / 현재  / 섭취가능</span>
			 <div>    
			   <div class="one"><div>칼로리</div></div>
			   <div class='title'>1750 / 850 / 900</div>
			 </div>
			 <div>    
			   <div class="two">
				 <div>영양소</div>
				 <div>탄수화물</div>
			   </div>     
			   <div class='title'>100 / 70 / 30</div>
			 </div>
			 <div>    
			   <div class="three">
				 <div>영양소</div>
				 <div>단백질</div>
			   </div>     
			   <div class='title'>100 / 60 / 40</div>
			 </div>
			 <div>    
			   <div class="four">
				 <div>영양소</div>
				 <div>지방</div>
			   </div>     
			   <div class='title'>100 / 50 / 50</div>
			 </div>
			 <div>    
			   <div class="five">
				 <div>물</div>
			   </div>     
			   <div class='title'>8잔 / 5잔 / 3잔</div>
			 </div>
			 <div>    
			   <div class="six">
				 <div>운동</div>
			   </div>     
			   <div class='title'>800kcal / 200kcal / 600kcal</div>
			 </div>
		   </fieldset> 
		 </div>
	</aside>

	<!-- footer 영역1 -->
 	<jsp:include page="../comm/footer_Subcribe.jsp" />  

	<!-- footer 영역2 -->
	<jsp:include page="../comm/footer_info.jsp" />  
<script>
$(document).ready(function() {
    var calendarEl = document.getElementById('calendar');
    
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);
    var dateString = year + '-' + month  + '-' + day;
	
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
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
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
    		  console.log("calendar is def : " + month);
    	  }
          $.ajax({
                 url: '/exampleTotal/getEvents.to',
                 data: {"curentMonth" : month },
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
                                         color : "#FF0000",
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
    	}
    	console.log(month);
    	calendar.next();
    	$(".fc-center h2").css("display","none");
    	year=$(".fc-center h2").text().split(" ")[1];
    	$('#yearMonth').text(year+'년 '+month+'월 ');
    });
    
  });


</script>
</body>
</html>