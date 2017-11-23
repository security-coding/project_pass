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
	@RequestMapping(value = "/change" )
	public ArrayList<MainDto> getChange(String type) throws Exception {
		
		ArrayList<MainDto> fileNames = new ArrayList<>(); 
		
		fileNames = playService.getChange(type);
//		for(int i=0;i<fileNames.size();i++){
//			System.out.println(fileNames.get(i).toString());
//		}
		return fileNames;

	}

	
	@RequestMapping(value = "/detail" , method=RequestMethod.GET)
	public String getDetail(String mt20id) throws Exception {
		
		ArrayList<MainDto> fileNames = new ArrayList<>(); 
		System.out.println(mt20id);
	//	playService.getDetail(mt20id);

		return null;

	}
	
}
