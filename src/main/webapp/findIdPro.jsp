<!-- 김윤서 : 아이디 찾아서 이메일 보내는 페이지 -->
<%@page import="mvc2pac.model.DBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String checkID = (String)request.getAttribute("email");
	String email =request.getParameter("email");
	
	
	if(checkID==null){
		out.println("<script type=\"text/javascript\"> ");
		out.println("alert('아이디나 이메일이 존재하지 않습니다.');");
		out.println("history.go(-1);");
		out.println("</script> ");
	}else{
%>
<%@ include file="header.jsp" %>
<div class="tm-page-container mx-auto">
<section class="tm-section">
<%@ include file="nav.jsp" %>
<div class="tm-content-container">
<div class="tm-content tm-content-2">
         <div class="tm-content">
				<form class="tm-contact-form" id="form" method="POST" action="findPwPro.jsp">
      				<div class="form-group">
      				<p><%=email %></p> 이메일 발송을 누르시면 위의 메일주소로 ID가 발송 됩니다.
      				<!-- 임의 로 만든 템플릿이기 때문에 실제 형태는 //https://www.emailjs.com/ 서비스 업체에서 참고 -->
			<input type="hidden" name="from_name" id="from_name" value="BoardProject">
			<input type="hidden" name="to_name"	id="to_name" value="<%=email %>">
			<input type="hidden" name="message"	id="message" value="<%=checkID %>">
			<input type="hidden" name="email" id="email" value="<%=email %>">
			<input type="hidden" name="reply_to" id="reply_to">
			<input type="hidden" name="num" id="num"> 
					</div>
					<div style="text-align:right;">
			<input type="submit" class="btn btn-primary rounded-0" id="button" value="이메일 발송">				
					</div>
      			</form>
		</div>
</div>
</div>
</section>
<%@ include file="footer.jsp" %>
</div>
<%	
	}
%>
</body>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>

<script type="text/javascript">
//사용법 참고 https://kingname.tistory.com/133
// 이메일 보내는 자바 스크립트 
//https://www.emailjs.com/ 서비스 업체
//서비스 키 
  emailjs.init('user_3K5qFZEMniM7F13LPw2id')
  
  const btn = document.getElementById('button');

document.getElementById('form')
 .addEventListener('submit', function(event) {
  event.preventDefault();
	btn.value = 'Sending...';
	//서비스 아이디 
   const serviceID = 'default_service';
	//이용하려는 템플릿 아이디
   const templateID = 'template_dftc0tk';
   

   emailjs.sendForm(serviceID, templateID, this)
    .then(() => {
      btn.value = 'Send Email';
      alert('Sent!');
      window.location = 'newBoard?type=list';
    }, (err) => {
      btn.value = 'Send Email';
      alert(JSON.stringify(err));
    }); 
});


</script>
</html>