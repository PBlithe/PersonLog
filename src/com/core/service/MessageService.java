package com.core.service;

import java.util.List;

import com.core.po.Message;

public interface MessageService {
    public List<Message> findMessages(Integer owner_id,Integer sendto);
    
    public int addMessage(Message message);
}
