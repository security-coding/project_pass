package com.pknu.pass.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;

	@RequestMapping
	public String adminMain() {
		return "admin";
	}

	@RequestMapping(value = "/update/concert", method = RequestMethod.POST)
	@ResponseBody
	public void getConertInf(HttpSession session) throws Exception {
		logger.info("Concert Info Update Service");
		adminService.getConertInf(session);
	}

	@RequestMapping(value = "/update/place", method = RequestMethod.POST)
	@ResponseBody
	public void getPlaceInf() {
		logger.info("Place Info Update Service");
		adminService.getPlaceInf();
	}

	@RequestMapping("/update/boxoffice")
	@ResponseBody
	public void getBoxofficeInf() {
		logger.info("BoxOffice Update Service");
		adminService.getBoxofficeInf();
	}
}
