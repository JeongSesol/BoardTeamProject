<!-- 이성규 : 상단 오른쪽 문구 추가, 권한별 글쓰기 버튼 유무 코드
	정세솔 : 화면 구현, css 작업 -->
<%@page import="mvc2pac.model.PageObject"%>
<%@page import="mvc2pac.model.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
List<DataBean> list = (List<DataBean>) request.getAttribute("list");

PageObject pg = (PageObject) request.getAttribute("pgData");
System.out.println(pg.getTotalPage());
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
int number = pg.getNumber();
%>
<html lang="ko">
<head>
<title>게시판</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="tm-page-container mx-auto">
		<div class="tm-section">
			<%@ include file="nav.jsp"%>
			<%
			String user_id = (String) session.getAttribute("user_id");
			if (check == 1) {
			%>
			<div
				style="text-align: right; margin-right: 20px; font-size: 0.75em;"><%=user_id%>
				님 환영합니다.
			</div>
			<%
			} else if (check == 2) {
			%>
			<div
				style="text-align: right; margin-right: 20px; font-size: 0.75em;">관리자
				계정입니다.</div>
			<%
			}
			%>
			<div class="tm-content-container">
				<div class="etc_div"></div>

				<%
				if (pg.getTotalPage() == 0) {
				%>

				<table class="list_style">
					<tr>
						<td align="center">게시판에 저장된 글이 없습니다.</td>
					</tr>
				</table>

				<%
				} else {
				%>
				<table class="list_style">
					<tr height="40">
						<th align="center" width="80">번 호</th>
						<th align="center" width="200">제 목</th>
						<th align="center" width="100">작성자</th>
						<th align="center" width="150">작성일</th>
						<th align="center" width="70">조 회</th>
					</tr>
					<%
					for (int i = 0; i < list.size(); i++) {
						DataBean article = list.get(i);
					%>
					<tr height="30">
						<td width="50"><%=number--%><small> </small></td>
						<td style="text-align: left">
							<%
							int wid = 0;
							if (article.getRe_level() > 0) {
								wid = 5 * (article.getRe_level());
							} else {
							%> <img src="images/level.png" width="<%=wid%>" height="16">
							<%
							}
							%> <a
							href="newBoard?type=showContent&num=<%=article.getNum()%>&pageNum=<%=pg.getCurrentPage()%>">
								<%=article.getSubject()%></a> <%
  if (article.getReadcount() >= 20) {
  %> <img src="images/hot.gif" border="0" height="16"> <%
  }
  %>
						</td>
						<td width="100" align="left"><a
							href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
						<td width="150"><%=sdf.format(article.getReg_date())%></td>
						<td width="50"><%=article.getReadcount()%></td>
					</tr>
					<%
					}
					%>
				</table>
				<%
				}
				%>
				<div style="margin: 10px; text-align: right">
					<%
					if (check == 1 || check == 2) {
					%>
					<input type="button" value="글쓰기"
						onclick="document.location.href='newBoard?type=writeForm'"
						class="btn2 btn-primary rounded-0">
					<%
					}
					%>
					<div class="etc_div">
						<%
						if (pg.getTotalPage() > 0) {
							int pageCount = pg.getTotalPage() / pg.getPageSize() + (pg.getTotalPage() % pg.getPageSize() == 0 ? 0 : 1);
							int startPage = 1;

							if (pg.getCurrentPage() % 10 != 0)
								startPage = (int) (pg.getCurrentPage() / 10) * 10 + 1;
							else
								startPage = ((int) (pg.getCurrentPage() / 10) - 1) * 10 + 1;

							int pageBlock = 10;
							int endPage = startPage + pageBlock - 1;
							if (endPage > pageCount)
								endPage = pageCount;

							if (startPage > 10) {
						%>
						<a href="newBoard?type=list&pageNum=<%=startPage - 10%>"
							class="a_tag_ver2">[이전]</a>
						<%
						}

						for (int i = startPage; i <= endPage; i++) {
						%>
						<a href="newBoard?type=list&pageNum=<%=i%>" class="a_tag_ver2">[<%=i%>]
						</a>
						<%
						}

						if (endPage < pageCount) {
						%>
						<a href="newBoard?type=list&pageNum=<%=startPage + 10%>"
							class="a_tag_ver2">[다음]</a>
						<%
						}
						}
						%>

					</div>

				</div>

			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>

</body>
</html>