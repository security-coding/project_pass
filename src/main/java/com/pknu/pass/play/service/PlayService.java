package com.pknu.pass.play.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlayService {

	public void playMain(Model model);
	public ArrayList<MainDto> getChange(String type);
	public ArrayList<DetailDto> getDetail(String mt20id,Model model,DetailDto detailDto);
	public ArrayList<DetailDto> getsearch(String keyword, Model model,DetailDto detailDto);
	
}
