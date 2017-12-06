package com.pknu.pass.admin.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component(value="adminAspect")
@Aspect
public class AdminAspect {
	private static final Logger logger = LoggerFactory.getLogger(AdminAspect.class);
	
	@Around("execution(* com.pknu.pass.admin.controller.AdminController.*(..))")
	public Object adminPageAdvice(ProceedingJoinPoint point) throws Throwable {
		logger.debug("adminController" + point.getSignature().getName() + "()");
		
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		
		for (Object obj : point.getArgs()) {
			if(obj instanceof HttpServletRequest)
				request = (HttpServletRequest) obj;
			if(obj instanceof HttpServletResponse)
				response = (HttpServletResponse) obj;
		}
		
		if(request != null) {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			
			if (id == null || !id.equals("admin")) {
				return "/common/error";
			}
		}
		
		return point.proceed();
	}
}
