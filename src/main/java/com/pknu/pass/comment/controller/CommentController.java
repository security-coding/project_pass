package com.pknu.pass.comment.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.comment.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	CommentService commentService;
	List<CommentDto> commentList=null;

	
	@RequestMapping(value="/read")
	@ResponseBody
	public List<CommentDto> commentRead(@RequestParam String mt20id ){							
		return commentService.getComments(mt20id);	
	}
	 
	
	@RequestMapping(value="/write")
	@ResponseBody
	public HashMap<String, Object> commentWrite(CommentDto comment){
		System.out.println(comment.toString());
//		comment.setCommentContent();
//		comment.setId((String)session.getAttribute("id"));
		commentService.insertComment(comment);
		commentList=commentService.getComments(comment.getMt20id());
		System.out.println(commentList);
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("result", 1);
		hm.put("commentList", commentList);
		return hm;
		
	}
	

	
}
