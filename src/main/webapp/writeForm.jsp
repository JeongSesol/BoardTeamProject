<!--이우림 : 글 작성 css
	이성규 : 글 작성자 고정 및 수정불가 코드  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<title>게시판</title>

<script type="text/javascript" src="script.js"></script>
</head>
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

<body>
<%
	String user_id = (String) session.getAttribute("user_id");
%>
<% 
  int num = 0, ref = 1, re_step = 0, re_level = 0;
  String strV = "";
  String pageNum = "1";
  try{
    if(request.getParameter("num")!=null){
	   num=Integer.parseInt(request.getParameter("num"));
	   ref=Integer.parseInt(request.getParameter("ref"));
	   re_step=Integer.parseInt(request.getParameter("re_step"));
	   re_level=Integer.parseInt(request.getParameter("re_level"));
	   pageNum = request.getParameter("pageNum");
    }
    String user_name = (String) session.getAttribute("user_name");
%>
<div class="tm-page-container mx-auto">
	<%@ include file="header.jsp" %>

<section class="tm-section">
	<%@ include file="nav.jsp" %>
	<% if (check == 0){ %>
			비정상적인 접근입니다.
			<%}else{ %>
	<div class="tm-content-container">
	<div class="mb-0 tm-img-overlay-wrap">
	<div class="tm-img-overlay"></div>
	<div class="tm-img-overlay-text text-white p-5">
		<h4 class="mb-4">글쓰기</h4>
			<p class="tm-small">
				내용을 입력해주세요.
			</p>
	</div>
	</div>
	<div class="tm-content">
		<form name="writeform" method="POST"
      action="newBoard?type=write&pageNum=<%=pageNum %>" onsubmit="return writeSave()">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="hidden" name="ref" value="<%=ref%>">
				<input type="hidden" name="re_step" value="<%=re_step%>">
				<input type="hidden" name="re_level" value="<%=re_level%>">
			<div class="form-group">
			<%
      			if(request.getParameter("num")==null) 
    				 strV = "";
     			 else
    				 strV = "　　ㄴRE :";
    		%>
				<input type="text" id="subject" name="subject"
         			value="<%=strV%>" class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
                                maxlength="30" placeholder="제목" required />
			</div>
			<div class="form-group">
				<input type="text" id="writer" name="writer"
                                class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
                                maxlength="6" placeholder="이름" required value="<%=user_name%>" readonly/>
			</div>

			<div class="form-group">
				<textarea rows="6" id="content" name="content"
                                class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
                                placeholder="내용을 입력해주세요" required  maxlength="160"></textarea>
			</div>

			<div class="form-group">
				<input type="hidden" id="passwd" name="passwd" value="<%=user_id %>"
                                class="form-control rounded-0 border-top-0 border-right-0 border-left-0"
                                maxlength="12" placeholder="비밀번호" />
			</div>
			<div style="text-align:right;">
				<button type="submit" class="btn btn-primary rounded-0">
                                Submit
				</button>
				<button type="reset" class="btn btn-primary rounded-0" >
                                다시작성
				</button>
				<button type="button" class="btn btn-primary rounded-0" OnClick="window.location='newBoard?type=list'">
                                목록보기
				</button>
				
				
				</div>	
				</form>
						
				</div>
		
				</div>
</section>

<%@ include file="footer.jsp" %>
 <%
			}
  }catch(Exception e){}
%>     
</div>  
</body>
</html>