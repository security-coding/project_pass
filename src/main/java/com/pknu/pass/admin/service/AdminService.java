<<<<<<< HEAD
package com.pknu.pass.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;

public interface AdminService {
	void getConertInf(HttpSession session, String stdate, String eddate, String prfstate) throws Exception;
	void getPlaceInf();
	void getBoxofficeInf();
	
	List<ConcertDto> selectConcert(PagingDto paging);
	int selectTotalConcert();
	ConcertDto selectOneConcert(String mt20id);
	List<ImageDto> selectImageList(String mt20id);

}
=======
package com.pknu.pass.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;
import com.pknu.pass.play.dto.PlaceDto;

public interface AdminService {
	void getConertInf(HttpSession session, String stdate, String eddate, String prfstate) throws Exception;
	void getPlaceInf();
	void getBoxofficeInf();
	
	List<ConcertDto> selectConcert(PagingDto paging);
	int selectTotalConcert();
	ConcertDto selectOneConcert(String mt20id);
	List<ImageDto> selectImageList(String mt20id);
	List<PlaceDto> selectPlace(PagingDto paging);
	int selectTotalPlace(PagingDto paging);
	Map<String, ArrayList<BoxofficeDto>> selectBoxoffice();

}
>>>>>>> 9f188dada92f082683093830b08a07836a675393
