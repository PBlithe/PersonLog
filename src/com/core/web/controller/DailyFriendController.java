package com.core.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.po.Friend;
import com.core.po.User;
import com.core.service.FriendService;
import com.core.service.UserService;

@Controller
public class DailyFriendController {
    	
    @Autowired
    public FriendService friendService;
    @Autowired
    public UserService userService;
    
    @RequestMapping("/dailyFriend.action")
    public String dailyFriend(Model model,HttpSession session) {
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
        	return "friends";
    }
    
    @RequestMapping("dailyFriend/{friend_id }/list.action")
    public String friendList(Model model,HttpSession session,@PathVariable Integer friend_id) {
	return null;
    }
}
