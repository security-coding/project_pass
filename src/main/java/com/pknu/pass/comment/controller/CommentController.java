package com.pknu.pass.comment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public List<CommentDto> commentRead(@RequestParam String mt20id, @RequestParam int commentRow ){							
		return commentService.getComments(mt20id);	
	}
	 
	
	@RequestMapping(value="/write")
	@ResponseBody
	public List<CommentDto> commentWrite(CommentDto comment, HttpSession session){
		System.out.println(comment.getCommentContent());
		comment.setId((String)session.getAttribute("id"));
		commentService.insertComment(comment);
//		HashMap<String, Object> hm = new HashMap<>();
//		hm.put("result", 1);
//		hm.put("commentList", commentList);
//		System.out.println(commentService.getComments(comment.getMt20id()).toString());
		return commentService.getComments(comment.getMt20id());//
		
	}
	

	
}
