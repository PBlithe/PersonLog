package com.core.web.controller;
import com.common.utils.MD5Util;
import com.core.po.Comment;
import com.core.po.Daily;
import com.core.po.Friend;
import com.core.po.User;
import com.core.service.CommentService;
import com.core.service.DailyService;
import com.core.service.FriendService;
import com.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;
/**
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	@Autowired
	private DailyService dailyService;
	@Autowired
	private FriendService friendService;
	@Autowired
	private CommentService commentService;
	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode,String password, Model model, 
                                                          HttpSession session) {
	    
		// 通过账号和密码查询用户
	    	String p = MD5Util.encrypt(password);
		User user = userService.findUser(usercode, p);
		if(user != null){	
		    	// 将用户对象添加到Session
		 	session.setAttribute("USER_SESSION", user);
		        List<Daily> dailyList = dailyService.findDailyList(user.getUser_id());
		        model.addAttribute("dailyCount", dailyList.size());
		        List<Friend> friendList = friendService.findFriendList(user.getUser_id());
		        for(int i=0;i<friendList.size();i++) {
		            List<Daily> daily = dailyService.findFriendDaily(friendList.get(i).getFriend_id());
		            dailyList.addAll(daily);
		        }
		        Collections.sort(dailyList, new Comparator<Daily>(){
		            /*
		             * int compare(Person p1, Person p2) 返回一个基本类型的整型，
		             * 返回负数表示：p1 小于p2，
		             * 返回0 表示：p1和p2相等，
		             * 返回正数表示：p1大于p2
		             */
		            public int compare(Daily d1, Daily d2) {
		                //按照Person的年龄进行升序排列
		                if(d1.getDaily_id() < d2.getDaily_id()){
		                    return 1;
		                }
		                if(d1.getDaily_id() == d2.getDaily_id()){
		                    return 0;
		                }
		                return -1;
		            }
		        });
		        for(int i=0;i<dailyList.size();i++) {
		            List<Comment> comments = commentService.findComments(dailyList.get(i).getDaily_id());
		            dailyList.get(i).setComments(comments);
		        }
		        model.addAttribute("dailyList",dailyList);
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			
			model.addAttribute("friendCount", friendList.size());
			// 跳转到主页面
		    return "home"; 
			//return "redirect:student/daily/list.action";   //有输出查询内容
			//return "redirect:manage/list.action";   //有输出查询内容
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	
	
	
	/**
	 * 模拟其他类中跳转到客户管理页面的方法
	 */
	@RequestMapping(value = "/toStudent.action")
	public String toStudent() {
	    return "student";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	
}
