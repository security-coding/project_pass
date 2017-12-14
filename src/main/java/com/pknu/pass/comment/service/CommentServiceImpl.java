package com.pknu.pass.comment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.pknu.pass.comment.dao.CommentDao;
import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.common.dto.PagingDto;
import com.pknu.pass.play.dto.DetailDto;

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