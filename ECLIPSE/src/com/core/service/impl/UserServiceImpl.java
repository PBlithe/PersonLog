package com.core.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.dao.UserDao;
import com.core.po.User;
import com.core.service.UserService;
/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;
	// 通过账号和密码查询用户
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}
	@Override
	public String findUserName(Integer user_id) {
	    String user = this.userDao.findUserName(user_id);
	    return user;
	}
	@Override
	public String findUserPicture(Integer user_id) {
	    String user = this.userDao.findUserPicture(user_id);
	    return user;
	}
	@Override
	public int addUser(String usercode, String password) {
	    return userDao.addUser(usercode, password);
	}
}
