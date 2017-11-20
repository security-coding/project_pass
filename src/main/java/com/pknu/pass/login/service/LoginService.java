package com.pknu.pass.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pass.login.dto.LoginDto;

public interface LoginService {

	public String insertuser(LoginDto logindto);

	public String login(String id, String pass,HttpSession session, Model model);

	public String logout(HttpSession session);

	public int joinIdCheck(String inputId);
	
	public int joinemailCheck(String inputemail,String selectaddress);

	public String mypageId(HttpSession session,Model model,String myemail,LoginDto logindto);

	public String mypageupdate(HttpSession session, LoginDto logindto);

	public int checkJoin(String certKey,Model model);
	
	public String userlossid(LoginDto logindto,Model model);
	
	public String userlosspass(LoginDto logindto,String pass);
}
