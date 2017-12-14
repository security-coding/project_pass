package com.pknu.pass.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.BoxofficeDto;
import com.pknu.pass.play.dto.ConcertDto;
import com.pknu.pass.play.dto.ImageDto;

public interface AdminService {
	void getConertInf(HttpServletRequest request, String stdate, String eddate, String prfstate) throws Exception;
	void getPlaceInf();
	void getBoxofficeInf();
	
	List<ConcertDto> selectConcert(PagingDto paging);
	int selectTotalConcert(PagingDto paging);
	
	List<PlaceDto> selectPlace(PagingDto paging);
	int selectTotalPlace(PagingDto paging);
	
	Map<String, List<BoxofficeDto>> selectBoxoffice();
	
	List<LoginDto> selectMember(PagingDto paging);
	List<CommentDto> selectMemberComment(String id);	
	int selectTotalMember(PagingDto paging);
	void changeGrade(LoginDto member);
	
	List<CommentDto> selectComment(PagingDto paging);
	int selectTotalComment(PagingDto paging);
	void deleteComment(int commentNum);
	
    List<PlaceDto> searchPlace(String value);

	void applyConcert(ConcertDto concert, HttpServletRequest request);
}
