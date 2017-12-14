package com.pknu.pass.place.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.pass.place.dao.PlaceDao;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.MainDto;

@Service
public class PlaceServiceImpl implements PlaceService {
    @Autowired
    PlaceDao placeDao;

    @Override
    public List<PlaceDto> selectPlace(String la, String lo) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("la", la);
        paramMap.put("lo", lo);

        return placeDao.selectPlace(paramMap);
    }

    @Override
    public List<MainDto> getTitles(String mt10id) {
        return placeDao.getTitles(mt10id);
    }

}
