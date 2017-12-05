package com.pknu.pass.place.service;

import java.util.List;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlaceService {

	List<MainDto> getTitles(String mt10id);

	List<PlaceDto> selectPlace(String la, String lo);

}
