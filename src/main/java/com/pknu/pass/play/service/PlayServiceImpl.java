package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.admin.dao.AdminDao;
import com.pknu.pass.play.dao.PlayDao;
import com.pknu.pass.play.dto.ImageDto;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao playDao;
	
	
	
	
	@Override
	public void playMain(Model model) {
		
		ArrayList<String> posters= new ArrayList<>();
		posters=playDao.getPoster();
      
		//System.out.println(posters.toString());
		
		model.addAttribute("playList", posters);
	}

	@Override
	public ArrayList<String> getChange(String type) {
		ArrayList<String> posters= new ArrayList<>();
		String pType1="연극";
		String pType2="클래식";
		System.out.println(type);
		
		if(type=="1"){
		posters=playDao.getChange(pType1);
		System.out.println(posters.toString());
		}
		else if(type=="2"){
		posters=playDao.getChange(pType2);
		System.out.println(posters.toString());
		}
		else {}
				

		
		return posters;
		}
}