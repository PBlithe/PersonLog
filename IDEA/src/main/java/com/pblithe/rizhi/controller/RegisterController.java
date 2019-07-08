package com.pblithe.rizhi.controller;

import com.pblithe.rizhi.model.Daily;
import com.pblithe.rizhi.model.Friend;
import com.pblithe.rizhi.model.User;
import com.pblithe.rizhi.service.DailyService;
import com.pblithe.rizhi.service.FriendService;
import com.pblithe.rizhi.service.UserService;
import com.pblithe.rizhi.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class RegisterController {
    @Autowired
    UserService userService;
    @Autowired
    DailyService dailyService;
    @Autowired
    FriendService friendService;

    @RequestMapping("/add/register.action")
    public String register(Model model, HttpSession session, String usercode, String password) {
        String p = MD5Util.encrypt(password);
        userService.addUser(usercode, p);
        User user = userService.findUser(usercode, p);
        session.setAttribute("USER_SESSION", user);
        List<Daily> dailyList = dailyService.findDailyList(user.getUser_id());
        List<Friend> friendList = friendService.findFriendList(user.getUser_id());
        for(int i=0;i<friendList.size();i++) {
            List<Daily> daily = dailyService.findFriendDaily(friendList.get(i).getFriend_id());
            dailyList.addAll(daily);
            mysort(dailyList);
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

    public void mysort(List dailyList){
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
    }
}
