package com.pblithe.rizhi.controller;

import com.pblithe.rizhi.model.Comment;
import com.pblithe.rizhi.model.Daily;
import com.pblithe.rizhi.model.Friend;
import com.pblithe.rizhi.model.User;
import com.pblithe.rizhi.service.CommentService;
import com.pblithe.rizhi.service.DailyService;
import com.pblithe.rizhi.service.FriendService;
import com.pblithe.rizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DailyFriendController {
    @Autowired
    public FriendService friendService;
    @Autowired
    public UserService userService;
    @Autowired
    public DailyService dailyService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/dailyFriend.action")
    public String dailyFriend(Model model,HttpSession session) {
        User user = (User) session.getAttribute("USER_SESSION");
        Integer owner_id = user.getUser_id();
        List<Daily> dailyList = dailyService.findDailyList(user.getUser_id());
        List<Friend> friendList = friendService.findFriendList(owner_id);

        for(int i=0;i<friendList.size();i++) {
            String username = userService.findUserName(friendList.get(i).getFriend_id());
            String userpicture = userService.findUserPicture(friendList.get(i).getFriend_id());
            friendList.get(i).setFriendName(username);
            friendList.get(i).setFriendPicture(userpicture);
        }
        for(int i=0;i<friendList.size();i++){
            String picture_path = "img/"+friendList.get(i).getFriendPicture();
            friendList.get(i).setFriendPicture(picture_path);
        }
        model.addAttribute("friendList",friendList);
        model.addAttribute("dailyCount", dailyList.size());
        model.addAttribute("friendCount",friendList.size());
        String user_picture = "img/"+user.getDaily_picture();
        model.addAttribute("user_picture",user_picture);
        return "friends";
    }

    @RequestMapping("dailyFriend/{friend_id}/list.action")
    public String friendList(Model model,HttpSession session,@PathVariable Integer friend_id) {
        //System.out.println("成功");
        User user = (User) session.getAttribute("USER_SESSION");
        Integer owner_id = user.getUser_id();
        List<Daily> mydailyList = dailyService.findDailyList(user.getUser_id());
        List<Daily> dailyList = dailyService.findFriendDaily(friend_id);
        List<Friend> friendList = friendService.findFriendList(owner_id);

        for(int i=0;i<dailyList.size();i++){
            String picture_path = "/img/"+dailyList.get(i).getDaily_picture();
            dailyList.get(i).setDaily_picture(picture_path);
        }

        model.addAttribute("dailyList", dailyList);
        model.addAttribute("dailyCount", mydailyList.size());
        model.addAttribute("friendCount",friendList.size());
        String user_picture = "/img/"+user.getDaily_picture();
        model.addAttribute("user_picture",user_picture);
        return "friendList";
    }

    @RequestMapping("mylist.action")
    public String myList(Model model,HttpSession session) {
        User user = (User) session.getAttribute("USER_SESSION");
        List<Daily> mydailyList = dailyService.findDailyList(user.getUser_id());
        List<Friend> friendList = friendService.findFriendList(user.getUser_id());
        for(int i=0;i<mydailyList.size();i++) {
            List<Comment> comments = commentService.findComments(mydailyList.get(i).getDaily_id());
            mydailyList.get(i).setComments(comments);
        }
        model.addAttribute("myList", mydailyList);
        model.addAttribute("dailyCount", mydailyList.size());
        model.addAttribute("friendCount",friendList.size());
        String user_picture = "img/"+user.getDaily_picture();
        model.addAttribute("user_picture",user_picture);
        return "friendList";
    }

    @RequestMapping("mylist/{daily_id}/delete.action")
    public String deleteDaily(Model model, HttpSession session, @PathVariable Integer daily_id) {
        //System.out.println("我能成功的");
        dailyService.deleteDaily(daily_id);
        commentService.deleteComment(daily_id);
        User user = (User) session.getAttribute("USER_SESSION");
        List<Daily> mydailyList = dailyService.findDailyList(user.getUser_id());
        List<Friend> friendList = friendService.findFriendList(user.getUser_id());
        for(int i=0;i<mydailyList.size();i++) {
            List<Comment> comments = commentService.findComments(mydailyList.get(i).getDaily_id());
            mydailyList.get(i).setComments(comments);
        }
        model.addAttribute("myList", mydailyList);
        model.addAttribute("dailyCount", mydailyList.size());
        model.addAttribute("friendCount",friendList.size());
        return "friendList";
    }
}
