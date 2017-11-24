package com.pknu.pass.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pass.login.dto.LoginDto;

public interface LoginService {

	public void insertUser(LoginDto logindto);

	public String login(String id, String pass,HttpSession session, Model model);

	public String logout(HttpSession session);

	public int joinIdCheck(String inputId);
	
	public int joinEmailCheck(String inputemail,String selectaddress);

	public String mypageId(HttpSession session,Model model,String myemail,LoginDto logindto);

	public String mypageUpdate(HttpSession session, LoginDto logindto);

	public int checkJoin(String certKey,Model model);
	
	public String userlossid(LoginDto logindto,Model model);
	
	public String userlosspass(LoginDto logindto,String pass);
}
