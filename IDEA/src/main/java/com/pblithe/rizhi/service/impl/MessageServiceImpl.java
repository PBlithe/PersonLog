package com.pblithe.rizhi.service.impl;

import com.pblithe.rizhi.dao.MessageDao;
import com.pblithe.rizhi.model.Message;
import com.pblithe.rizhi.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageDao messageDao;
    @Override
    public List<Message> findMessages(Integer owner_id, Integer sendto) {
        List<Message> messages = messageDao.findMessagesByOwner_id(owner_id,sendto);
        return messages;
    }
    @Override
    public void addMessage(Message message) {
        messageDao.addMessage(message);
    }
}
