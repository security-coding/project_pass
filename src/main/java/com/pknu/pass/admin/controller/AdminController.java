package com.pknu.pass.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping
	public String adminMain() {
		return "admin";
	}
	
	@RequestMapping("/update/concert")
	@ResponseBody
	public void getConertInf(HttpSession session) throws Exception {
		adminService.getConertInf(session);
	}
	
	@RequestMapping("/update/place")
	@ResponseBody
	public void getPlaceInf() {
		System.out.println("Place Update");
		adminService.getPlaceInf();
	}
}
