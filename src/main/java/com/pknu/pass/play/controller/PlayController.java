package com.pknu.pass.play.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@ResponseBody
	@RequestMapping(value = "/change")
	public List<String> getChange(String type) throws Exception {
		List<String> fileNames = new ArrayList<>(); 
				
		fileNames = playService.getChange(type);
		
		return fileNames;

		// return null;
	}

}
