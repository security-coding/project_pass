package com.pknu.pass.comment.dao;

import java.util.HashMap;
import java.util.List;

import com.pknu.pass.comment.dto.CommentDto;

public interface CommentDao {
	public List<CommentDto> getComments(HashMap<String,String> commentMap);
	public void insertComment(CommentDto comment);
}
