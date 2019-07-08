package com.pblithe.rizhi.service;

import com.pblithe.rizhi.model.Message;

import java.util.List;

public interface MessageService {

    public List<Message> findMessages(Integer owner_id,Integer sendto);

    public void addMessage(Message message);
}
