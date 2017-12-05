package com.pknu.pass.comment.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.pknu.pass.comment.dao.CommentDao;
import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.play.dto.DetailDto;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentDao commentDao;

	List<CommentDto> commentList;
	List<DetailDto> detailList;
	HashMap<String, Integer> paramMap;

	
	@Override
	public List<CommentDto> getComments(String mt20id) {
	

		return commentDao.getComments(mt20id);
	}

	@Override
	public void insertComment(CommentDto comment) {
		commentDao.insertComment(comment);			
	}

	
	

}