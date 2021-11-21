<!-- 김윤서 : ID찾기와 PW찾기 구분페이지  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="tm-page-container mx-auto">
	<section class="tm-section">
	<%@ include file="nav.jsp"%>
		<div class="tm-content-container">
		<div class="tm-content tm-content-2">
			<p><b>회원 정보 찾기</b></p><hr>
		<div class="tm-content">
			
			<a href="newBoard?type=findIdPw&find=findId">ID 찾기</a>  <b> / </b>  <a href="newBoard?type=findIdPw&find=findPw">비밀번호 찾기</a>

		</div>
		</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	</div>
</body>
</html>