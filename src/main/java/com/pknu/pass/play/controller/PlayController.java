package com.pknu.pass.play.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;
import com.pknu.pass.play.service.PlayService;

@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	PlayService playService;

	// 메인 화면
	@RequestMapping
	public String boxOfficeMain(Model model) {
		playService.boxTest(model);

		return "play/main";
	}

	@ResponseBody
	@RequestMapping(value = "/change")
	public ArrayList<MainBoxofficeDto> getBoxChange(String type) throws Exception {

		ArrayList<MainBoxofficeDto> boxPosters = new ArrayList<>();

		boxPosters = playService.getBoxChange(type);

		return boxPosters;

	}

	// 현재공연
	@RequestMapping(value = "/now")
	public String playNowMain(Model model) {

		playService.playNowMain(model);
		return "play/playinglist";

	}

	@ResponseBody
	@RequestMapping(value = "/now/change")
	public ArrayList<MainDto> getNowChange(String type) throws Exception {

		ArrayList<MainDto> fileNames = new ArrayList<>();

		fileNames = playService.getNowChange(type);

		return fileNames;
	}

	@ResponseBody
	@RequestMapping(value = "/now/getNextPoster")
	public ArrayList<MainDto> getNowNextPoster(String stNum, String index) throws Exception {

		ArrayList<MainDto> fileNames = new ArrayList<>();

		fileNames = playService.getNowNextPoster(stNum, index);

		return fileNames;
	}

	// 상영예정작
	@RequestMapping(value = "/come")
	public String playMain(Model model) {

		playService.playMain(model);
		return "play/playlist";

	}

	@ResponseBody
	@RequestMapping(value = "/come/change")
	public ArrayList<MainDto> getChange(String type) throws Exception {

		ArrayList<MainDto> fileNames = new ArrayList<>();

		fileNames = playService.getChange(type);

		return fileNames;

	}

	@ResponseBody
	@RequestMapping(value = "/come/getNextPoster")
	public ArrayList<MainDto> getNextPoster(String stNum, String index) throws Exception {

		ArrayList<MainDto> fileNames = new ArrayList<>();

		fileNames = playService.getNextPoster(stNum, index);

		return fileNames;
	}

	// 상세페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getDetail(String mt20id, Model model) throws Exception {

		playService.getDetail(mt20id, model);

		return "play/detailpage";
	}

	@RequestMapping(value = "/search")
	public String search(@RequestParam("keyword") String keyword, Model model) {

		playService.getsearch(keyword, model);

		return "play/search";
	}

}
