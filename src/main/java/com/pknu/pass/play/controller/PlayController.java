package com.pknu.pass.play.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.place.dto.PlaceDto;
import com.pknu.pass.play.dto.BookmarkDto;
import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;
import com.pknu.pass.play.service.PlayService;

@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	PlayService playService;

	// 메인 화면
	@RequestMapping
	public String boxOfficeMain(Model model) {
		
		playService.boxTest(model);

		return "play/main";
	}
	

	@ResponseBody
	@RequestMapping(value = "/change")
	public ArrayList<MainBoxofficeDto> getBoxChange(String type) throws Exception {

		ArrayList<MainBoxofficeDto> boxPosters = new ArrayList<>();

		boxPosters = playService.getBoxChange(type);

		return boxPosters;

	}

	// 현재공연
	@RequestMapping(value = "/now" ,method=RequestMethod.GET)
	public String playNowMain() {
         

		
		return "play/playinglist";


	}

	
	@RequestMapping(value="/now/getNextPoster")
	@ResponseBody
	public Map<String, Object> getNowNextPoster(String genre,int index, int pageStartNum){							

		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		ArrayList<MainDto> fileNames = new ArrayList<>();
		
		PagingDto paging = new PagingDto();
		paging.setIndex(index);
		paging.setPageStartNum(pageStartNum);
		if(genre.equals("전체")) {
			paging.setTotal(playService.getTotalNowPlays());			
		}else {
			paging.setTotal(playService.getGenreNowPlays(genre));  	
		}
		
		fileNames = playService.getNowNextPoster(paging, genre);
		resultMap.put("p", paging);
		resultMap.put("list", fileNames);
		
		
		return 	resultMap;
	}

	

	// 상영예정작
	@RequestMapping(value = "/come")
	public String playMain() {


		return "play/playlist";


	}
	
	@RequestMapping(value="/come/getNextPoster")
	@ResponseBody
	public Map<String, Object> getNextPoster(String genre,int index, int pageStartNum){							
		
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		ArrayList<MainDto> fileNames = new ArrayList<>();
		PagingDto paging = new PagingDto();
		paging.setIndex(index);
		paging.setPageStartNum(pageStartNum);
		if(genre.equals("전체")) {
			paging.setTotal(playService.getTotalComePlays());
			
		}else {
			paging.setTotal(playService.getGenreComePlays(genre));  		
		}
		fileNames = playService.getComeNextPoster(paging, genre);
		resultMap.put("p", paging);
		resultMap.put("list", fileNames);
		
		
		return 	resultMap;
	}
	
//	상세페이지
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String getDetail(String mt20id, Model model,HttpSession session) throws Exception {
		
		playService.getDetail(mt20id, model, session);
		
		return "play/detailpage";
	}
	
	
//	좋아요 기능 내 추가를 할 시
//	@ResponseBody
//	@RequestMapping(value="/UpdateLikes")
//	public int UpdateLikes(@RequestParam("id")String id, @RequestParam("mt20id")String mt20id,@RequestParam("changeVal")int changeVal, Model model) {
//		return playService.UpdateLikes(id, mt20id, changeVal, model); 
//	}
	
	@ResponseBody
	@RequestMapping(value="/UpdateLikes")
	public HashMap<String,Integer> UpdateLikes(@RequestParam("id")String id, @RequestParam("mt20id")String mt20id,@RequestParam("changeVal")int changeVal, Model model) {
		HashMap<String,Integer>likesMap=playService.UpdateLikes(id, mt20id, changeVal, model);
		return likesMap; 
	}
	
	@ResponseBody
	@RequestMapping(value="/nowLikes")
	public int nowLikes(@RequestParam("mt20id")String mt20id) {
		return playService.nowLikes(mt20id); 
	}

	@RequestMapping(value = "/search")
	public String search(@RequestParam("keyword") String keyword, Model model) {

		playService.getsearch(keyword, model);

		return "play/search";
	}
	
	@RequestMapping(value="/bookmark", method=RequestMethod.POST)
	@ResponseBody
	public void updateBookmark(BookmarkDto bookmark) {
		playService.updateBookmark(bookmark);
	}

}
