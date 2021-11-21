<!-- 이성규 : 글 작성자 수정 불가 코드
	정세솔  : 화면 구현, css 작업 
	박야큰 : 업데이트폼수정 ??-->
<%@page import="mvc2pac.model.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">
<%@ include file="header.jsp" %>
 
<div class="tm-page-container mx-auto">
<div class="tm-section">
<%@ include file="nav.jsp" %>
<div class="tm-content-container">
<div class="tm-content">
<%
int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  DataBean article = (DataBean) request.getAttribute("update");
  String user_id = (String) session.getAttribute("user_id");
  String email = (String) session.getAttribute("email");
%>

<form method="post" name="writeform" class="form_style"
action="newBoard?type=update&pageNum=<%=pageNum%>&num=<%=article.getNum() %>" onsubmit="return writeSave()">
<table class="update_style">
  <tr>
    <td>이 름</td>
    <td>
       <input type="text" size="10" maxlength="6" name="writer"
         value="<%=article.getWriter()%> " class="form-control rounded-0 border-top-0 border-right-0 border-left-0" readonly>
	   <input type="hidden" name="num"  value="<%=article.getNum()%> "></td>
  </tr>
  <tr>
    <td>제 목</td>
    <td>
       <input type="text" size="40" maxlength="30" name="subject"
         value="<%=article.getSubject()%>"  class="form-control rounded-0 border-top-0 border-right-0 border-left-0"></td>
  </tr>
  <tr>
    <td>Email</td>
    <td>
       <input type="text" size="40" maxlength="20" name="email"
        value="<%=email%>" class="form-control rounded-0 border-top-0 border-right-0 border-left-0"></td>
  </tr>
  <tr>
    <td>내 용</td>
    <td>
     <textarea name="content" rows="13" cols="40"
       class="form-control rounded-0 border-top-0 border-right-0 border-left-0"maxlength="160"> <%=article.getContent()%></textarea></td>
  </tr>
  <tr>
    <td>
     <input type="hidden" size="8" maxlength="12" value="<%=article.getPasswd() %>"
               name="passwd" class="form-control rounded-0 border-top-0 border-right-0 border-left-0">

	 </td>
  </tr>
 </table>
 <div style="text-align:right; margin-top:50px;">
 <input type="submit" value="글수정" class="btn btn-primary rounded-0">
 <input type="reset" value="다시작성" class="btn btn-primary rounded-0">
 <input type="button" value="목록보기" class="btn btn-primary rounded-0"
       onclick="document.location.href='newBoard?type=list&pageNum=<%=pageNum%>'">
  </div>
</form>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>
