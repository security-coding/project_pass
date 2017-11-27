package com.pknu.pass.play.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pknu.pass.play.dto.MainDto;

public interface PlayDao {

	public ArrayList<MainDto> getPoster();
	
	public ArrayList<MainDto> getChange(String pType);

	public ArrayList<MainDto> getNextPoster(HashMap<String, String> stNum);
	
	public ArrayList<MainDto> getAllNextPoster(String stNum);
	
}
