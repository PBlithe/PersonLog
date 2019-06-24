package com.core.web.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.utils.MD5Util;
import com.core.po.Daily;
import com.core.po.Friend;
import com.core.po.User;
import com.core.service.DailyService;
import com.core.service.FriendService;
import com.core.service.UserService;

@Controller
public class RegisterController {
    @Autowired
    UserService userService;
    @Autowired
    DailyService dailyService;
    @Autowired
    FriendService friendService;
    
    @RequestMapping("/add/register.action")
	public String register(Model model,HttpSession session,String usercode,String password) {
	//System.out.println(usercode);
	//System.out.println(password);
	String p = MD5Util.encrypt(password);
	int rows = userService.addUser(usercode, p);
	if(rows>0) {
	    User user = userService.findUser(usercode, p);
	    session.setAttribute("USER_SESSION", user);
	        List<Daily> dailyList = dailyService.findDailyList(user.getUser_id());
	        List<Friend> friendList = friendService.findFriendList(user.getUser_id());
	        for(int i=0;i<friendList.size();i++) {
	            List<Daily> daily = dailyService.findFriendDaily(friendList.get(i).getFriend_id());
	            dailyList.addAll(daily);
	        }
	        Collections.sort(dailyList, new Comparator<Daily>(){
	            public int compare(Daily d1, Daily d2) {
	                if(d1.getDaily_id() < d2.getDaily_id()){
	                    return 1;
	                }
	                if(d1.getDaily_id() == d2.getDaily_id()){
	                    return 0;
	                }
	                return -1;
	            }
	        });
	        model.addAttribute("dailyList",dailyList);
		// 将用户对象添加到Session
		session.setAttribute("USER_SESSION", user);
		// 跳转到主页面
	    return "home"; 
	}
	    return "register";
	}
    @RequestMapping("/register.action")
    public String register() {
	return "register";
    }
}
