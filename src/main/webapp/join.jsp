<!--이우림 : 회원가입 화면구현
	회원가입 양식 유효성 검사  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=맑은+고딕:400,600" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-style.css" />
<script type="text/javascript" src="script.js"></script>
</head>

<body>

	<div class="tm-page-container mx-auto">

		<%@ include file="header.jsp"%>

		<section class="tm-section">
			<%@ include file="nav.jsp"%>
			<div class="tm-content-container">
				<div class="mb-0 tm-img-overlay-wrap">
					<div class="tm-img-overlay"></div>
					<div class="tm-img-overlay-text text-white p-5">
						<h4 class="mb-4">회원가입</h4>
						<p class="tm-small">환영합니다.</p>
					</div>
				</div>
				<div class="tm-content">
					<form name="frm" method="POST" action="newBoard?type=joinPro">

						<div class="form-group">

							<input type="text" name="user_name" id="user_name"
								class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
								maxlength="6" placeholder="이름" required />
						</div>
						<div class="form-group">
							<input type="text" name="user_id" id="user_id"
								class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
								maxlength="20" placeholder="ID" pattern="^[a-zA-Z0-9]+$" required />
						</div>

						<div class="form-group">
							<input type="password" name="user_password" id="user_password"
								class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
								maxlength="20" placeholder="비밀번호" pattern="^[a-zA-Z0-9]+$" required />
						</div>
						<div class="form-group">
							<input type="password" name="user_password2" id="user_password2"
								class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
								maxlength="20" placeholder="비밀번호 확인" />
						</div>

						<div class="form-group">
							<input type="text" name="mobile" id="mobile"
								class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
								maxlength="13" placeholder="전화번호"  />
						</div>
						<div class="form-group">
							<input type="text" name="email" id="emial"
								class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
								maxlength="30" placeholder="이메일" pattern="^[a-zA-Z0-9]+$" required/>
						</div>

						<div class="form-group">
							<input type="text" id="date"
								class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
								maxlength="20" placeholder="등록일" readonly />
						</div>
						<div style="text-align: right">
							<button type="button" onclick="check()"
								class="btn btn-primary rounded-0">회원등록</button>
							<button type="reset" class="btn btn-primary rounded-0">취소</button>
						</div>
					</form>
				</div>
			</div>
		</section>


		<%@ include file="footer.jsp"%>

	</div>
</body>
<script type="text/javascript">
	document.getElementById('date').value = new Date().toISOString().substring(
			0, 10);
</script>
</html>