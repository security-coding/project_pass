package com.pknu.pass.comment.service;

import java.util.List;
import java.util.Map;

import com.pknu.pass.comment.dto.CommentDto;


public interface CommentService {
    List<CommentDto> getComments(Map<String, Object> paramMap);

    void insertComment(CommentDto comment);

    int getTotalComments(Map<String, Object> paramMap);

    void deleteComment(int commentNum);

}