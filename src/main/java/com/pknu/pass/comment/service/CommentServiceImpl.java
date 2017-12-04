package com.pknu.pass.comment.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.pknu.pass.comment.dao.CommentDao;
import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.common.util.Page;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentDao commentDao;

	@Autowired
	Page page;

	List<CommentDto> commentList;
	HashMap<String, Integer> paramMap;

	
	@Override
	public List<CommentDto> getComments(String mt20id) {
		
		HashMap<String, String> commentMap = new HashMap<>();
		commentMap.put("mt20id", mt20id);
		System.out.println(commentDao.getComments(commentMap));
		return commentDao.getComments(commentMap);
	}

	@Override
	public void insertComment(CommentDto comment) {
		System.out.println(comment.getMt20id());
		commentDao.insertComment(comment);			
	}

	
	

}
