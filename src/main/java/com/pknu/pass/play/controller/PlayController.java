package com.pknu.pass.play.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/change", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<ArrayList<String>> getChange(String type) throws Exception {
		ArrayList<String> fileNames = playService.getChange(type);

		HttpStatus userStatus = HttpStatus.NOT_FOUND;
		if (fileNames != null) {
			userStatus = HttpStatus.FOUND;
		}
		return new ResponseEntity<ArrayList<String>>(fileNames, userStatus);

		// return null;
	}

}
