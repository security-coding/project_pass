package com.pknu.pass.login.service;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.login.common.MailUtil;
import com.pknu.pass.login.dao.LoginDao;
import com.pknu.pass.login.dto.LoginDto;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	MailUtil mailUtil;
	
	@Autowired
	LoginDao logindao;
	
	@Override
	public String insertuser(LoginDto logindto) {
		String certKey = UUID.randomUUID().toString().replaceAll("-", "");
		logindto.setCertKey(certKey);
		
		logindao.insertuser(logindto);
		
		mailUtil.sendMail(certKey, logindto.getEmail());
		
		return null;
		
	}

	@Override
	public String login(String id, String pass,HttpSession session, Model model) {
		String dbPassCheck=logindao.loginCheck(id);
		int dbCertifyCheck=logindao.certifyCheck(id);
		String view=null;
		int dbCertifyCheckNo=0;
		int passFail=0;
		int Notmember=0;
		
		if (dbPassCheck != null && dbCertifyCheck == 1) {
			if (dbPassCheck.equals(pass)) {//로그인성공
				session.setAttribute("id", id);
				model.addAttribute("id", id);
				view = "loginPage/main";
			} else {//비밀번호 실패
				model.addAttribute("passFail",passFail);
				view = "loginPage/loginFail";
			}
		} else if(dbPassCheck!=null&&dbCertifyCheck==0) {//이메일인증 않함	
			model.addAttribute("dbCertify",dbCertifyCheckNo);
			view="loginPage/main";
		}else if(dbPassCheck==null&&dbCertifyCheck==2) {//회원가입
			model.addAttribute("Notmember",Notmember);
			view = "loginPage/loginFail";
		}
		System.out.println(session.getAttribute("id"));
		return view;
	}

	@Override
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.invalidate();
		
		
		return "loginPage/main";
	}

	
	@Override
	public int joinIdCheck(String inputId) {
		String dbjoinIdCheck=logindao.loginCheck(inputId);
		System.out.println(dbjoinIdCheck);
		if(dbjoinIdCheck!=null) {
			return 2;
		}else {
			return 1;
		}
		
	}
	
	@Override
	public int joinemailCheck(String inputemail,String selectaddress) {
		String result=inputemail+"@"+selectaddress;
		String dbjoinemailCheck=logindao.loginemailCheck(result);
		if(dbjoinemailCheck!=null) {
			return 2;
		}else {
			return 1;
		}
	}


	@Override
	public String mypageId(HttpSession session,Model model,String myemail,LoginDto loginDto) {
//		session.setAttribute("id",session.getAttribute("id"));
		loginDto.setId((String)session.getAttribute("id"));
		
		String mail=logindao.myemail(loginDto);
		int idx=mail.indexOf("@");
		String mailid=mail.substring(0,idx);
		
		
		model.addAttribute("id",session.getAttribute("id"));
		model.addAttribute("email",mailid);
		return null;
	}

	
	@Override
	public String mypageupdate(HttpSession session, LoginDto logindto) {
		logindto.setId((String)session.getAttribute("id"));
		logindao.mypageupdate(logindto);
		return null;
	}

	@Override
	public int checkJoin(String certKey,Model model) {
		int checkjoin;
		LoginDto User=logindao.checkJoin(certKey);
		if(User.getCertify() == LoginDto.SUCCESS) {
			// 이미 링크 클릭(가입 절차 모두완료된 상태)	
			checkjoin=1;
			model.addAttribute("certKey",checkjoin);
			return checkjoin;
			
		} else if (User.getCertify() == LoginDto.FAIL) {
			// dto를 업데이트 해준다. (certify => 1) User의 ID값 이용
			checkjoin=2;
			logindao.checkJoinUpdate(certKey);
			model.addAttribute("certKey",checkjoin);
			return checkjoin;
		} else {
			// certKey가 존재 하지 않는 키라는 뜻!(회원가입 신청 한적이없음)
			checkjoin=3;
			model.addAttribute("certKey",checkjoin);
			return checkjoin;
		}
			
	}

	@Override
	public String userlossid(LoginDto logindto,Model model) {
		String result=logindao.userlossid(logindto);
		model.addAttribute("resultid",result);
		
		return null;
		
	}

	
	@Override
	public String userlosspass(LoginDto logindto,String pass) {
		pass="";
		for(int i=0; i<8;i++) {
		char lowerStr=(char)(Math.random()*26+65);
			if(i%2==0) {
				pass=pass+(int)(Math.random()*10);
			}else {
				pass=pass+lowerStr;
			}
		}
		System.out.println(pass);
		logindto.setPass(pass);
		logindao.updatePass(logindto);
		mailUtil.sendPass(pass,logindto.getEmail());
		return null;
	}

	
	
	
	
	
	
	
}
