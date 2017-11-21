package com.pknu.pass.comment.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray; 
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.comment.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	List<CommentDto> commentList=null;

	@RequestMapping(value="/commentRead.comment")
	@ResponseBody
	public List<CommentDto> commentRead(@RequestParam int mt20id, 
										@RequestParam int commentRow){							
		return commentService.getComments(mt20id,commentRow);	
		
	}
	 
	@RequestMapping(value="/commentWrite.comment")
	public @ResponseBody HashMap<String, Object> commentWrite(CommentDto comment, 
															   HttpSession session){
		comment.setId((String)session.getAttribute("id"));
		commentService.insertComment(comment);
		commentList=commentService.getComments(comment.getMt20id(),10);
		
//		해쉬맵으로 객체생성해서 <키(스트링), 오브젝트> 형식으로 저장하고 jsp페이지에 해쉬맵을 리턴한다. 
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("result", 1);
		hm.put("commentList", commentList);
		return hm;		
		
	}
	
	
}
