package com.pknu.pass.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;
import com.pknu.pass.play.dto.PlaceDto;

public interface AdminDao {
	void insertConcertInf(ConcertDto concert);
	void insertImageInf(ImageDto image);
	void insertPlaceInf(PlaceDto place);
	void insertBoxofInf(BoxofficeDto boxoffice);
	
	void deleteImageInf(String string);
	void deleteBoxofInf();
	
	String getImageName(Map<String, String> map);
	ArrayList<ImageDto> imgUpdateCheck(String mt20id);
	
	List<ConcertDto> selectConcert(PagingDto paging);
	int selectTotalConcert();
	ConcertDto selectOneConcert(String mt20id);
	List<ImageDto> selectImageList(String mt20id);
	
	List<PlaceDto> selectPlace(PagingDto paging);
	int selectTotalPlace(PagingDto paging);
	
}

