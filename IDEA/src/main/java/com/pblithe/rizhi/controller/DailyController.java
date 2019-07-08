package com.pblithe.rizhi.controller;

import com.pblithe.rizhi.model.Comment;
import com.pblithe.rizhi.model.Daily;
import com.pblithe.rizhi.model.Friend;
import com.pblithe.rizhi.model.User;
import com.pblithe.rizhi.service.CommentService;
import com.pblithe.rizhi.service.DailyService;
import com.pblithe.rizhi.service.FriendService;
import com.pblithe.rizhi.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.*;

@Controller
public class DailyController {
    @Autowired
    private DailyService dailyService;
    @Autowired
    private UserService userService;
    @Autowired
    private FriendService friendService;
    @Autowired
    private CommentService commentService;

    /**
     * 创建日志
     */
    @RequestMapping("/daily/create.action")
    @ResponseBody
    public String dailyCreate(@RequestBody Daily daily, HttpSession session) {
        User user = (User) session.getAttribute("USER_SESSION");
        // 将当前用户id存储在公告对象中
        daily.setDaily_author(user.getUser_name());
        daily.setUser_id(user.getUser_id());
        daily.setDaily_picture(user.getDaily_picture());
        // 创建Date对象
        Date date = new Date();
        // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
        Timestamp timeStamp = new Timestamp(date.getTime());
        daily.setDaily_createtime(timeStamp);
        // 执行Service层中的创建方法，返回的是受影响的行数
        dailyService.createDaily(daily);
        return "OK";
    }



    /*	     查询日志*/
    @RequestMapping(value = "/daily/list.action")
    public String list(Model model, HttpSession session){
        User user = (User) session.getAttribute("USER_SESSION");
        List<Daily> dailyList = dailyService.findDailyList(user.getUser_id());
        model.addAttribute("dailyCount", dailyList.size());
        List<Friend> friendList = friendService.findFriendList(user.getUser_id());

        for(int i=0;i<friendList.size();i++) {
            List<Daily> daily = dailyService.findFriendDaily(friendList.get(i).getFriend_id());
            dailyList.addAll(daily);
        }
        mysort(dailyList);
        for(int i=0;i<dailyList.size();i++) {
            List<Comment> comments = commentService.findComments(dailyList.get(i).getDaily_id());
            dailyList.get(i).setComments(comments);
        }
        model.addAttribute("dailyList",dailyList);
        model.addAttribute("friendCount", friendList.size());
        return "home";
    }


    /**
     * 删除日志
     */
    @RequestMapping("/daily/delete.action")
    @ResponseBody
    public String dailyDelete(Integer id) {
        dailyService.deleteDaily(id);
        return "OK";
    }
    @RequestMapping("/notice.action")
    @ResponseBody
    public List<User> notice(HttpSession session) {
        //System.out.println("tttt");
        User user = (User)session.getAttribute("USER_SESSION");
        List<Integer> requestList = friendService.findFriendRequest(user.getUser_id());
        List<User> userList = new ArrayList<User>();
        for(int i=0;i<requestList.size();i++) {
            User u = new User();
            u.setUser_name(userService.findUserName(requestList.get(i)));
            u.setUser_id(requestList.get(i));
            userList.add(u);
        }
        return userList;
    }
    @RequestMapping("/read.action")
    @ResponseBody
    public boolean read(HttpSession session) {
        User user = (User)session.getAttribute("USER_SESSION");
        List<Integer> requestList = friendService.findFriendRequest(user.getUser_id());
        if(requestList != null) {
            for(int i=0;i<requestList.size();i++) {
                friendService.deleteFriendRequest(requestList.get(i));
            }
            return true;
        }
        return false;
    }

    @RequestMapping("/comment.action")
    @ResponseBody
    public Comment comment(HttpSession session, @Param("daily_id")String daily_id, @Param("com_detail")String com_detail) {
        System.out.println(daily_id);
        System.out.println(com_detail);
        User user = (User)session.getAttribute("USER_SESSION");
        Comment com = new Comment();
        Integer d = Integer.parseInt(daily_id);
        com.setDaily_id(d);
        com.setCom_detail(com_detail);
        com.setUser_id(user.getUser_id());
        com.setUser_name(user.getUser_name());
        commentService.addComment(com);
        return com;
    }

    @RequestMapping("daily/{daily_id}/delete.action")
    public String deleteDaily(Model model,HttpSession session,@PathVariable Integer daily_id) {
        User user = (User) session.getAttribute("USER_SESSION");
        if(user.getUser_id()==dailyService.findUser_id(daily_id)) {
            dailyService.deleteDaily(daily_id);
            commentService.deleteComment(daily_id);
        }
        List<Daily> dailyList = dailyService.findDailyList(user.getUser_id());
        model.addAttribute("dailyCount", dailyList.size());
        List<Friend> friendList = friendService.findFriendList(user.getUser_id());

        for(int i=0;i<friendList.size();i++) {
            List<Daily> daily = dailyService.findFriendDaily(friendList.get(i).getFriend_id());
            dailyList.addAll(daily);
        }
        mysort(dailyList);
        for(int i=0;i<dailyList.size();i++) {
            List<Comment> comments = commentService.findComments(dailyList.get(i).getDaily_id());
            dailyList.get(i).setComments(comments);
        }
        model.addAttribute("dailyList",dailyList);
        model.addAttribute("friendCount", friendList.size());
        return "home";
    }

    @RequestMapping("daily/update.action")
    @ResponseBody
    public boolean updateDaily(HttpSession session, @Param("daily_id") String daily_id, @Param("daily_details") String daily_details) {
        System.out.println("ssss");
        Daily daily =new Daily();
        Integer d = Integer.parseInt(daily_id);
        daily.setDaily_id(d);
        daily.setDaily_details(daily_details);
        dailyService.updateDaily(daily);
        return true;
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
