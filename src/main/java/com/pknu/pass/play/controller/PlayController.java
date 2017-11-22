package com.pknu.pass.play.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.pknu.pass.admin.service.AdminService;
import com.pknu.pass.play.dto.MainDto;
import com.pknu.pass.play.service.PlayService;

@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	PlayService playService;

	@RequestMapping
	public String playMain(Model model) {

		playService.playMain(model);
       
		return "play/index";
	}

//	@ResponseBody
//	@RequestMapping(value = "/change")
//	public List<String> getChange(String type) throws Exception {
//		List<String> fileNames = new ArrayList<>(); 
//				
//		fileNames = playService.getChange(type);
//		
//		return fileNames;
//
//	}
	@ResponseBody
	@RequestMapping(value = "/change")
	public List<MainDto> getChange(String type) throws Exception {
		
		List<MainDto> fileNames = new ArrayList<>(); 
		
		fileNames = playService.getChange(type);
		
		return fileNames;

	}

}
