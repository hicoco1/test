package com.mrs.Vo;

public class HeadOfficeVO extends PagingVO
{
	private String  user_role_id;
	private String  login_id;
	private String  login_passwd;
	private String  enabled;
	private String  authority;
	private String  e_mail;
	private String  address;
	private String  tel1;
	private String  tel2;
	private String  position;
	private String  department;
	
	public String getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(String user_role_id) {
		this.user_role_id = user_role_id;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_passwd() {
		return login_passwd;
	}
	public void setLogin_passwd(String login_passwd) {
		this.login_passwd = login_passwd;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
}