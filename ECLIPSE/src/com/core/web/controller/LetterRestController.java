package com.core.web.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.core.po.Daily;
import com.core.po.Message;
import com.core.service.MessageService;

@RestController
public class LetterRestController {
    @Autowired
    MessageService messageService;
    @ResponseBody
    @RequestMapping(value="/letter/add.action",method=RequestMethod.POST)
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
