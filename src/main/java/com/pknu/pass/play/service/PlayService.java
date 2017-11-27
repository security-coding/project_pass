package com.pknu.pass.play.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.pknu.pass.play.dto.MainDto;

public interface PlayService {

	public void playMain(Model model);
	public ArrayList<MainDto> getChange(String type);
	public ArrayList<MainDto> getNextPoster(String stNum, String pType);
	
}
