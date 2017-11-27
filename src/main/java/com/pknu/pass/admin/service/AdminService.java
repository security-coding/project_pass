package com.pknu.pass.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.play.dto.ConcertDto;

public interface AdminService {
	void getConertInf(HttpSession session, String stdate, String eddate, String prfstate) throws Exception;
	void getPlaceInf();
	void getBoxofficeInf();
	
	List<ConcertDto> selectConcert(PagingDto paging);
	int selectTotalConcert();

}
