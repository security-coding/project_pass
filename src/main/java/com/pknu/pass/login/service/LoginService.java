package com.pknu.pass.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pass.login.dto.LoginDto;

public interface LoginService {

	public String redirectPage(HttpSession session,Model model);
	
	public void insertUser(LoginDto logindto,String stremail,String address,String detailAddress);

	public String login(String id, String password,HttpSession session, Model model);

	public String logout(HttpSession session);

	public int joinIdCheck(String inputId);
	
	public int joineMailCheck(String inputemail,String selectaddress);

	public void myPageId(HttpSession session,Model model,LoginDto logindto);

	public void myPageUpdate(HttpSession session,String password,LoginDto logindto,String address,String detailaddress);

	public int checkJoin(String certKey,Model model);
	
	public void userLossId(LoginDto logindto,Model model);
	
	public void userLossPass(LoginDto logindto,String pass);
	
	public void updateProfile(HttpSession session,String srcinput,LoginDto logindto,Model model);
	
	public int standLossId(String email);
	
	public int reSetPassCheck(String email, String id);
	
	public int currentPwCheck(HttpSession session,String currentPw);
	
}
