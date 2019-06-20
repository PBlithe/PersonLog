package com.core.dao;
import java.util.List;

import com.core.po.Daily;


public interface DailyDao {
    
	// 创建日志
	public int createDaily(Daily dadily);
	
	
	//日志列表
	public List<Daily> selectDailyList(Integer user_id);
	 
	
	// 删除公告
	int deleteDaily(Integer id);
	
	public List<Daily> findFriendDaily(Integer user_id);
}
