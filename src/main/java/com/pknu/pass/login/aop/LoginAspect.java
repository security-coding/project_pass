package com.pknu.pass.login.aop;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component(value = "loginAspect")
@Aspect
public class LoginAspect {
	private static final Logger logger = LoggerFactory.getLogger(LoginAspect.class);

	@Pointcut("execution(* com.pknu.pass.login.controller.LoginController.mypageInf(..)) ")
	public void mypageInf() {}

    @Pointcut("execution(* com.pknu.pass.login.controller.LoginController.myPassChengeForm(..)) ")
	public void myPassChengeForm() {}

    @Around("mypageInf()||myPassChengeForm()")
	public Object loginPageAdvice(ProceedingJoinPoint point) throws Throwable {
		logger.debug("loginController" + point.getSignature().getName() + "()");

		HttpSession session = null;
		HttpServletResponse res = null;

		for (Object obj : point.getArgs()) {
			if (obj instanceof HttpSession) {
				session = (HttpSession) obj;
			}
			if (obj instanceof HttpServletResponse) {
				res = (HttpServletResponse) obj;
			}
		}
		if (session.getAttribute("id") == null) {
			return "play/main";
		}
		return point.proceed();
	}
	
}