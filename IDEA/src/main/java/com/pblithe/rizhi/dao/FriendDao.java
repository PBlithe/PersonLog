package com.pblithe.rizhi.dao;

import com.pblithe.rizhi.model.Friend;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface FriendDao {

    @Select("select * from friends where owner_id = #{owner_id}")
    public List<Friend> selectFriendList(Integer owner_id);

    @Insert("insert into response(zhudong_id,beidong_id)values(#{USER_SESSION.user_id},#{user.user_id})")
    public	void addUser(Integer id);

    @Insert("insert into addfriend(from_id,to_id,agree)values(#{from_id},#{to_id},'0')")
    public void addFriendRequest(@Param("from_id") Integer from_id, @Param("to_id") Integer to_id);

    @Select("select from_id from addfriend where to_id = #{to_id} and agree = '0';")
    public List<Integer> findFriendRequest(Integer to_id);

    @Delete("delete from addfriend where from_id=#{from_id}")
    public void deleteFriendRequest(Integer from_id);

    @Insert("insert into friends(owner_id,friend_id)values( #{owner_id},#{friend_id})")
    public void addFriend(@Param("owner_id")Integer owner_id,@Param("friend_id")Integer friend_id);
}
