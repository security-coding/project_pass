package com.pknu.pass.play.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pass.login.dao.LoginDao;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dao.PlayDao;
import com.pknu.pass.play.dto.BookmarkDto;
import com.pknu.pass.play.dto.DetailDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao playDao;

	// 현재 상영작
	@Override
	public ArrayList<MainDto> getNowNextPoster(String stNum, String pType) {

		ArrayList<MainDto> posters = new ArrayList<>();
		if (pType.equals("전체")) {
			posters = playDao.getNowAllNextPoster(stNum);
		} else {
			HashMap<String, String> map = new HashMap<>();
			map.put("stNum", stNum);
			map.put("pType", pType);
			posters = playDao.getNowNextPoster(map);
		}
		return posters;
	}

	// 상영예정작
	@Override
	public ArrayList<MainDto> getNextPoster(String stNum, String pType) {

		ArrayList<MainDto> posters = new ArrayList<>();
		if (pType.equals("전체")) {
			posters = playDao.getAllNextPoster(stNum);
		} else {
			HashMap<String, String> map = new HashMap<>();
			map.put("stNum", stNum);
			map.put("pType", pType);
			posters = playDao.getNextPoster(map);
		}

		return posters;
	}

	// 상세페이지
	@Override
	public void getDetail(String mt20id, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");

		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("mt20id", mt20id);
		paramMap.put("id", id);

		DetailDto detailInf = new DetailDto();
		ArrayList<String> detailImages = new ArrayList<>();

		detailImages = playDao.getDetailPoster(mt20id);
		detailInf = playDao.getDetailInf(mt20id);

		model.addAttribute("detailImages", detailImages);
		model.addAttribute("detailInf", detailInf);

		if (playDao.changeLikes(paramMap) != null) {
			model.addAttribute("fullHeart", 1);
		} else {
			model.addAttribute("fullHeart", 0);
		}
		
		model.addAttribute("bookmark", playDao.getBookmark(paramMap));
			
	}

	// 검색
	@Override
	public void getsearch(String keyword, Model model) {
		ArrayList<DetailDto> value = new ArrayList<>();

		value = playDao.getsearch(keyword);
		System.out.println(value);

		model.addAttribute("keyword", value);

	}

	// 지도
	@Override
	public ArrayList<PlaceDto> getNearMap(String la, String lo) {

		HashMap<String, String> lalo = new HashMap<>();
		lalo.put("la", la);
		lalo.put("lo", lo);

		return playDao.getNearMap(lalo);
	}

	@Override
	public void boxTest(Model model) {

		ArrayList<MainBoxofficeDto> mbf = playDao.getBoxOffice();
		model.addAttribute("boxList", mbf);
	}

	@Override
	public ArrayList<MainBoxofficeDto> getBoxChange(String type) {

		ArrayList<MainBoxofficeDto> boxPosters = new ArrayList<>();

		boxPosters = playDao.getBoxChange(type);
		// System.out.println(posters.toString());
		return boxPosters;
	}

	// 좋아요
	@Override
	public HashMap<String, Integer> UpdateLikes(String id, String mt20id, int changeVal, Model model) {
		HashMap<String,Integer> UpdateStat = new HashMap<>();
		int Count;
		HashMap<String, String> Likes = new HashMap<>();
		Likes.put("mt20id", mt20id);
		Likes.put("id", id);
		if (changeVal == 0) {
			playDao.getLikes(Likes);
			Count=playDao.likesCount(Likes);
			UpdateStat.put("Stat",0);
			UpdateStat.put("Count",Count);
			return UpdateStat;
		} else {
			playDao.delLikes(Likes);
			Count=playDao.likesCount(Likes);
			UpdateStat.put("Stat",1);
			UpdateStat.put("Count",Count);
			return UpdateStat;
		}
	}

	@Override
	public int nowLikes(String mt20id) {
		HashMap<String, String> Likes = new HashMap<>();
		Likes.put("mt20id", mt20id);
		return playDao.likesCount(Likes);
	}

	@Override
	public void updateBookmark(BookmarkDto bookmark) {
		if (bookmark.getValue() == 0)
			playDao.insertBookmark(bookmark);
		else
			playDao.deleteBookmark(bookmark);
	}
}