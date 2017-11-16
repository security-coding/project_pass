package com.pknu.pass.play.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.admin.dao.AdminDao;
import com.pknu.pass.play.dao.PlayDao;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao playDao;
	
	@Override
	public void playMain(Model model) {
		

	}

}
