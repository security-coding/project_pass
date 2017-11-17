package com.pknu.pass.login.dao;

import com.pknu.pass.login.dto.LoginDto;

public interface LoginDao {

	public void insertuser(LoginDto logindto);

	public String loginCheck(String id);
	
	public String loginemailCheck(String result);
	
	public int certifyCheck(String id);

	public void mypageupdate(LoginDto logindto);

	public String myemail(LoginDto logindto);

	public LoginDto checkJoin(String certKey);

	public void checkJoinUpdate(String certKey);

	

	

}
