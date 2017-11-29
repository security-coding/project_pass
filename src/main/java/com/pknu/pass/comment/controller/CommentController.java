package com.pknu.pass.comment.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public List<CommentDto> commentRead(@RequestParam int mt20id, 
										@RequestParam int commentRow){							
		return commentService.getComments(mt20id,commentRow);	
		
	}
	 
	@RequestMapping(value="/write")
	public @ResponseBody HashMap<String, Object> commentWrite(String commentContent,CommentDto comment, 
													   HttpSession session){
		System.out.println(commentContent +" "+comment.toString());
		comment.setCommentContent(commentContent);
//		comment.setId((String)session.getAttribute("id"));
		commentService.insertComment(comment);
		commentList=commentService.getComments(comment.getMt20id(),10);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("result", 1);
		hm.put("commentList", commentList);
		return hm;
		
	}
	
	@RequestMapping(value = "/replyForm")
	private String replyForm(@RequestParam String pageNum, CommentDto mt20id) {
//		model.addAttribute("depth", mt20id.getDepth());
//		model.addAttribute("groupId", mt20id.getGroupId());
		return "replyForm";
	}

	@RequestMapping(value = "/reply")
	public String reply(CommentDto mt20id, HttpSession session, @RequestParam String pageNum) {
		mt20id.setId((String) session.getAttribute("id"));
		commentService.replyComment(mt20id);
		return "redirect:/list.bbs?pageNum=" + pageNum;
	}
	

	
}
