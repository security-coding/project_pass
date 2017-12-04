package com.pknu.pass.place.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.place.service.PlaceService;
import com.pknu.pass.play.dto.MainDto;

@Controller
@RequestMapping("/place")
public class PlaceController {
	@Autowired
	PlaceService placeService;
	
	@RequestMapping
	public String placeMain() {
		return "place/placeMain";
	}
	
	@RequestMapping(value = "/titles")
	@ResponseBody
	public List<MainDto> getTitles(String mt10id) {
		return placeService.getTitles(mt10id);
	}
}
