package com.pknu.pass.place.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.pass.place.dao.PlaceDao;
import com.pknu.pass.play.dto.MainDto;

@Service
public class PlaceServiceImpl implements PlaceService{
	@Autowired
	PlaceDao placeDao;
	
	@Override
	public List<MainDto> getTitles(String mt10id) {
		return placeDao.getTitles(mt10id);
	}
	
}
