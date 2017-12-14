package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pass.play.dto.BookmarkDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlayService {

    ArrayList<MainDto> getNextPoster(String stNum, String pType);

    ArrayList<MainDto> getNowNextPoster(String stNum, String pType);

    void getDetail(String mt20id, Model model, HttpSession session);

    void getSearch(String keyword, Model model);

    void boxTest(Model model);//

    ArrayList<MainBoxofficeDto> getBoxChange(String type);//

    HashMap<String, Integer> UpdateLikes(String id, String mt20id, int changeVal, Model model);

    int nowLikes(String mt20id);

    void updateBookmark(BookmarkDto bookmark);

}
