package com.pknu.pass.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/error")
public class ErrorController {
	private static final Logger logger = LoggerFactory.getLogger(ErrorController.class);

	@RequestMapping(value = "/throwable")
	public String throwable(HttpServletRequest request, Model model) {
		logger.error("throwable");
		pageErrorLog(request);
		model.addAttribute("msg", "예외 상황이 발생하였습니다.");

		return "error";
	}

	@RequestMapping(value = "/exception")
	public String exception(HttpServletRequest request, Model model) {
		logger.error("exception");
		pageErrorLog(request);
		model.addAttribute("msg", "예외 상황이 발생하였습니다.");

		return "error";
	}
	
	@RequestMapping(value = "/400")
	public String pageError400(HttpServletRequest request, Model model) {
		logger.error("page Error Code 400");
		pageErrorLog(request);
		model.addAttribute("errCode","400 Bad Request");
		model.addAttribute("msg", "잘못된 요청입니다");

		return "error";
	}
	
	@RequestMapping(value = "/403")
	public String pageError403(HttpServletRequest request, Model model) {
		logger.error("page Error Code 403");
		pageErrorLog(request);
		model.addAttribute("errCode","403 Forbidden");
		model.addAttribute("msg", "접근이 금지되었습니다");

		return "error";
	}

	@RequestMapping(value = "/404")
	public String pageError404(HttpServletRequest request, Model model) {
		logger.error("page Error Code 404");
		pageErrorLog(request);
		model.addAttribute("errCode","404 Not Found");
		model.addAttribute("msg", "요청하신 페이지는 존재하지 않습니다");

		return "error";
	}
	
	@RequestMapping(value = "/405")
	public String pageError405(HttpServletRequest request, Model model) {
		logger.error("page Error Code 405");
		pageErrorLog(request);
		model.addAttribute("errCode","405 Method Not Allowed");
		model.addAttribute("msg", "요청된 메소드가 허용되지 않습니다");

		return "error";
	}
	
	@RequestMapping(value = "/500")
	public String pageError500(HttpServletRequest request, Model model) {
		logger.error("page Error Code 500");
		pageErrorLog(request);
		model.addAttribute("errCode","500 internal server error");
		model.addAttribute("msg", "서버에 오류가 발생하였습니다");

		return "error";
	}
	
	@RequestMapping(value = "/503")
	public String pageError503(HttpServletRequest request, Model model) {
		logger.error("page Error Code 503");
		pageErrorLog(request);
		model.addAttribute("errCode","503 service unavailable");
		model.addAttribute("msg", "서비스를 사용할 수 없습니다");

		return "error";
	}
	
	private void pageErrorLog(HttpServletRequest request) {
		logger.error("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
		logger.error("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
		logger.error("message : " + request.getAttribute("javax.servlet.error.message"));
		logger.error("request_uri : " + request.getAttribute("javax.servlet.error.request_uri"));
		logger.error("exception : " + request.getAttribute("javax.servlet.error.exception"));
		logger.error("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));

	}
}
