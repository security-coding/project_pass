package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.BookmarkDto;
import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;

public interface PlayService {

	public ArrayList<MainDto> getNextPoster(String stNum, String pType);

	public ArrayList<MainDto> getNowNextPoster(String stNum, String pType);

	public void getDetail(String mt20id, Model model, HttpSession session);

	public void getsearch(String keyword, Model model);

	public ArrayList<PlaceDto> getNearMap(String la, String lo);

	public void boxTest(Model model);//

	public ArrayList<MainBoxofficeDto> getBoxChange(String type);//

	public HashMap<String, Integer> UpdateLikes(String id, String mt20id, int changeVal, Model model);

	public int nowLikes(String mt20id);

	public void updateBookmark(BookmarkDto bookmark);

}
