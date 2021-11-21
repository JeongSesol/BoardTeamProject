<!-- 비밀번호 찾기 화면 구현, css 작업, form 태그의 정보를 findPwPro로 전달 -->
<%@page import="mvc2pac.model.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=맑은+고딕:400,600" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-style.css" />

<html lang="ko">
<head>
<title>게시판</title>
</head>
<body>
<div class="tm-page-container mx-auto">
    <%@ include file="header.jsp" %>
    <section class="tm-section">
    <%@ include file="nav.jsp" %>
	  <div class="tm-content-container">
        <div class="tm-content tm-content-2">
          <p>
            <b>PW 찾기</b> </p><hr>
         
          <div class="tm-content">
		<form class="tm-contact-form" id="form" method="POST" action="newBoard?type=findPwPro">
      		<div class="form-group">
			Id <input type="text" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" name="id">
			<br>
			Email <input type="email" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" name="email" id="email">
			</div>
			<div style="text-align:right">
			<input type="submit" value="찾기" class="btn btn-primary rounded-0">				
			</div>
      </form>
      </div>
        </div>
       </div>
</section>
<%@ include file="footer.jsp" %> 
</div>
</body>
</html>