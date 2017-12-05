<<<<<<< HEAD
package com.pknu.pass.login.dao;

import com.pknu.pass.login.dto.LoginDto;

public interface LoginDao {

	public void insertUser(LoginDto logindto);

	public String loginCheck(String id);
	
	public String logineMailCheck(String result);
	
	public void myPageUpdate(LoginDto logindto);

	public void updateProfile(LoginDto logindto);
	
	public String myEmail(LoginDto logindto);

	public LoginDto checkJoin(String certKey);

	public void checkJoinUpdate(String certKey);

	public String userLossId(LoginDto logindto);

	public void updatePass(LoginDto logindto);

	public String getImageUrl(String id);

	public LoginDto getUser(String id);




		

	

	

}
=======
package com.pknu.pass.login.dao;

import com.pknu.pass.login.dto.LoginDto;

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




		

	

	

}
>>>>>>> 9f188dada92f082683093830b08a07836a675393
