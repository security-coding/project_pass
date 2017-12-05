package com.pknu.pass.play.dao;

import java.util.ArrayList;
<<<<<<< HEAD

import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlayDao {

//	public ArrayList<String> getPoster();
=======
import java.util.HashMap;

import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;
import com.pknu.pass.play.dto.PlaceDto;

public interface PlayDao {

	//상영예정
>>>>>>> 9f188dada92f082683093830b08a07836a675393
	public ArrayList<MainDto> getPoster();
	
	public ArrayList<MainDto> getChange(String pType);

<<<<<<< HEAD
	public DetailDto getDetailPoster(String mt20id);
=======
	public ArrayList<MainDto> getNextPoster(HashMap<String, String> stNum);
	
	public ArrayList<MainDto> getAllNextPoster(String stNum);
	
	//상영중	
    public ArrayList<MainDto> getNowPoster();
	
	public ArrayList<MainDto> getNowChange(String pType);

	public ArrayList<MainDto> getNowNextPoster(HashMap<String, String> stNum);
	
	public ArrayList<MainDto> getNowAllNextPoster(String stNum);
	
	//상세페이지
	public ArrayList<String> getDetailPoster(String mt20id);
>>>>>>> 9f188dada92f082683093830b08a07836a675393

	public ArrayList<DetailDto> getDetailintroImage(String mt20id);

	public DetailDto getDetailInf(String mt20id);

<<<<<<< HEAD
	public ArrayList<DetailDto> getsearch(String keyword);
	
=======
	//검색
	public ArrayList<DetailDto> getsearch(String keyword);

	//지도
	public ArrayList<PlaceDto> getNearMap(HashMap<String, String> lalo);
	
	//박스오피스
    public ArrayList<MainBoxofficeDto> getBoxOffice();
    
    public ArrayList<MainBoxofficeDto> getBoxChange(String cateCode);
>>>>>>> 9f188dada92f082683093830b08a07836a675393
}
