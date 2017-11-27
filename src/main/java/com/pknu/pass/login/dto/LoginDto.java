package com.pknu.pass.login.dto;

public class LoginDto {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	String id;
	String pass;
	String email;
	String certKey;
	int certify;
	String imageUrl;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	@Override
	public String toString() {
		return "LoginDto [id=" + id + ", pass=" + pass + ", email=" + email + ", certKey=" + certKey + ", certify="
				+ certify + ", imageUrl=" + imageUrl + "]";
	}
	
	
	
	
	
	
	
	
}
