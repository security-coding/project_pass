package com.pknu.pass.comment.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.pass.comment.dao.CommentDao;
import com.pknu.pass.comment.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentDao commentDao;

	@Override
	public List<CommentDto> getComments(int mt20id, int commentRow) {
		HashMap<String, Integer> commentMap = new HashMap<>();
		commentMap.put("mt20id", mt20id);
		commentMap.put("commentRow", commentRow);		
		return commentDao.getComments(commentMap);
	}

	@Override
	public void insertComment(CommentDto comment) {
		commentDao.insertComment(comment);			
	}
	
	

}
