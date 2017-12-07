package com.pknu.pass.comment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pknu.pass.comment.dto.CommentDto;

public interface CommentDao {
	public List<CommentDto> getComments(Map<String, Object> paramMap);
	public void insertComment(CommentDto comment);
	public int getTotalComments(Map<String, Object> paramMap);
}
	