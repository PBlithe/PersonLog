package com.core.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.core.po.Friend;
import com.core.po.User;

public interface FriendDao {
    

	
	//好友列表
	public List<Friend> selectFriendList(Integer owner_id);
	 
	
	// 删除公告
	public	int addUser(Integer id);
	
	public int addFriendRequest(@Param("from_id") Integer from_id,@Param("to_id") Integer to_id);
	
	public List<Integer> findFriendRequest(Integer to_id);
	
	public int deleteFriendRequest(Integer from_id);
	
	public int addFriend(@Param("owner_id")Integer owner_id,@Param("friend_id")Integer friend_id);
}
