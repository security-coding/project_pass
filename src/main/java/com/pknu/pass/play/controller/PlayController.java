package com.pknu.pass.play.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pass.admin.service.AdminService;
import com.pknu.pass.play.service.PlayService;

@Controller
@RequestMapping("/play")
public class PlayController {
	
	
	@Autowired
	PlayService playService;

	@RequestMapping
	public String playMain(Model model) {
		
		playService.playMain(model);
		
		return "index";
	}
	
	
	
	
}
