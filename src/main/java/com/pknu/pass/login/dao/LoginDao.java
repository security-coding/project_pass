package com.pknu.pass.login.dao;

import java.util.List;

import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.play.dto.MainDto;

public interface LoginDao {

	public void insertUser(LoginDto logindto);

	public String loginCheck(String id);
	
	public String logineMailCheck(String result);
	
	public void myPageUpdate(LoginDto logindto);

	public void updateProfile(LoginDto logindto);
	
	public LoginDto checkJoin(String certKey);

	public void checkJoinUpdate(String certKey);

	public String userLossId(LoginDto logindto);

	public void updatePass(LoginDto logindto);

	public LoginDto getUser(String id);

	public String currentPwCheck(String id);

	public void memberClear(String id);

	public List<MainDto> getBookmark(String id);
	
}
