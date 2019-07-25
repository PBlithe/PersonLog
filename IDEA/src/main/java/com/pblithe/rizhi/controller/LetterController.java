package com.pblithe.rizhi.controller;

import com.pblithe.rizhi.model.Friend;
import com.pblithe.rizhi.model.Message;
import com.pblithe.rizhi.model.User;
import com.pblithe.rizhi.service.FriendService;
import com.pblithe.rizhi.service.MessageService;
import com.pblithe.rizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

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
            friendList.get(i).setFriendPicture("/img/"+userpicture);
        }
        model.addAttribute("friendList",friendList);
        return "letter";
    }

    @RequestMapping("/letter/{sendto}/message.action")
    public String message(Model model, HttpSession session, @PathVariable Integer sendto){
        User user = (User) session.getAttribute("USER_SESSION");
        Integer owner_id = user.getUser_id();
        List<Friend> friendList = friendService.findFriendList(owner_id);
        for(int i=0;i<friendList.size();i++) {

            String username = userService.findUserName(friendList.get(i).getFriend_id());
            String userpicture = userService.findUserPicture(friendList.get(i).getFriend_id());
            friendList.get(i).setFriendName(username);
            friendList.get(i).setFriendPicture("/img/"+userpicture);
        }
        String friendPicture = userService.findUserPicture(sendto);
        model.addAttribute("friendPicture","/img/"+friendPicture);
        model.addAttribute("friendList",friendList);
        List<Message> messages = messageService.findMessages(owner_id,sendto);
        model.addAttribute("messages",messages);
        model.addAttribute("sendto",sendto);
        String mypicture = "/img/"+user.getDaily_picture();
        model.addAttribute("mypicture",mypicture);
        return "letter";
    }
}
