package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.login.dao.LoginDao;
import com.pknu.pass.login.dto.LoginDto;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dao.PlayDao;
import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao playDao;
	
	@Autowired
	LoginDao loginDao;
	
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

//지도
	@Override
	public ArrayList<PlaceDto> getNearMap(String la, String lo) {
		
		HashMap<String, String> lalo=new HashMap<>();
		lalo.put("la", la);
		lalo.put("lo", lo);
		
		return playDao.getNearMap(lalo);
	}


	@Override
	public void boxTest(Model model) {
		
		ArrayList<MainBoxofficeDto> mbf=playDao.getBoxOffice();
		model.addAttribute("boxList",mbf);
	}
	
	
	
	//새로고침
	@Override
	public void Refresh(String id,Model model) {
		// TODO Auto-generated method stub
		LoginDto user=null;
		user=loginDao.getUser(id);
		model.addAttribute("imageUrl",user.getProfile()) ;
	}


	@Override
	public void reMemberInf(String id,Model model) {
		LoginDto user=null;
		user=loginDao.getUser(id);
		model.addAttribute("imageUrl",user.getProfile());
	}


	@Override
	public ArrayList<MainBoxofficeDto> getBoxChange(String type) {
		
		ArrayList<MainBoxofficeDto> boxPosters = new ArrayList<>(); 
		
		boxPosters = playDao.getBoxChange(type);
		//System.out.println(posters.toString());
		return boxPosters;
	}
	
}