package com.pknu.pass.comment.dao;


import java.util.List;
import java.util.Map;

import com.pknu.pass.comment.dto.CommentDto;

public interface CommentDao {
    List<CommentDto> getComments(Map<String, Object> paramMap);

    void insertComment(CommentDto comment);

    int getTotalComments(Map<String, Object> paramMap);

    void deleteComment(int commentNum);
}
	