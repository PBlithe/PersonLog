package com.pblithe.rizhi.service.impl;

import com.pblithe.rizhi.dao.FriendDao;
import com.pblithe.rizhi.model.Friend;
import com.pblithe.rizhi.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("friendService")
@Transactional
public class FriendServiceImpl implements FriendService {

    @Autowired
    private FriendDao friendDao;

    public List<Friend> findFriendList(Integer owner_id) {
        List<Friend> list =friendDao.selectFriendList(owner_id);
        return list;
    }

    @Override
    public void addUser(Integer id) {
        friendDao.addUser(id);
    }

    @Override
    public void addFriendRequest(Integer from_id, Integer to_id) {
        // TODO Auto-generated method stub
        friendDao.addFriendRequest(from_id, to_id);
    }

    @Override
    public List<Integer> findFriendRequest(Integer to_id) {
        return friendDao.findFriendRequest(to_id);
    }

    @Override
    public void deleteFriendRequest(Integer to_id) {
        // TODO Auto-generated method stub
        friendDao.deleteFriendRequest(to_id);
    }

    @Override
    public void addFriend(Integer owner_id,Integer friend_id) {
        friendDao.addFriend(owner_id,friend_id);
    }
}
