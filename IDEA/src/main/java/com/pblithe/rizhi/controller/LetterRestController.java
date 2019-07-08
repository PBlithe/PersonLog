package com.pblithe.rizhi.controller;

import com.pblithe.rizhi.model.Message;
import com.pblithe.rizhi.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.Date;

@RestController
public class LetterRestController {
    @Autowired
    MessageService messageService;
    @ResponseBody
    @RequestMapping(value="/letter/add.action",method= RequestMethod.POST)
    public Message addMessage(@RequestBody Message message) {
        Date date = new Date();
        Message msg = new Message();
        msg.setSender(message.getSender());
        msg.setReceiver(message.getReceiver());
        msg.setOwner_id(message.getSendto());
        msg.setDetails(message.getDetails());
        msg.setSendto(message.getOwner_id());
        // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
        Timestamp timeStamp = new Timestamp(date.getTime());
        message.setTime(timeStamp);

        msg.setSender(message.getSender());
        msg.setReceiver(message.getReceiver());
        msg.setOwner_id(message.getSendto());
        msg.setDetails(message.getDetails());
        msg.setSendto(message.getOwner_id());
        msg.setTime(message.getTime());

        messageService.addMessage(message);
        messageService.addMessage(msg);
        return message;
    }
}
