<!-- 김윤서 : 이메일 검색해서 체크하는 페이지  -->
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
								 <p><b>ID 찾기</b></p><hr>
					<div class="tm-content">
						<form action="newBoard?type=findIdPro" method="post">
							<div class="form-group">
								<input type="email" id="email" name="email" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" placeholder="회원 가입시 등록한 email 주소" > 
							</div>
							<div style="text-align: right;">
								<input type="submit" class="btn btn-primary rounded-0"
									name="button" id="button" value="찾기">

							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<%@ include file="footer.jsp"%>
	</div>

</body>
</html>