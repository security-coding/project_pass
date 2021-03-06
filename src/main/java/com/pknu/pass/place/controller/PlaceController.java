package com.pknu.pass.place.controller;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.place.service.PlaceService;
import com.pknu.pass.play.dto.MainDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/place")
public class PlaceController {
    @Autowired
    PlaceService placeService;

    @RequestMapping
    public String placeMain() {
        return "place/placeMain";
    }

    @RequestMapping(value = "/select")
    @ResponseBody
    public List<PlaceDto> selectPlace(String la, String lo) {
        return placeService.selectPlace(la, lo);
    }

    @RequestMapping(value = "/titles")
    @ResponseBody
    public List<MainDto> getTitles(String mt10id) {
        return placeService.getTitles(mt10id);
    }
}
