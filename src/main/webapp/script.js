//공백만 입력된 경우 -> 정세솔
	var blank_pattern = /^\s+|\s+$/g;

//글쓰기 유효성 
//박야큰 : 유효성
//이우림 : 각 회원가입 , 게시글 작성완료 작업
function writeSave(){
	var writeform = document.writeform;
    
    var writer = writeform.writer.value;
    var subject = writeform.subject.value;
    var content = writeform.content.value;
    var passwd = writeform.passwd.value;
	
	if(!writer || writer.replace(blank_pattern,'') == "" ){
	  alert("작성자를 입력하십시요.");
	  writeform.writer.focus();
	  return false;
	}
	
	if(!subject || subject.replace(blank_pattern,'')==''){
	  alert("제목을 입력하십시요.");
	  writeform.subject.focus();
	  return false;
	}
	
	if(!content || content.replace(blank_pattern,'')==''){
	  alert("내용을 입력하십시요.");
	  writeform.content.focus();
	  return false;
	}
        
	if(!passwd || passwd.replace(blank_pattern,'')==""){
	  alert(" 비밀번호를 입력하십시요.");
	  writeform.passwd.focus();
	  return false;
	}
	alert("완료되었습니다!");
 }
//회원가입 유효성 
//박야큰 : 회원가입 유효성
//이우림 : 각 회원가입 , 게시글 작성완료 작업  -> 콘트롤러 이동
function check() {
	var frm = document.frm;

	var name = frm.user_name.value;
	var id = frm.user_id.value;
	var pw = frm.user_password.value;
	var pw2 = frm.user_password2.value;
	var email = frm.email.value;

	//공백만 입력된 경우
	//var blank_pattern = /^\s+|\s+$/g;
	if (name.replace(blank_pattern, '') == "") {
		alert('이름을 입력하세요..');
		return false;
	}
	if (id.replace(blank_pattern, '') == "") {
		alert('아이디를 입력하세요.');
		return false;
	}
	if (pw.replace(blank_pattern, '') == "") {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if (email.replace(blank_pattern, '') == "") {
		alert('이메일 입력하세요');
		return false;
	}
	
	if (name.length == 0 || name == "") {
		alert("이름을 입력하세요.");
		frm.user_name.focus();
		return false;
	} else if (id.length == 0 || id == "") {
		alert("아이디를 입력하세요.");
		frm.user_id.focus();
		return false;
	} else if (pw.length == 0 || pw == "") {
		alert("비밀번호를 입력하세요.");
		frm.user_password.focus();
		return false;
	} else if (pw2.length != pw.length || pw2.value != pw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.user_password.focus();
		return false;
	} else if (email.length == 0 || email == "") {
		alert("이메일 입력하세요");
		frm.email.focus();
		return false;
	} else {
		frm.submit();
	}

}
//로그인 유효성 이성규 : 로그인 폼 유효성 검사 스크립트
function checkFormValue() {
	var inputForm = document.loginForm
	if (inputForm.id.value == "") {
		alert("아이디를 입력하세요");
		inputForm.id.focus();
		return false;
	}
	if (inputForm.password.value == "") {
		alert("비밀번호를 입력하세요");
		inputForm.password.focus();
		return false;
	}
};



