package com.pknu.pass.play.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlayDao {

	//상영예정
	public ArrayList<MainDto> getPoster();
	
	public ArrayList<MainDto> getChange(String pType);

	public ArrayList<MainDto> getNextPoster(HashMap<String, String> stNum);
	
	public ArrayList<MainDto> getAllNextPoster(String stNum);
	
	//상영중
    public ArrayList<MainDto> getNowPoster();
	
	public ArrayList<MainDto> getNowChange(String pType);

	public ArrayList<MainDto> getNowNextPoster(HashMap<String, String> stNum);
	
	public ArrayList<MainDto> getNowAllNextPoster(String stNum);
	
	//상세페이지
	public ArrayList<String> getDetailPoster(String mt20id);

	public ArrayList<DetailDto> getDetailintroImage(String mt20id);

	public DetailDto getDetailInf(String mt20id);

	//검색
	public ArrayList<DetailDto> getsearch(String keyword);

	//지도
	public ArrayList<PlaceDto> getNearMap(HashMap<String, String> lalo);
	
	//박스오피스
    public ArrayList<MainBoxofficeDto> getBoxOffice();
    
    public ArrayList<MainBoxofficeDto> getBoxChange(String cateCode);
}
