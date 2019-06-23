package com.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.dao.CommentDao;
import com.core.po.Comment;
import com.core.service.CommentService;

/**
 * 公告管理
 */
@Service("commentService")   /*一个类带了@Service注解，将自动注册到Spring容器，不需要再在applicationContext.xml文件定义bean了*/
@Transactional                /*声明式事务管理 编程中使用的注解*/
/*1，一般在service里加@Transactional注解，不建议在接口上添加，加了此注解后此类会纳入spring事务管理中，每个业务方法执行时，都会开启一个事务，不过都是按照相同的管理机制。
2，@Transactional注解只能应用到public修饰符上，其它修饰符不起作用，但不报错。
3，默认情况下此注解会对unchecked异常进行回滚，对checked异常不回滚。
*/
public class CommentServiceImpl implements CommentService{

    @Autowired
    CommentDao commentDao;
    @Override
    public int addComment(Comment comment) {
	// TODO Auto-generated method stub
	return commentDao.addComment(comment);
    }
    @Override
    public List<Comment> findComments(Integer daily_id) {
	// TODO Auto-generated method stub
	return commentDao.findComments(daily_id);
    }

}
