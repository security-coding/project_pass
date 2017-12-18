package com.pknu.pass.place.dao;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.MainDto;

import java.util.List;
import java.util.Map;

public interface PlaceDao {

	List<MainDto> getTitles(String mt10id);
	List<PlaceDto> selectPlace(Map<String,String> paramMap);
}
