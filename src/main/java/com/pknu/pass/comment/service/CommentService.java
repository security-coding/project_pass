package com.pknu.pass.comment.service;

import java.util.List;

import com.pknu.pass.comment.dto.CommentDto;

public interface CommentService {
	
	public List<CommentDto> getComments(int mt20id, int commentRow);
	public void insertComment(CommentDto comment);
}
