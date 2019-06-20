package com.core.service;
import java.util.List;

import com.core.po.User;
/**
 * 用户Service层接口
 */
public interface UserService {
	// 通过账号和密码查询用户
	public User findUser(String usercode,String password);
	
	public String findUserName(Integer user_id);
	
	public String findUserPicture(Integer user_id);
}
