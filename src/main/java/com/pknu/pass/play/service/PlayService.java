package com.pknu.pass.play.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlayService {

	public void playMain(Model model);
	
	public ArrayList<MainDto> getChange(String type);

	public ArrayList<MainDto> getNextPoster(String stNum, String pType);

	public void playNowMain(Model model);
	
	public ArrayList<MainDto> getNowChange(String type);

	public ArrayList<MainDto> getNowNextPoster(String stNum, String pType);
	
	public void getDetail(String mt20id,Model model);

	public void getsearch(String keyword, Model model);
	
	public void getNearMap(String la, String lo, Model model); 
		
	public void boxTest(Model model);
	
	public ArrayList<MainBoxofficeDto> getBoxChange(String type);

	public void reMemberInf(String id,Model model);
}
