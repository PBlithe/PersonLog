package com.core.service;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.utils.Page;
import com.core.po.Friend;
import com.core.po.User;

public interface FriendService {
	
	
	// 查询好友列表
	public List<Friend> findFriendList(Integer owner_id);
		
	// 添加好友
	public int addUser(Integer id);
	
	public int addFriendRequest(Integer from_id, Integer to_id);
	
	public List<Integer> findFriendRequest(Integer to_id);
	
	public int deleteFriendRequest(Integer to_id);
	
	public int addFriend(Integer owner_id,Integer friend_id);
}
