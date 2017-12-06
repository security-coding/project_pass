package com.pknu.pass.comment.service;

import java.util.List;
import java.util.Map;

import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.common.dto.PagingDto;

public interface CommentService {
	public List<CommentDto> getComments(Map<String, Object> paramMap);
	public void insertComment(CommentDto comment);
	public int getTotalComments(Map<String, Object> paramMap);

}