package com.pknu.pass.play.service;

import java.util.ArrayList;

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
	
	ArrayList<String> posters;
	
	@Override
	public void playMain(Model model) {
		
		posters=playDao.getPoster();
      
		System.out.println(posters.toString());
		
		model.addAttribute("playList", posters);
	}

}
