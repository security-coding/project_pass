package com.pknu.pass.comment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.pass.comment.dao.CommentDao;
import com.pknu.pass.comment.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;


    @Override
    public int getTotalComments(Map<String, Object> paramMap) {
        return commentDao.getTotalComments(paramMap);
    }

    @Override
    public List<CommentDto> getComments(Map<String, Object> paramMap) {
        return commentDao.getComments(paramMap);
    }

    @Override
    public void insertComment(CommentDto comment) {
        commentDao.insertComment(comment);
    }

    @Override
    public void deleteComment(int commentNum) {
        commentDao.deleteComment(commentNum);
    }


}