package com.pblithe.rizhi.service;

import com.pblithe.rizhi.model.Friend;

import java.util.List;

public interface FriendService {

    public List<Friend> findFriendList(Integer owner_id);

    public void addUser(Integer id);

    public void addFriendRequest(Integer from_id, Integer to_id);

    public List<Integer> findFriendRequest(Integer to_id);

    public void deleteFriendRequest(Integer to_id);

    public void addFriend(Integer owner_id,Integer friend_id);
}
