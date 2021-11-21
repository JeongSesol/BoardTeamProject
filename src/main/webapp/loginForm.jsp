<!-- 정세솔 : 화면구현 , CSS작업
	이성규 : 로그인 폼 유효성 검사 자바스크립트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script type="text/javascript" src="script.js"></script>
<body>
<%@ include file="header.jsp" %>
<div class="tm-page-container mx-auto">
<section class="tm-section">
<%@ include file="nav.jsp" %>
<div class="tm-content-container">
    <div class="tm-content">
         <form action="newBoard?type=login" method="post">
          <h2 class="tm-page-title">Login</h2>
          <p class="mb-4">
            ID
          </p>
          <input type="text" name="user_id" maxlength="20" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" placeholder="" required/>
        <p></p>
          <p>
            PW
          </p>
           <input type="password" name="user_password" maxlength="20" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" placeholder="" required/>
           
           <a href="newBoard?type=join" class="a_tag">Join</a>
           <a href="newBoard?type=IDPW" class="a_tag">ID/PW 찾기</a>
           <div style="text-align:right">
           <input type="submit" value="Login" class="btn btn-primary rounded-0" onclick="return checkFormValue()">
           </div>
        </form>
        </div>

      </div>
          
</section>
        <%@ include file="footer.jsp" %>
</div>
</body>

</html>