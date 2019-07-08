package com.pblithe.rizhi.service.impl;

import com.pblithe.rizhi.dao.CommentDao;
import com.pblithe.rizhi.model.Comment;
import com.pblithe.rizhi.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;
    @Override
    public void addComment(Comment comment) {
        // TODO Auto-generated method stub
        commentDao.addComment(comment);
    }
    @Override
    public List<Comment> findComments(Integer daily_id) {
        // TODO Auto-generated method stub
        return commentDao.findComments(daily_id);
    }
    @Override
    public void deleteComment(Integer daily_id) {
        // TODO Auto-generated method stub
        commentDao.deleteComment(daily_id);
    }
}
