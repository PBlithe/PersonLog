package com.core.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.po.Friend;
import com.core.po.Message;
import com.core.po.User;
import com.core.service.FriendService;
import com.core.service.MessageService;
import com.core.service.UserService;

@Controller
public class LetterController {
    @Autowired
    private FriendService friendService;
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    
    @RequestMapping("/letter/list.action")
    public String letter(Model model,HttpSession session) {
	User user = (User) session.getAttribute("USER_SESSION");
	Integer owner_id = user.getUser_id();
	List<Friend> friendList = friendService.findFriendList(owner_id);
	for(int i=0;i<friendList.size();i++) {
	    
	    String username = userService.findUserName(friendList.get(i).getFriend_id());
	    String userpicture = userService.findUserPicture(friendList.get(i).getFriend_id());
	    friendList.get(i).setFriendName(username);
	    friendList.get(i).setFriendPicture(userpicture);
	}
        model.addAttribute("friendList",friendList);
	return "letter";
    }
    
    @RequestMapping("/letter/{sendto}/message.action")
    public String message(Model model,HttpSession session,@PathVariable Integer sendto){
	User user = (User) session.getAttribute("USER_SESSION");
	Integer owner_id = user.getUser_id();
	List<Friend> friendList = friendService.findFriendList(owner_id);
	for(int i=0;i<friendList.size();i++) {
	    
	    String username = userService.findUserName(friendList.get(i).getFriend_id());
	    String userpicture = userService.findUserPicture(friendList.get(i).getFriend_id());
	    friendList.get(i).setFriendName(username);
	    friendList.get(i).setFriendPicture(userpicture);
	}
	String friendPicture = userService.findUserPicture(sendto);
	model.addAttribute("friendPicture",friendPicture);
        model.addAttribute("friendList",friendList);
	List<Message> messages = messageService.findMessages(owner_id,sendto);
	model.addAttribute("messages",messages);
	model.addAttribute("sendto",sendto);
	return "letter";
    }
    
}
