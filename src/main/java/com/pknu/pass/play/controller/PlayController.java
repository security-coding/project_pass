package com.pknu.pass.play.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
       
		return "play/playlist";
	}
	
	@ResponseBody
	@RequestMapping(value = "/change" )
	public ArrayList<MainDto> getChange(String type) throws Exception {
		
		ArrayList<MainDto> fileNames = new ArrayList<>(); 
		
		fileNames = playService.getChange(type);

		return fileNames;

	}

	
	@ResponseBody
	@RequestMapping(value = "/getNextPoster" )
	public ArrayList<MainDto> getNextPoster(String stNum, String index) throws Exception {
		
		ArrayList<MainDto> fileNames = new ArrayList<>(); 
		
		fileNames = playService.getNextPoster(stNum,index);

		return fileNames;

	}
	
}
