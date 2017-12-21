package com.pknu.pass.comment.service;

import com.pknu.pass.comment.dto.CommentDto;

import java.util.List;
import java.util.Map;


public interface CommentService {
    List<CommentDto> getComments(Map<String, Object> paramMap);

    void insertComment(CommentDto comment);

    int getTotalComments(Map<String, Object> paramMap);

    void deleteComment(int commentNum);

}