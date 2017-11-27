package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.admin.dao.AdminDao;
import com.pknu.pass.play.dao.PlayDao;
import com.pknu.pass.play.dto.ImageDto;
import com.pknu.pass.play.dto.MainDto;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao playDao;

	@Override
	public void playMain(Model model) {

		ArrayList<MainDto> posters = new ArrayList<>();
		posters = playDao.getPoster();
//		System.out.println("���� :"+posters.get(0).getPrfnm());
//		System.out.println("���� :"+posters.get(1).getPrfnm());
//		System.out.println("���� :"+posters.get(2).getPrfnm());
		model.addAttribute("playList", posters);
	}

	@Override
	public ArrayList<MainDto> getChange(String type) {
		ArrayList<MainDto> posters = new ArrayList<>();
		String pType1 = "����";
		String pType2 = "������";
		String pType3 = "Ŭ����";
		String pType4 = "�����";
		String pType5 = "����";
		String pType6 = "�߷�";
		String pType7 = "����";
		String pType8 = "����";

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
}