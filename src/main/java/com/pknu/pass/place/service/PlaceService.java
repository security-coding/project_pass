package com.pknu.pass.place.service;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.MainDto;

import java.util.List;

public interface PlaceService {

	List<MainDto> getTitles(String mt10id);

	List<PlaceDto> selectPlace(String la, String lo);

}
