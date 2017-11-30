package com.pknu.pass.admin.dao;

import java.util.List;
import java.util.Map;

import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;
import com.pknu.pass.play.dto.PlaceDto;

public interface AdminDao {
	/*
	 * 공연 정보 업데이트 
	 * */
	void insertConcertInf(ConcertDto concert);
	void insertImageInf(ImageDto image);
	void insertPlaceInf(PlaceDto place);
	void insertBoxofInf(BoxofficeDto boxoffice);
	
	void deleteImageInf(String string);
	void deleteBoxofInf();
	
	String getImageName(Map<String, String> map);
	List<ImageDto> imgUpdateCheck(String mt20id);
	
	List<ConcertDto> selectConcert(PagingDto paging);
	int selectTotalConcert(PagingDto paging);
	ConcertDto selectOneConcert(String mt20id);
	List<ImageDto> selectImageList(String mt20id);
	
	List<PlaceDto> selectPlace(PagingDto paging);
	int selectTotalPlace(PagingDto paging);
	List<BoxofficeDto> selectBoxoffice(String catecode);
	
	List<LoginDto> selectMember(PagingDto paging);
	int selectTotalMember(PagingDto paging);
	
}

