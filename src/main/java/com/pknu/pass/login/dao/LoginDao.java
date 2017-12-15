package com.pknu.pass.login.dao;

import java.util.List;

import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.play.dto.MainDto;

public interface LoginDao {

	void insertUser(LoginDto logindto);

	String loginCheck(String id);
	
	String logineMailCheck(String result);
	
	void myPageUpdate(LoginDto logindto);

	void updateProfile(LoginDto logindto);
	
	LoginDto checkJoin(String certKey);

	void checkJoinUpdate(String certKey);

	String userLossId(LoginDto logindto);

	void updatePass(LoginDto logindto);

	LoginDto getUser(String id);

	String currentPwCheck(String id);

	void memberClear(String id);

	List<MainDto> getBookmark(String id);
	
}
