package com.pblithe.rizhi.controller;

import com.pblithe.rizhi.model.Friend;
import com.pblithe.rizhi.model.User;
import com.pblithe.rizhi.service.FriendService;
import com.pblithe.rizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class FriendController {
    @Autowired
    private FriendService friendService;
    @Autowired
    private UserService userService;



    /*查询好友*/
    @RequestMapping(value = "/friend/list.action")
    public String list(Model model,HttpSession session){
        List<Friend> friendList = (List<Friend>) session.getAttribute("friendList");
        List<String> userNameList = null;
        List<String> userPictureList = null;

        for(int i=0;i<friendList.size();i++) {
            String username = userService.findUserName(friendList.get(i).getOwner_id());
            String userpicture = userService.findUserName(friendList.get(i).getOwner_id());
            userNameList.add(username);
            userPictureList.add(userpicture);
        }
        model.addAttribute("userNameList",userNameList);
        model.addAttribute("userPictureList",userPictureList);
        return "letter";
    }


    /**
     * 添加好友
     */
    @RequestMapping("/friend/add.action")
    @ResponseBody
    public String friendAdd(Integer id) {
        friendService.addUser(id);
        return "OK";
    }


    @RequestMapping("/search.action")
    @ResponseBody
    public User searchFriend( String friend_id,Model model,HttpSession session) {

        //System.out.println(friend_id);
        Integer f = Integer.parseInt(friend_id);
        String searchUserName = userService.findUserName(f);
        String searchUserPicture = userService.findUserPicture(f);

        User user = new User();
        user.setUser_name(searchUserName);
        user.setDaily_picture(searchUserPicture);

        return user;
    }

    @RequestMapping("/addFriend.action")
    @ResponseBody
    public String addFriendRequest(String to_id, Model model, HttpSession session) {
        User user = (User)session.getAttribute("USER_SESSION");
        Integer t = Integer.parseInt(to_id);
        friendService.addFriendRequest(user.getUser_id(), t);
        return "TRUE";
    }

    @RequestMapping("/agree.action")
    @ResponseBody
    public String agree(String friend_id,HttpSession session) {

        Integer f = Integer.parseInt(friend_id);
        User user = (User) session.getAttribute("USER_SESSION");
        friendService.addFriend(user.getUser_id(),f);
        friendService.addFriend(f,user.getUser_id());
        return "TRUE";
    }
}
