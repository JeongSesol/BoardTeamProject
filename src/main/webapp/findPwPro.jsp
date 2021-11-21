<%@page import="mvc2pac.model.DBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PW 찾기</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	
	DBBean instance=DBBean.getInstance();
	String passwd=instance.findPw(id, email);
	System.out.println(passwd);
	
	if(passwd==null){
		out.println("<script type=\"text/javascript\"> ");
		out.println("alert('아이디나 이메일이 존재하지 않습니다.');");
		out.println("history.go(-1);");
		out.println("</script> ");
	}else{
%>
<div class="tm-page-container mx-auto">
<%@ include file="header.jsp" %>
<section class="tm-section">
<%@ include file="nav.jsp" %>
<div class="tm-content-container">
<div class="tm-content tm-content-2">
      <p><b>인증번호를 입력해주세요</b></p><hr>
         <div class="tm-content">
				<form class="tm-contact-form" id="form" method="POST" action="newBoard?type=findPwPro">
      				<div class="form-group">
      				<!-- 임의 로 만든 템플릿이기 때문에 실제 형태는 //https://www.emailjs.com/ 서비스 업체에서 참고 -->
			<input type="hidden" name="from_name" id="from_name" value="BoardProject">
			<input type="hidden" name="to_name"	id="to_name" value="<%=email %>">
			<input type="hidden" name="message"	id="message">
			<input type="hidden" name="email" id="email" value="<%=email %>">
			<input type="hidden" name="reply_to" id="reply_to">
			<input type="hidden" name="num" id="num"> 
			인증번호 <input type="text" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" name="user_input_num" id="user_input_num">
					</div>
					<div style="text-align:right;">
			<input type="submit" class="btn btn-primary rounded-0" id="button" value="이메일 발송">				
			<input type="button" class="btn btn-primary rounded-0" id="num_button" value="입력" onclick="authNum();">				
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
//https://kingname.tistory.com/133 사용법 참고
//이메일 보내는 자바 스크립트 
//https://www.emailjs.com/ 서비스 업체
//서비스 키 
  emailjs.init('user_3K5qFZEMniM7F13LPw2id')
  
  const btn = document.getElementById('button');

document.getElementById('form')
 .addEventListener('submit', function(event) {
  event.preventDefault();
	btn.value = 'Sending...';
	const rand = Math.floor(Math.random() * 1000+1000);
 //서비스 아이디 
   const serviceID = 'default_service';
 //이용하려는 템플릿 아이디
   const templateID = 'template_dftc0tk';
   document.getElementById('message').value = rand;
   document.getElementById('num').value = rand;
   console.log(rand)

   emailjs.sendForm(serviceID, templateID, this)
    .then(() => {
      btn.value = 'Send Email';
      alert('Sent!');
    }, (err) => {
      btn.value = 'Send Email';
      alert(JSON.stringify(err));
    }); 
});

function authNum(){
	var user_input=document.getElementById('user_input_num').value;
	var num=document.getElementById('num').value;
	if(user_input==num){
		alert('당신의 비밀번호는 '+<%=passwd%>+'입니다.');
		location.href="newBoard?type=list";
	}else{
		alert('인증번호가 맞지 않습니다.');
		history.go(-1);
	}
}
</script>
</html>