package com.pknu.pass.play.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.support.HttpAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.play.dto.MainBoxofficeDto;
import com.pknu.pass.play.dto.MainDto;
import com.pknu.pass.play.service.PlayService;

@Controller
@RequestMapping("/play")
public class PlayController {
	
	@Autowired
	PlayService playService;

	
	// 현재공연	
		@RequestMapping(value = "/now")
		public String playNowMain(Model model) {

			playService.playNowMain(model);
			return "play/playinglist";

		}
		
		@ResponseBody
		@RequestMapping(value = "now/change" )
		public ArrayList<MainDto> getNowChange(String type) throws Exception {
			
			ArrayList<MainDto> fileNames = new ArrayList<>(); 
			
			fileNames = playService.getNowChange(type);

			return fileNames;

		}

		@ResponseBody
		@RequestMapping(value = "now/getNextPoster" )
		public ArrayList<MainDto> getNowNextPoster(String stNum, String index) throws Exception {
			
			ArrayList<MainDto> fileNames = new ArrayList<>(); 
			
			fileNames = playService.getNowNextPoster(stNum,index);

			return fileNames;
		}
	
	
	
	
// 상영예정작	
	@RequestMapping(value = "/come")
	public String playMain(Model model) {

		playService.playMain(model);
		return "play/playlist";

	}
	
//	@ResponseBody
//	@RequestMapping(value = "come/change" )
//	public ArrayList<MainDto> getChange(String type) throws Exception {
//		
//		ArrayList<MainDto> fileNames = new ArrayList<>(); 
//		
//		fileNames = playService.getChange(type);
//
//		return fileNames;
//
//	}

	@ResponseBody
	@RequestMapping(value = "come/change" )
	public ArrayList<MainDto> getChange(String type) throws Exception {
	   
		ArrayList<MainDto> fileNames = new ArrayList<>(); 
		
		fileNames = playService.getChange(type);

		return fileNames;

	}
	
	@ResponseBody
	@RequestMapping(value = "come/getNextPoster" )
	public ArrayList<MainDto> getNextPoster(String stNum, String index) throws Exception {
		
		ArrayList<MainDto> fileNames = new ArrayList<>(); 
		
		fileNames = playService.getNextPoster(stNum,index);

		return fileNames;
	}
	
	
//	상세페이지
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String getDetail(String mt20id, Model model,HttpSession session) throws Exception {
		
		playService.getDetail(mt20id, model,session);
		
		return "play/detailpage";
	}
	
	
//	좋아요 기능 내 추가를 할 시
	@ResponseBody
	@RequestMapping(value="/UpdateLikes")
	public int UpdateLikes(@RequestParam("id")String id, @RequestParam("mt20id")String mt20id,@RequestParam("changeVal")int changeVal) {
		System.out.println(mt20id+"-----------mt20id");
		return playService.UpdateLikes(id, mt20id, changeVal); 
	}
	
//	좋아요 기능 내 다시 삭제를 할 시
	
	@ResponseBody
	@RequestMapping(value="/DeleteLikes")
	public String DeleteLikes(@RequestParam("id")String id, @RequestParam("mt20id")String mt20id) {
		System.out.println(mt20id+"-----------mt20id");
		playService.DeleteLikes(id, mt20id);
		return "play/detailpage";
	}
	
//	검색	
	@RequestMapping(value="/searchform")
	public String searchform() {
		return "play/searchform";
	}
	
	
	@RequestMapping(value="/search")
	public String search(@RequestParam("keyword")String keyword,Model model) {
		
		playService.getsearch(keyword,model);
		
		return "play/search";
	}
	
	//지도 테스트
	@RequestMapping(value = "/address")
	public String playAddressTest() {

		
		return "play/addresstest";

	}
	
	
	@RequestMapping(value = "/result")
    public String MovieJSONMain(String la, String lo, Model model) {
         
            System.out.println("위도"+la);
            System.out.println("경도"+lo);
            playService.getNearMap(la,lo,model);
            
	return "play/nearmap";
	}
	

	
//	박스오피스 테스트뷰
	@RequestMapping(value = "/boxtest")
	public String boxOfficeMain(Model model) {

		playService.boxTest(model);
		
		return "play/boxtest2";

	}
	

	
//	테스트뷰
	@RequestMapping(value = "/listtest")
	public String listTest() {

		
		return "play/playingtest";

	}
	
	
	@ResponseBody
	@RequestMapping(value = "listtest/change" )
	public ArrayList<MainBoxofficeDto> getBoxChange(String type) throws Exception {
		
		ArrayList<MainBoxofficeDto> boxPosters = new ArrayList<>(); 
		
		boxPosters = playService.getBoxChange(type);

		return boxPosters;

	}
}
