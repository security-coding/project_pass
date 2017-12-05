package com.pknu.pass.comment.service;

import java.util.List;

import org.springframework.ui.Model;

import com.pknu.pass.comment.dto.CommentDto;

public interface CommentService {
	
	public List<CommentDto> getComments(String mt20id);
	public void insertComment(CommentDto comment);

}