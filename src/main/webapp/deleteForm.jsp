<!-- 이우림 : 글 삭제 화면 구현 // 관리자 삭제 체제로 전환  -->
<%@page import="mvc2pac.model.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=맑은+고딕:400,600" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/templatemo-style.css" />

<%
DataBean article = (DataBean) request.getAttribute("delete");
String pageNum = request.getParameter("pageNum");
//System.out.println(pageNum);
%>
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
            <b>게시물 삭제를 위한 비밀번호를 입력해주세요.</b></p><hr>
          
          <div class="tm-content">
		<form class="tm-contact-form" name="delForm" method="POST"
      		action="newBoard?type=deletePro&num=<%=article.getNum()%>&pageNum=<%=pageNum %>"
      		onsubmit="return deleteSave()" >
      		
      		<div class="form-group">
				<input type="password"  name="passwd" id="passwd"
                                class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
                                maxlength="12" placeholder="비밀번호를 입력해주세요." />
                <input type="hidden" name="num" value="<%=article.getNum()%>">
			</div>
			<div class="form-group text-right">
				<button type="submit" class="btn btn-primary rounded-0">
                                삭제하기
				</button>
				<button type="button" class="btn btn-primary rounded-0" OnClick="window.location='newBoard?type=list'">
                                목록보기
				</button>
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