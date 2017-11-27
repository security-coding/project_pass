package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.HashMap;

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
		model.addAttribute("playList", posters);
		System.out.println(posters+"+++++++++++++++++++++++++++++++");
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
	
}