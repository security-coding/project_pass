package com.pknu.pass.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pass.comment.dto.CommentDto;
import com.pknu.pass.comment.service.CommentService;
import com.pknu.pass.common.dto.PagingDto;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/read")
    @ResponseBody
    public Map<String, Object> commentRead(String mt20id, int index, int pageStartNum) {
        Map<String, Object> resultMap = new HashMap<>();
        Map<String, Object> paramMap = new HashMap<>();

        PagingDto paging = new PagingDto();
        paging.setIndex(index);
        paging.setPageStartNum(pageStartNum);

        paramMap.put("mt20id", mt20id);
        paramMap.put("p", paging);

        List<CommentDto> commentList = commentService.getComments(paramMap);
        paging.setTotal(commentService.getTotalComments(paramMap));

        resultMap.put("list", commentList);
        resultMap.put("p", paging);

        return resultMap;
    }


    @RequestMapping(value = "/write")
    @ResponseBody
    public void commentWrite(CommentDto comment, HttpSession session) {
        System.out.println(comment.getCommentContent());
        comment.setId((String) session.getAttribute("id"));
        commentService.insertComment(comment);
    }


    @RequestMapping(value = "/delete")
    @ResponseBody
    public void delete(int commentNum) {
        commentService.deleteComment(commentNum);
    }

}
