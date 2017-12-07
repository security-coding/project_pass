package com.pknu.pass.admin.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.admin.service.AdminService;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;

	@RequestMapping
	public String adminMain(HttpServletRequest request, Model model) {
		return "admin/main";
	}

	/*
	 * DB Update 부분
	 * */
	@RequestMapping(value = "/update/concert", method = RequestMethod.POST)
	@ResponseBody
	public void getConcertInf(HttpServletRequest request, String stdate, String eddate, String prfstate) throws Exception {
		logger.info("Concert Info Update Service");
		adminService.getConertInf(request,stdate, eddate, prfstate);
	}

	@RequestMapping(value = "/update/place", method = RequestMethod.POST)
	@ResponseBody
	public void getPlaceInf(HttpServletRequest request) {
		logger.info("Place Info Update Service");
		adminService.getPlaceInf();
	}

	@RequestMapping(value = "/update/boxoffice", method= RequestMethod.POST)
	@ResponseBody
	public void getBoxofficeInf(HttpServletRequest request) {
		logger.info("BoxOffice Update Service");
		adminService.getBoxofficeInf();
	}
	
	@RequestMapping(value = "/select/concert", method=RequestMethod.GET)
	public String selectConcert(HttpServletRequest request) {
		return "admin/concert";
	}
	
	@RequestMapping(value = "/select/concert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectConcert(HttpServletRequest request, PagingDto paging) {
		Map<String, Object> paramMap = new HashMap<>();

		List<ConcertDto> concertList = adminService.selectConcert(paging);
		paging.setTotal(adminService.selectTotalConcert(paging));
		paramMap.put("list", concertList);
		paramMap.put("p", paging);
		
		return paramMap;
	}
	
	@RequestMapping(value = "/select/place", method=RequestMethod.GET)
	public String selectPlace(HttpServletRequest request) {
		
		return "admin/place";
	}
	
	@RequestMapping(value = "/select/place", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectPlace(HttpServletRequest request, PagingDto paging) {
		Map<String, Object> paramMap = new HashMap<>();
		
		List<PlaceDto> placeList = adminService.selectPlace(paging);
		paging.setTotal(adminService.selectTotalPlace(paging));
		
		paramMap.put("list", placeList);
		paramMap.put("p"	, paging);
		
		return paramMap;
	}
	
	@RequestMapping(value = "/select/boxoffice")
	public String selectBoxoffice(HttpServletRequest request, Model model) {
		Map<String, List<BoxofficeDto>> paramMap = adminService.selectBoxoffice();
		
		model.addAttribute("boxof",paramMap);
		
		return "admin/boxoffice";
	}
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String selectMember(HttpServletRequest request) {
		return "admin/member";
	}
	
	@RequestMapping(value = "/member", method=RequestMethod.POST)
	public String selectMember(HttpServletRequest request, Model model, PagingDto paging) {
		logger.info(paging.toString());
		List<LoginDto> memberList = adminService.selectMember(paging);
		paging.setTotal(adminService.selectTotalMember(paging));
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("paging",paging);
		
		return "admin/member";
	}
	
	@RequestMapping(value = "/member/changeGrade")
	@ResponseBody
	public void changeGrade(HttpServletRequest request, LoginDto member) {
		adminService.changeGrade(member);
	}
	
}
