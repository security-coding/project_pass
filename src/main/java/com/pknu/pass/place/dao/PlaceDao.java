package com.pknu.pass.place.dao;

import java.util.List;

import com.pknu.pass.play.dto.MainDto;

public interface PlaceDao {

	List<MainDto> getTitles(String mt10id);

}
