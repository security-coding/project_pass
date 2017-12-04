package com.pknu.pass.login.service;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.login.common.MailUtil;
import com.pknu.pass.login.common.SecurityUtil;
import com.pknu.pass.login.dao.LoginDao;
import com.pknu.pass.login.dto.LoginDto;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private MailUtil mailUtil;

	@Autowired
	private LoginDao logindao;

	@Autowired
	private SecurityUtil securityUtil;

	@Override
	public void insertUser(LoginDto logindto) {
		System.out.println(logindto.getPassword());
		String certKey = UUID.randomUUID().toString().replaceAll("-", "");
		String SecurityPass = securityUtil.encrypt(logindto.getPassword());
		logindto.setCertKey(certKey);
		logindto.setPassword(SecurityPass);

		logindao.insertUser(logindto);

		System.out.println(logindto.getPassword() + "비밀번호");

		mailUtil.sendMail(certKey, logindto.getEmail());
	}


	@Override
	public String login(String id, String pass, HttpSession session, Model model) {
		String view = null;
		LoginDto user = null;
		
		user = logindao.getUser(id);//id가 있으면 전부 가져온다. 
		
		int dbCertifyCheckNo = 0;// 메일 인증 않함.
		int passFail = 0;// 비밀번호 실패.
		int Notmember = 0;// 회원가입 신청안함.
		int loginBan = 0;// 불량계정 정지.
		
		if(user != null) {
			String password = user.getPassword();
			String profile=user.getProfile();
			int certify = user.getCertify();
			int grade = user.getGrade();
			
			if(certify == 1) {
				switch (grade) {//grade 권한: 0=밴 1=일반회원 2=관리자 
				case 0://밴
					model.addAttribute("loginBan", loginBan);
					view = "loginPage/loginFail";
					break;
				case 1://일반 회원
					if (password.equals(securityUtil.encrypt(pass))) {
						session.setAttribute("id", id);
						session.setAttribute("imageUrl", profile);
						model.addAttribute("id",id);
						model.addAttribute("imageUrl",profile);
						view = "loginPage/main";
					} else {// 비밀번호 실패
						model.addAttribute("passFail", passFail);
						view = "loginPage/loginFail";
					}
					break;
				case 2://관리자
					if (password.equals(securityUtil.encrypt(pass))) {
						session.setAttribute("id", id);
						view = "admin/main";
					} else{// 비밀번호 실패
						model.addAttribute("passFail", passFail);
						view = "loginPage/loginFail";
					}
					break;
				default:
					break;
				}
			} else if (certify == 0) {//회원가입 인증이 되지 않았음
				model.addAttribute("dbCertify", dbCertifyCheckNo);
				view = "loginPage/main";
			}
		} else {//아이디가 존재하지 않을때
			model.addAttribute("Notmember", Notmember);
			view = "loginPage/loginFail";
		}
		
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
		String dbjoinIdCheck = logindao.loginCheck(inputId);
		System.out.println(dbjoinIdCheck);
		if (dbjoinIdCheck != null) {
			return 2;
		} else {
			return 1;
		}

	}

	@Override
	public int joineMailCheck(String inputemail, String selectaddress) {
		String result = inputemail + "@" + selectaddress;
		String dbjoinemailCheck = logindao.logineMailCheck(result);
		if (dbjoinemailCheck != null) {
			return 2;
		} else {
			return 1;
		}
	}

	@Override
	public void myPageId(HttpSession session, Model model, String myemail, LoginDto loginDto) {
		// session.setAttribute("id",session.getAttribute("id"));
		String imageUrl;
		loginDto.setId((String) session.getAttribute("id"));
		String id = loginDto.getId();
		String mail = logindao.myEmail(loginDto);
		int idx = mail.indexOf("@");
		String mailid = mail.substring(0, idx);
		imageUrl = logindao.getImageUrl(id);

		model.addAttribute("imageUrl", imageUrl);
		model.addAttribute("id", session.getAttribute("id"));
		model.addAttribute("email", mailid);

	}

	@Override
	public void myPageUpdate(HttpSession session, LoginDto logindto) {
		logindto.setId((String) session.getAttribute("id"));
		logindto.setPassword(securityUtil.encrypt(logindto.getPassword()));
		logindao.myPageUpdate(logindto);

	}

	@Override
	public void updateProfile(HttpSession session, String srcinput, LoginDto logindto,Model model) {
		logindto.setId((String) session.getAttribute("id"));
		logindto.setProfile(srcinput);
		logindao.updateProfile(logindto);
	}

	@Override
	public int checkJoin(String certKey, Model model) {
		int checkjoin;
		LoginDto User = logindao.checkJoin(certKey);
		if (User.getCertify() == LoginDto.SUCCESS) {
			// 이미 링크 클릭(가입 절차 모두완료된 상태)
			checkjoin = 1;
			model.addAttribute("certKey", checkjoin);
			return checkjoin;

		} else if (User.getCertify() == LoginDto.FAIL) {
			// dto를 업데이트 해준다. (certify => 1) User의 ID값 이용
			checkjoin = 2;
			logindao.checkJoinUpdate(certKey);
			model.addAttribute("certKey", checkjoin);
			return checkjoin;
		} else {
			// certKey가 존재 하지 않는 키라는 뜻!(회원가입 신청 한적이없음)
			checkjoin = 3;
			model.addAttribute("certKey", checkjoin);
			return checkjoin;
		}

	}

	@Override
	public void userLossId(LoginDto logindto, Model model) {
		String result = logindao.userLossId(logindto);
		model.addAttribute("resultid", result);
	}

	@Override
	public void userLossPass(LoginDto logindto, String pass) {
		pass = "";
		for (int i = 0; i < 8; i++) {
			char lowerStr = (char) (Math.random() * 26 + 65);
			if (i % 2 == 0) {
				pass = pass + (int) (Math.random() * 10);
			} else {
				pass = pass + lowerStr;
			}
		}
		System.out.println(pass);
		logindto.setPassword(securityUtil.encrypt(pass));
		logindao.updatePass(logindto);
		mailUtil.sendPass(pass, logindto.getEmail());
	}

	public int standLossId(String email) {
		String result = email;
		String dbJoineMailCheck = logindao.logineMailCheck(result);
		if (dbJoineMailCheck != null) {
			return 1;
		} else {
			return 2;
		}

	}

	public int reSetPassCheck(String email, String id) {
		int status = 0;
		String result = email;

		String dbmailCheck = logindao.logineMailCheck(result);
		String dbidCheck = logindao.loginCheck(id);

		if (dbmailCheck != null && dbidCheck != null) {
			status = 1;

		} else if (dbmailCheck == null || dbidCheck != null) {
			status = 2;
		}

		return status;
	}

}
