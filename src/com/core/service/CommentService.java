package com.core.service;

import java.util.List;

import com.core.dao.CommentDao;
import com.core.po.Comment;

public interface CommentService {
    
    public int addComment(Comment comment);
    
    public List<Comment> findComments(Integer daily_id);
    
}
