package com.pknu.pass.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.admin.service.AdminService;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;

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
	
	@RequestMapping(value = "/select/concert")
	public String selectConcert(HttpServletRequest request, Model model, PagingDto paging) {
		logger.info("paging : " + paging);
		List<ConcertDto> concertList = adminService.selectConcert(paging);
		paging.setTotal(adminService.selectTotalConcert(paging));
		
		model.addAttribute("concertList", concertList);
		model.addAttribute("paging",paging);
		
		return "admin/concert";
	}
	
	@RequestMapping(value = "/select/concert/{mt20id}")
	public String selectOneConcert(HttpServletRequest request, Model model,@PathVariable String mt20id) {
		ConcertDto concert = adminService.selectOneConcert(mt20id);
		List<ImageDto> imageList = adminService.selectImageList(mt20id);
		
		model.addAttribute("concert",concert);
		model.addAttribute("imageList", imageList);
		
		return "admin/concertDetail";
	}
	
	@RequestMapping(value = "/select/place")
	public String selectPlace(HttpServletRequest request, Model model, PagingDto paging) {
		List<PlaceDto> placeList = adminService.selectPlace(paging);
		paging.setTotal(adminService.selectTotalPlace(paging));
		
		model.addAttribute("placeList",placeList);
		model.addAttribute("paging", paging);
		
		return "admin/place";
	}
	
	@RequestMapping(value = "/select/boxoffice")
	public String selectBoxoffice(HttpServletRequest request, Model model) {
		Map<String, List<BoxofficeDto>> paramMap = adminService.selectBoxoffice();
		
		model.addAttribute("boxof",paramMap);
		
		return "admin/boxoffice";
	}
	
	@RequestMapping(value = "/member")
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
