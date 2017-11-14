package com.pknu.pass.admin.dao;

import java.util.ArrayList;
import java.util.Map;

import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;
import com.pknu.pass.play.dto.PlaceDto;

public interface AdminDao {
	void insertConcertInf(ConcertDto concert);
	void insertImageInf(ImageDto image);
	void insertPlaceInf(PlaceDto place);
}
