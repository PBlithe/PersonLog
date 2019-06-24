package com.core.dao;

import java.util.List;

import com.core.po.Comment;

public interface CommentDao {
    public int addComment(Comment comment);
    
    public List<Comment> findComments(Integer daily_id);
    
    public int deleteComment(Integer daily_id);
}
