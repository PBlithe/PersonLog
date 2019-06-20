package com.core.service;
import java.util.List;

import com.common.utils.Page;
import com.core.po.Daily;
public interface DailyService {
	
	public int createDaily(Daily daily);
	
	// 查询日志列表
	public List<Daily> findDailyList(Integer user_id);
		
	
	// 删除日志
		public int deleteDaily(Integer id);

	public List<Daily> findFriendDaily(Integer user_id);
}
