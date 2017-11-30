package com.pknu.pass.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;
import com.pknu.pass.play.dto.PlaceDto;

public interface AdminService {
	void getConertInf(HttpSession session, String stdate, String eddate, String prfstate) throws Exception;
	void getPlaceInf();
	void getBoxofficeInf();
	
	List<ConcertDto> selectConcert(PagingDto paging);
	
	int selectTotalConcert(PagingDto paging);
	ConcertDto selectOneConcert(String mt20id);
	List<ImageDto> selectImageList(String mt20id);
	
	List<PlaceDto> selectPlace(PagingDto paging);
	int selectTotalPlace(PagingDto paging);
	
	Map<String, List<BoxofficeDto>> selectBoxoffice();
	
	List<LoginDto> selectMember(PagingDto paging);
	int selectTotalMember(PagingDto paging);

}
