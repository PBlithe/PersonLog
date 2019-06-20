package com.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.core.po.Message;

public interface MessageDao {
    
    public List<Message> findMessagesByOwner_id(@Param("owner_id")Integer owner_id,@Param("sendto") Integer sendto);
    
    public int addMessage(Message message);
}
