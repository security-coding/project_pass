package com.pknu.pass.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.login.common.MailUtil;
import com.pknu.pass.login.common.SecurityUtil;
import com.pknu.pass.login.dao.LoginDao;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.place.dao.PlaceDao;
import com.pknu.pass.play.dto.MainDto;


@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private MailUtil mailUtil;

    @Autowired
    private LoginDao logindao;

    @Autowired
    private PlaceDao placeDao;

    @Autowired
    private SecurityUtil securityUtil;

    private final static int FAIL = 0;
    private final static int SUCCESS = 1;
    private final static int ALREADY_SUCCESS = 2;

    @Override
    public void insertUser(LoginDto logindto) {

        String certKey = UUID.randomUUID().toString().replaceAll("-", "");
        String SecurityPass = securityUtil.encrypt(logindto.getPassword());

        logindto.setCertKey(certKey);
        logindto.setPassword(SecurityPass);

        logindao.insertUser(logindto);

        mailUtil.sendMail(certKey, logindto.getEmail());
    }


    @Override
    public String login(String id, String pass, HttpServletRequest request, Model model) {
        String view = null;
        LoginDto user;
        HttpSession session = request.getSession();

        user = logindao.getUser(id);//id가 있으면 전부 가져온다.

        if (user != null) {
            String password = user.getPassword();
            String profile = user.getProfile();
            int certify = user.getCertify();
            int grade = user.getGrade();

            if (certify == 1) {
                switch (grade) {//grade 권한: 0=밴 1=일반회원 2=관리자
                    case 0://밴
                        model.addAttribute("loginBan", FAIL);
                        view = "loginPage/loginFail";
                        break;
                    case 1://일반 회원
                        if (password.equals(securityUtil.encrypt(pass))) {
                            session.setAttribute("id", id);
                            session.setAttribute("imageUrl", profile);

                            String referer = request.getHeader("Referer");
                            view = "redirect:" + referer;
                        } else {// 비밀번호 실패
                            model.addAttribute("passFail", FAIL);
                            view = "loginPage/loginFail";
                        }
                        break;
                    case 2://관리자
                        if (password.equals(securityUtil.encrypt(pass))) {
                            session.setAttribute("id", id);
                            view = "admin/main";
                        } else {// 비밀번호 실패
                            model.addAttribute("passFail", FAIL);
                            view = "loginPage/loginFail";
                        }
                        break;
                    default:
                        break;
                }
            } else if (certify == 0) {//회원가입 인증이 되지 않았음
                model.addAttribute("dbCertify", FAIL);
                view = "/home";
            }
        } else {//아이디가 존재하지 않을때
            model.addAttribute("Notmember", FAIL);
            view = "loginPage/loginFail";
        }

        return view;
    }

    @Override
    public String logout(HttpSession session) {
        session.removeAttribute("id");
        session.invalidate();

        return "redirect:/";
    }

    @Override
    public int joinIdCheck(String inputId) {
        String dbjoinIdCheck = logindao.loginCheck(inputId);
        if (dbjoinIdCheck != null) {
            return FAIL;
        } else {
            return SUCCESS;
        }

    }

    @Override
    public int joineMailCheck(String inputemail, String selectaddress) {
        String result = inputemail + "@" + selectaddress;
        String dbjoinemailCheck = logindao.logineMailCheck(result);
        if (dbjoinemailCheck != null) {
            return FAIL;
        } else {
            return SUCCESS;
        }
    }

    @Override
    public void myPageId(HttpSession session, Model model, LoginDto loginDto) {
        String id = (String) session.getAttribute("id");

        LoginDto user = logindao.getUser(id);
        List<MainDto> bookmarkList = logindao.getBookmark(id);

        //내주변지도관련
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("la", user.getLa());
        paramMap.put("lo", user.getLo());

        model.addAttribute("user", user);
        model.addAttribute("list", bookmarkList);
        model.addAttribute("la", user.getLa());
        model.addAttribute("lo", user.getLo());
        model.addAttribute("places", placeDao.selectPlace(paramMap));
    }

    @Override
    public void myPageUpdate(HttpSession session, String password, LoginDto logindto) {

        logindto.setId((String) session.getAttribute("id"));
        logindto.setPassword(securityUtil.encrypt(password));
        logindao.myPageUpdate(logindto);

    }

    public void myPassChengeForm(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        LoginDto userInf = logindao.getUser(id);
        model.addAttribute("userInf", userInf);


    }

    @Override
    public void updateProfile(HttpSession session, String srcinput, LoginDto logindto, Model model) {
        logindto.setId((String) session.getAttribute("id"));
        logindto.setProfile(srcinput);
        session.setAttribute("imageUrl", srcinput);
        logindao.updateProfile(logindto);
    }

    @Override
    public int checkJoin(String certKey, Model model) {
        int checkjoin;
        LoginDto User = logindao.checkJoin(certKey);
        if (User.getCertify() == LoginDto.SUCCESS) {
            // 이미 링크 클릭(가입 절차 모두완료된 상태)
            model.addAttribute("certKey", SUCCESS);
            return SUCCESS;

        } else if (User.getCertify() == LoginDto.FAIL) {
            // dto를 업데이트 해준다. (certify => 1) User의 ID값 이용
            checkjoin = ALREADY_SUCCESS;
            logindao.checkJoinUpdate(certKey);
            model.addAttribute("certKey", checkjoin);
            return checkjoin;
        } else {
            // certKey가 존재 하지 않는 키라는 뜻!(회원가입 신청 한적이없음)
            checkjoin = FAIL;
            model.addAttribute("certKey", checkjoin);
            return FAIL;
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

        logindto.setPassword(securityUtil.encrypt(pass));
        logindao.updatePass(logindto);
        mailUtil.sendPass(pass, logindto.getEmail());
    }

    public int standLossId(String email) {
        String result = email;
        String dbJoineMailCheck = logindao.logineMailCheck(result);
        if (dbJoineMailCheck != null) {
            return SUCCESS;
        } else {
            return FAIL;
        }

    }

    public int reSetPassCheck(String email, String id) {
        int status = 0;
        LoginDto user = logindao.getUser(id);

        String dbmailCheck = user.getEmail();
        String dbidCheck = user.getId();

        if (dbmailCheck != null && dbidCheck != null) {
            status = SUCCESS;

        } else if (dbmailCheck == null || dbidCheck != null) {
            status = FAIL;
        }

        return status;
    }


    public int currentPwCheck(HttpSession session, String currentPw) {
        String id = (String) session.getAttribute("id");
        int result = 0;
        String defaultPw;
        String pw = (String) securityUtil.encrypt(currentPw);

        defaultPw = (String) logindao.loginCheck(id);//쿼리문이 동일함

        if (pw.equals(defaultPw)) {
            result = SUCCESS;
        } else {
            result = FAIL;
        }
        return result;
    }


    public void memberClear(HttpSession session) {
        String id = (String) session.getAttribute("id");
        logindao.memberClear(id);
        session.removeAttribute("id");
        session.invalidate();

    }


}
