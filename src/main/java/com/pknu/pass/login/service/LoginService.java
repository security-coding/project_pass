package com.pknu.pass.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pass.login.dto.LoginDto;

public interface LoginService {

    void insertUser(LoginDto logindto);

    String login(String id, String password, HttpServletRequest request, Model model);

    String logout(HttpSession session);

    int joinIdCheck(String inputId);

    int joineMailCheck(String inputemail, String selectaddress);

    void myPageId(HttpSession session, Model model, LoginDto logindto);

    void myPassChengeForm(HttpSession session, Model model);

    void myPageUpdate(HttpSession session, String password, LoginDto logindto);

    int checkJoin(String certKey, Model model);

    void userLossId(LoginDto logindto, Model model);

    void userLossPass(LoginDto logindto, String pass);

    void updateProfile(HttpSession session, String srcinput, LoginDto logindto, Model model);

    int standLossId(String email);

    int reSetPassCheck(String email, String id);

    int currentPwCheck(HttpSession session, String currentPw);

    void memberClear(HttpSession session);

}
