package com.pknu.pass.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.admin.controller.AdminController;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.login.service.LoginServiceImpl;

@Controller
@RequestMapping("/member")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class); 
	@Autowired
	LoginServiceImpl loginService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)//로그인기능
	public String login(@RequestParam("id")String id,@RequestParam("password")String password,HttpSession session,Model model) {
		System.out.println(id);
		return loginService.login(id,password,session,model);
	}

	
	@RequestMapping(value="/logout",method=RequestMethod.POST)//로그아웃기능
	public String logout(HttpSession session) {
		return loginService.logout(session);
	}
	
	
	@RequestMapping(value="/joinForm")//회원가입 페이지로 이동
	public String joinForm() {
		return "loginPage/joinForm";
	}
	
	@RequestMapping(value="/insertuser")//회원가입 데이터 db에 삽입
	public String insertuser(LoginDto logindto,@RequestParam("str_email")String stremail,
							@RequestParam("address")String address,
							@RequestParam("detailaddress")String detailAddress) {
		
		
		loginService.insertUser(logindto,stremail,address,detailAddress);
		return "/home";
	}
	
	@RequestMapping(value="/joinIdCheck")//회원가입 아이디 중복 비동기로 확인
	@ResponseBody
	 public ResponseEntity<String> joinIdCheck(@RequestParam("inputId")String inputId, HttpServletRequest request) {

		int result = loginService.joinIdCheck(inputId);
		
		return new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
	}
	
	@RequestMapping(value="/joinemailCheck")//회원가입 이메일 중복 비동기로 확인
	@ResponseBody
	public ResponseEntity<String> joinemailCheck(@RequestParam("inputemail")String inputemail,@RequestParam("str_email")String selectaddress) {
			
		int result =loginService.joineMailCheck(inputemail,selectaddress);
		return new ResponseEntity<String>(String.valueOf(result),HttpStatus.OK);
	}
	
	@RequestMapping(value="/mypage")//회원정보 페이지로 가는것
	public String mypageInf(HttpSession session,Model model,LoginDto loginDto) {
		loginService.myPageId(session,model,loginDto); 
		return "loginPage/mypage";
	}
	@RequestMapping(value="/myPassChange")//비밀번호 변경 페이지
	public String myPassChengeForm() {
		return "loginPage/myPassChange";
	}
	
	@RequestMapping(value="/currentPwCheck")
	@ResponseBody
	public int currentPwCheck(HttpSession session,@RequestParam("currentPw")String currentPw) {
		System.out.println(currentPw+"currentPw");
		int result=loginService.currentPwCheck(session,currentPw);
		return result;
	}
	
	@RequestMapping(value="/updateuser")//마이페이지 내용 업데이트
	public String mypageupdate(HttpSession session,LoginDto logindto,@RequestParam(value="password")String password,
							   @RequestParam("address")String address,@RequestParam("detailaddress")String detailaddress) {
		
		loginService.myPageUpdate(session,password,logindto,address,detailaddress);
		loginService.logout(session);
		
		
		return "loginPage/mypage";
	}
	
	@RequestMapping(value="/updateprofile")//프로필 사진 비동기변경
	@ResponseBody
	public void updateprofile(HttpSession session,LoginDto logindto,@RequestParam(value="srcinput")String srcinput,Model model) {
		loginService.updateProfile(session,srcinput,logindto,model);
	}
	
	@RequestMapping(value="/checkJoin")//이메일 인증 체크 
	public String checkJoin(@RequestParam("certKey") String certKey,Model model ) {
		loginService.checkJoin(certKey,model);
		
		return "loginPage/emailAlertPage";
	}
	
	@RequestMapping(value="/userloss")//아이디 and 비밀번호 찾기 폼
	public String userlossForm() {
		return "loginPage/userloss";
	}
	
	@RequestMapping(value="/userlossid")//아이디 찾고 결과페이지 이동
	public String userlossid(LoginDto logindto,Model model,@RequestParam("email1")String email) {
		logindto.setEmail(email);
		loginService.userLossId(logindto,model);
		return "loginPage/lossresult";
	}
	
	@RequestMapping(value="/userlosspass")//임시비밀번호 발송 
	public String uesrlosspass(LoginDto logindto,@RequestParam("email2")String email,@RequestParam("id")String id,String pass) {
		logindto.setEmail(email);
		logindto.setId(id);
		loginService.userLossPass(logindto,pass);
		return "loginPage/main";
	}
	
	@RequestMapping(value="/standlossid")//아이디 찾기할때 ajax로 찾는아이디에 이메일이 있는지 없는지 확인
	@ResponseBody
	public int standlossid(@RequestParam("email1")String email) {
		return loginService.standLossId(email);
	}
	
	@RequestMapping(value="/reSetPassCheck")//비밀번호 찾기할때 ajax로 아이디와 이메일이 존재하는지 확인
	@ResponseBody
	public int reSetPassCheck(@RequestParam("email2")String email,@RequestParam("id")String id) {
		return loginService.reSetPassCheck(email,id);
	}
}


