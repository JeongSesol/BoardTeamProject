<!-- 이우림 : 컨텐츠 화면구현
 	이성규 : 컨트롤러 답글 이동 코드 수정
 	박야큰 : 글수정 권한 수정 -->
<%@page import="mvc2pac.model.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	DataBean article=(DataBean)request.getAttribute("content");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	int ref=article.getRef();
	int re_step=article.getRe_step();
	int re_level=article.getRe_level();
	
	System.out.println(article.getNum());
	
	String user_id = (String) session.getAttribute("user_id");
%>
<html lang="ko">
<head>
<title>게시판</title>
</head>
<body>
<%-- <%int check = (int)session.getAttribute("u_level"); %> --%>
<%@ include file="header.jsp" %>

<div class="tm-page-container mx-auto">
<div class="tm-section">
<%@ include file="nav.jsp" %>
<div class="tm-content-container">

	<div class="mb-0 tm-img-overlay-wrap-short">
	<div class="tm-img-overlay-text text-white p-2">
		<h2 class="mb-4"><%=article.getSubject()%></h2><hr>
			<p class="tm-small2">
				작성자  <%=article.getWriter()%>　|　<%= sdf.format(article.getReg_date())%>　|　No. <%=article.getNum()%>　|　조회수 <%=article.getReadcount()%>
			</p>
	</div>
	</div>
	
<form class="form_style">
<p class="tm-content" style="text-align:left;"> <%=article.getContent()%></p>
          
<hr style="color:#eee;">
<div style="text-align:right">
	<%if (check == 1 || check == 2){
		if(user_id.equals(article.getPasswd())){%>
			<input type="button" value="글수정" 
			onclick="document.location.href='newBoard?type=updateForm&num=<%=article.getNum()%>&pageNum=<%=pageNum%>'" class="btn2 btn-primary rounded-0">
		<%}%>
	<%if (check == 2) {%>
	  <input type="button" value="글삭제" 
       onclick="document.location.href='newBoard?type=delete&num=<%=article.getNum()%>&pageNum=<%=pageNum%>'" class="btn2 btn-primary rounded-0">
	<%} %>
      <input type="button" value="답글쓰기" 
       onclick="document.location.href='newBoard?type=reply&num=<%=num%>&pageNum=<%=pageNum%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'" class="btn2 btn-primary rounded-0">
	<% } %>
       <input type="button" value="글목록" 
       onclick="document.location.href='newBoard?type=list&pageNum=<%=pageNum%>'" class="btn2 btn-primary rounded-0">
	</div>   
</form>
</div>
</div>
<%@ include file="footer.jsp" %>
</div>  
</body>
</html>