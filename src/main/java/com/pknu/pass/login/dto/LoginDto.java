package com.pknu.pass.login.dto;

public class LoginDto {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	String id;
	String password;
	String email;
	String certKey;
	int certify;
	String profile;
	int grade;
	int loginfailcount;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCertKey() {
		return certKey;
	}
	public void setCertKey(String certKey) {
		this.certKey = certKey;
	}
	public int getCertify() {
		return certify;
	}
	public void setCertify(int certify) {
		this.certify = certify;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getLoginfailcount() {
		return loginfailcount;
	}
	public void setLoginfailcount(int loginfailcount) {
		this.loginfailcount = loginfailcount;
	}
	@Override
	public String toString() {
		return "LoginDto [id=" + id + ", password=" + password + ", email=" + email + ", certKey=" + certKey
				+ ", certify=" + certify + ", profile=" + profile + ", grade=" + grade + ", loginfailcount="
				+ loginfailcount + "]";
	}
	
	
	
	
	
	
	
	
}
