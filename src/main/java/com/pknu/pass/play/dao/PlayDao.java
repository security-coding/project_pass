package com.pknu.pass.play.dao;

import java.util.ArrayList;

import com.pknu.pass.play.dto.MainDto;

public interface PlayDao {

//	public ArrayList<String> getPoster();
	public ArrayList<MainDto> getPoster();
	
	public ArrayList<MainDto> getChange(String pType);
	
}
