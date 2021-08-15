<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../comm/header.jsp"/>
<style>
button{
 
   margin-bottom:-100px;
    margin-left:920px;

    width:12%
 }
table> thead > tr > th:nth-child(1){width:10%}
table> thead > tr > th:nth-child(2){width:55%}
table> thead > tr > th:nth-child(3){width:10%}
table> thead > tr > th:nth-child(4){width:18%}
table> thead > tr > th:nth-child(1){width:7%}
 
</style>

</head>
<body class="goto-here">

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.jsp">Home</a></span> <span>DIET</span>
					</p>
					<h1 class="mb-0 bread">문의 작성</h1>
				</div>
			</div>
		</div>
	</div>
    <div class="container" >
      <button type="button" class="btn btn-primary" style="font-size:1rem;border-radius:10px">
           문의 작성</button>
   
	<div class="container" style="margin-top:100px">
	<table class="table table-hover" style="border-top:2px solid #82ae46;width:70%" align="center" >
    <thead>
      <tr style="background-color: #d2cfcfbf;color:white">
        <th>번 호</th>
        <th>제 목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td class="icon-lock2">ㅇ</td>
        <td>땡땡</td>
        <td>날짜1</td>
        <td>10</td>
      </tr>
      <tr>
        <td>2</td>
        <td class="icon-lock2">ㄹ</td>
        <td>땡땡</td>
        <td>날짜2</td>
         <td>10</td>
      </tr>
      <tr>
        <td>3</td>
        <td class="icon-lock2">ㅎ</td>
        <td>땡땡</td>
        <td>날짜</td>
         <td>10</td>
      </tr>
    </tbody>
  </table>

	</div>
	<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>

 </div>
	<hr style="margin-top:4rem">


	<jsp:include page="../comm/footer_Subcribe.jsp"/>
	<jsp:include page="../comm/footer_info.jsp" />





</body>
</html>