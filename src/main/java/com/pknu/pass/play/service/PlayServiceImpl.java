<<<<<<< HEAD
package com.pknu.pass.play.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.play.dao.PlayDao;
import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainDto;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao playDao;

	@Override
	public void playMain(Model model) {

		ArrayList<MainDto> posters = new ArrayList<>();
		posters = playDao.getPoster();
//		System.out.println("제목 :"+posters.get(0).getPrfnm());
//		System.out.println("제목 :"+posters.get(1).getPrfnm());
//		System.out.println("제목 :"+posters.get(2).getPrfnm());
		model.addAttribute("playList", posters);
		System.out.println(posters+"+++++++++++++++++++++++++++++++");
	}

	@Override
	public ArrayList<MainDto> getChange(String type) {
		ArrayList<MainDto> posters = new ArrayList<>();
		String pType1 = "연극";
		String pType2 = "뮤지컬";
		String pType3 = "클래식";
		String pType4 = "오페라";
		String pType5 = "무용";
		String pType6 = "발래";
		String pType7 = "국악";
		String pType8 = "복합";

		if (type.equals("11")) {
			posters = playDao.getPoster();
			
		} else if (type.equals("1")) {
			posters = playDao.getChange(pType1);
			
		} else if (type.equals("2")) {
			posters = playDao.getChange(pType2);
			
		} else if (type.equals("3")) {
			posters = playDao.getChange(pType3);
			
		} else if (type.equals("4")) {
			posters = playDao.getChange(pType4);
			
		} else if (type.equals("5")) {
			posters = playDao.getChange(pType5);
			
		} else if (type.equals("6")) {
			posters = playDao.getChange(pType6);
			
		} else if (type.equals("7")) {
			posters = playDao.getChange(pType7);
			
		} else if (type.equals("8")) {
			posters = playDao.getChange(pType8);
		
		}
		return posters;
	}

	@Override
	public ArrayList<DetailDto> getDetail(String mt20id,Model model,DetailDto detailDto) {
		
		DetailDto detailInf=new DetailDto();
		DetailDto poster = new DetailDto();
		ArrayList<DetailDto> introImages=new ArrayList<>();

		poster=playDao.getDetailPoster(mt20id);
		introImages=playDao.getDetailintroImage(mt20id);
		detailInf=playDao.getDetailInf(mt20id);
		
		System.out.println(poster+"+++++++++++detailposters");
		System.out.println(introImages+"+++++++++++detailIntroImage");
		System.out.println(detailInf+"++++++++++++++++++++++++++detailInf");
		model.addAttribute("poster",poster);
		model.addAttribute("introImages",introImages);
		model.addAttribute("detailInf",detailInf);
		
		return null;
	}

	@Override
	public ArrayList<DetailDto> getsearch(String keyword, Model model,DetailDto detailDto) {
		ArrayList<DetailDto> value=new ArrayList<>();
		value=playDao.getsearch(keyword);
		System.out.println(value);
		model.addAttribute("keyword",value);
		return null;
	}
	
	
	
=======
package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.play.dao.PlayDao;
import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;
import com.pknu.pass.play.dto.PlaceDto;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao playDao;

	
//현재 상영작	
	@Override
	public void playNowMain(Model model) {

		ArrayList<MainDto> posters = new ArrayList<>();
		posters = playDao.getNowPoster();
		model.addAttribute("playList", posters);
		
	}

	
	@Override
	public ArrayList<MainDto> getNowChange(String type) {
		ArrayList<MainDto> posters = new ArrayList<>();
			
		if (type.equals("전체")) {
			posters = playDao.getNowPoster();
		    if(!posters.isEmpty()){posters.get(0).setpType("전체");}
			
		} else {
			posters = playDao.getNowChange(type);
			if(!posters.isEmpty()){posters.get(0).setpType(posters.get(0).getGenrenm());}			
		} 
		
		return posters;
	}

	
	
	@Override
	public ArrayList<MainDto> getNowNextPoster(String stNum, String pType) {
		   
		ArrayList<MainDto> posters = new ArrayList<>();
		if(pType.equals("전체")){
			posters = playDao.getNowAllNextPoster(stNum);
		}
		else {
		HashMap<String, String> map=new HashMap<>();
		map.put("stNum", stNum);
		map.put("pType", pType);
		posters = playDao.getNowNextPoster(map);
		}
		
		
		return posters;
	}	
	
//상영예정작
	@Override
	public void playMain(Model model) {

		ArrayList<MainDto> posters = new ArrayList<>();
		posters = playDao.getPoster();
		model.addAttribute("playList", posters);
		
	}

	
	@Override
	public ArrayList<MainDto> getChange(String type) {
		ArrayList<MainDto> posters = new ArrayList<>();
			
		if (type.equals("전체")) {
			posters = playDao.getPoster();
		    if(!posters.isEmpty()){posters.get(0).setpType("전체");}
			
		} else {
			posters = playDao.getChange(type);
			if(!posters.isEmpty()){posters.get(0).setpType(posters.get(0).getGenrenm());}			
		} 
		
		return posters;
	}

	
	
	@Override
	public ArrayList<MainDto> getNextPoster(String stNum, String pType) {
		   
		ArrayList<MainDto> posters = new ArrayList<>();
		if(pType.equals("전체")){
			posters = playDao.getAllNextPoster(stNum);
		}
		else {
		HashMap<String, String> map=new HashMap<>();
		map.put("stNum", stNum);
		map.put("pType", pType);
		posters = playDao.getNextPoster(map);
		}
		
		
		return posters;
	}

	
	
//	상세페이지
	@Override
	public void getDetail(String mt20id,Model model) {
		
		DetailDto detailInf=new DetailDto();
		ArrayList<String> detailImages=new ArrayList<>();

		detailImages=playDao.getDetailPoster(mt20id);
		detailInf=playDao.getDetailInf(mt20id);
		
		model.addAttribute("detailImages",detailImages);	
		model.addAttribute("detailInf",detailInf);
		
	}

//	검색
	@Override
	public void getsearch(String keyword, Model model) {
		ArrayList<DetailDto> value=new ArrayList<>();
		
		value=playDao.getsearch(keyword);
		System.out.println(value);
		
		model.addAttribute("keyword",value);
		
	}


	@Override
	public void getNearMap(String la, String lo, Model model) {
		
		HashMap<String, String> lalo=new HashMap<>();
		lalo.put("la", la);
		lalo.put("lo", lo);
		
		ArrayList<PlaceDto> maps=playDao.getNearMap(lalo);
		for(int i=0; i<maps.size() ; i++){
		System.out.println("공연시설 : "+maps.get(i).toString());
		}
		model.addAttribute("LA",la);
		model.addAttribute("LO",lo);
		model.addAttribute("maps",maps);
	}


	@Override
	public void boxTest(Model model) {
		
		ArrayList<MainBoxofficeDto> mbf=playDao.getBoxOffice();
		model.addAttribute("boxList",mbf);
	}


	@Override
	public ArrayList<MainBoxofficeDto> getBoxChange(String type) {
		
		ArrayList<MainBoxofficeDto> boxPosters = new ArrayList<>(); 
		
		boxPosters = playDao.getBoxChange(type);
		//System.out.println(posters.toString());
		return boxPosters;
	}
	
>>>>>>> 9f188dada92f082683093830b08a07836a675393
}