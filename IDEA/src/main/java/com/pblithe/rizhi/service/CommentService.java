package com.pblithe.rizhi.service;

import com.pblithe.rizhi.model.Comment;

import java.util.List;

public interface CommentService {

    public void addComment(Comment comment);

    public List<Comment> findComments(Integer daily_id);

    public void deleteComment(Integer daily_id);
}
