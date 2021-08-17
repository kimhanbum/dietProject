<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<div class="py-1 bg-primary">
  	<div class="container">
  		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
   		<div class="col-lg-12 d-block">
    		<div class="row d-flex">
    			<div class="col-md pr-4 d-flex topper align-items-center">
			    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
				    <span class="text"> 070-8240-3211 </span>
			    </div>
			    <div class="col-md pr-4 d-flex topper align-items-center">
			    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
				    <span class="text">edu@jhta.co.kr</span>
			    </div>
			    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
				    <span class="text">Happy &amp; Healthy</span>
			    </div>
		    </div>
	    </div>
    </div>
  </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
 <div class="container">
   <a class="navbar-brand" href="index.html">건강한 다이어트 </a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
     <span class="oi oi-menu"></span> 메뉴
   </button>

   <div class="collapse navbar-collapse" id="ftco-nav">
     <ul class="navbar-nav ml-auto">
       <li class="nav-item active"><a href="index.html" class="nav-link">홈</a></li>
       <li class="nav-item dropdown">
          <a class="nav-link " href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">식단 구성</a>
 
        </li>
       <li class="nav-item"><a href="about.html" class="nav-link">식단 공유</a></li>
       <li class="nav-item"><a href="blog.html" class="nav-link">레시피 공유</a></li>
       <li class="nav-item"><a href="contact.html" class="nav-link">My 식단</a></li>
        <li class="nav-item"><a href="contact.html" class="nav-link">공지 사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
       <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-markunread"></span>[0]</a></li>
             
     </ul>
    
     <div class="login">
      <c:if test="${empty id}">
      <a  id="login" href="login.net">로그인</a>&nbsp;&nbsp;&nbsp;
         <a  id="join" href="join.net">회원가입</a>
         </c:if>
         <c:if test="${!empty id}">
          <a  id="mypage" href="mypage.my">마이페이지</a>
          <a  href="logout.net">로그아웃</a>
         </c:if>
      </div>
    </div>
  </div>
</nav>