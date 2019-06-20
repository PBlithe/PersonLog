package com.core.web.controller;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utils.Page;
import com.core.po.Daily;
import com.core.po.Friend;
import com.core.po.User;
import com.core.service.DailyService;
import com.core.service.FriendService;
import com.core.service.UserService;




@Controller
public class DailyController {
	// 依赖注入
	@Autowired
	private DailyService dailyService;
	@Autowired
	private UserService userService;
	@Autowired
	private FriendService friendService;

	/**
	 * 创建日志
	 */
	@RequestMapping("/daily/create.action")
	@ResponseBody
	public String dailyCreate(@RequestBody Daily daily,HttpSession session) {
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
	    int rows = dailyService.createDaily(daily);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	
	
/*	     查询日志*/
	    @RequestMapping(value = "/daily/list.action")
	    public String list(Model model,HttpSession session){
		User user = (User) session.getAttribute("USER_SESSION");
	        List<Daily> dailyList = dailyService.findDailyList(user.getUser_id());
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
	        model.addAttribute("dailyList",dailyList);
	        return "home";
	    }
	    
	    
	    /**
		 * 删除日志
		 */
	@RequestMapping("/daily/delete.action")
		@ResponseBody
		public String dailyDelete(Integer id) {
		    int rows = dailyService.deleteDaily(id);
		    if(rows > 0){			
		        return "OK";
		    }else{
		        return "FAIL";			
		    }
		} 
	    
	    
}
