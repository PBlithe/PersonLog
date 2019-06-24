package com.core.service.impl;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.utils.Page;
import com.core.dao.DailyDao;
import com.core.po.Daily;
import com.core.service.DailyService;
/**
 * 公告管理
 */
@Service("dailyService")   /*一个类带了@Service注解，将自动注册到Spring容器，不需要再在applicationContext.xml文件定义bean了*/
@Transactional                /*声明式事务管理 编程中使用的注解*/
/*1，一般在service里加@Transactional注解，不建议在接口上添加，加了此注解后此类会纳入spring事务管理中，每个业务方法执行时，都会开启一个事务，不过都是按照相同的管理机制。
2，@Transactional注解只能应用到public修饰符上，其它修饰符不起作用，但不报错。
3，默认情况下此注解会对unchecked异常进行回滚，对checked异常不回滚。
*/
public class DailyServiceImpl implements DailyService {
	// 声明DAO属性并注入
	@Autowired
	private DailyDao dailyDao;
	
	
	/**
	 * 查询日志
	 */
	    public List<Daily> findDailyList(Integer user_id) {
	        List<Daily> list =dailyDao.selectDailyList(user_id);
	        return list;
	    }

	
	/**
	 * 创建日志
	 */
    @Override
	public int createDaily(Daily daily) {
	    return dailyDao.createDaily(daily);
	}
	
	/**
	 * 删除日志
	 */
	@Override
	public int deleteDaily(Integer id) {
	    return dailyDao.deleteDaily(id);	
	}


	@Override
	public List<Daily> findFriendDaily(Integer user_id) {
	    // TODO Auto-generated method stub
	    return dailyDao.findFriendDaily(user_id);
	}


	@Override
	public int updateDaily(Daily daily) {
	    // TODO Auto-generated method stub
	    return dailyDao.updateDaily(daily);
	}
	
}
