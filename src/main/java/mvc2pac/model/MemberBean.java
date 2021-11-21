package mvc2pac.model;

import java.sql.Timestamp;
// 김윤서 작성
public class MemberBean {
private int num;
private String user_id;
private String user_name;
private String user_password;
private String mobile;
private Timestamp reg_date;
private int u_level;
private String email;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getUser_password() {
	return user_password;
}
public void setUser_password(String user_password) {
	this.user_password = user_password;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public Timestamp getReg_date() {
	return reg_date;
}
public void setReg_date(Timestamp reg_date) {
	this.reg_date = reg_date;
}
public int getU_level() {
	return u_level;
}
public void setU_level(int u_level) {
	this.u_level = u_level;
}

}
