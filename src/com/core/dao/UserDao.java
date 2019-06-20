package com.core.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.core.po.User;
/**
 * 用户DAO层接口
 */
public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("usercode") String usercode,@Param("password") String password);
	
	public String findUserPicture(Integer user_id);
	
	public String findUserName(Integer user_id);
}
