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
	
	@RequestMapping("/main")
	public String mainForm() {
		logger.info("Login Main page");
		return "loginPage/main";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam("id")String id,@RequestParam("pass")String pass,HttpSession session,Model model) {

		return loginService.login(id,pass,session,model);
	}
	@RequestMapping(value="/logout",method=RequestMethod.POST)
	public String logout(HttpSession session) {
		return loginService.logout(session);
	}
	
	
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		return "loginPage/joinForm";
	}
	
	@RequestMapping(value="/insertuser")
	public String insertuser(LoginDto logindto,@RequestParam("str_email")String stremail) {
		
		logindto.setEmail(logindto.getEmail()+"@"+stremail);
		loginService.insertuser(logindto);
		return "loginPage/main";
	}
	
	@RequestMapping(value="/joinIdCheck")
	@ResponseBody
	 public ResponseEntity<String> joinIdCheck(@RequestParam("inputId")String inputId, HttpServletRequest request) {

		int result = loginService.joinIdCheck(inputId);
		
		return new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
	}
	
	@RequestMapping(value="/joinemailCheck")
	@ResponseBody
	public ResponseEntity<String> joinemailCheck(@RequestParam("inputemail")String inputemail,@RequestParam("str_email")String selectaddress) {
			
		int result =loginService.joinemailCheck(inputemail,selectaddress);
		return new ResponseEntity<String>(String.valueOf(result),HttpStatus.OK);
	}
	
	@RequestMapping(value="/mypage")
	public String mypageForm(HttpSession session,String myemail,Model model,LoginDto loginDto) {
		loginService.mypageId(session,model,myemail,loginDto); 
		return "loginPage/mypage";
	}
	@RequestMapping(value="/updateuser")
	public String mypageupdate(HttpSession session,LoginDto logindto,@RequestParam("str_email")String stremail) {
		logindto.setEmail(logindto.getEmail()+"@"+stremail);
		loginService.mypageupdate(session,logindto);
		loginService.logout(session);
		
		
		return "loginPage/main";
	}
	
	@RequestMapping(value="/checkJoin")
	public String checkJoin(@RequestParam("certKey") String certKey,Model model ) {
		loginService.checkJoin(certKey,model);
		
		return "loginPage/emailAlertPage";
	}
	
	@RequestMapping(value="/userloss")
	public String userlossForm() {
		
		return "loginPage/userloss";
	}
	@RequestMapping(value="/userlossid")
	public String userlossid(LoginDto logindto,Model model,@RequestParam("email1")String email) {
		logindto.setEmail(email);
		loginService.userlossid(logindto,model);
		return "loginPage/lossresult";
	}
	@RequestMapping(value="/userlosspass")
	public String uesrlosspass(LoginDto logindto,@RequestParam("email2")String email,@RequestParam("id")String id,String pass) {
		logindto.setEmail(email);
		logindto.setId(id);
		loginService.userlosspass(logindto,pass);
		return "loginPage/main";
	}
}


