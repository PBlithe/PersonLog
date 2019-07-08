package com.pblithe.rizhi.service.impl;

import com.pblithe.rizhi.dao.DailyDao;
import com.pblithe.rizhi.model.Daily;
import com.pblithe.rizhi.service.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("dailyService")
@Transactional
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
    public void createDaily(Daily daily) {
        dailyDao.createDaily(daily);
    }

    /**
     * 删除日志
     */
    @Override
    public void deleteDaily(Integer id) {
        dailyDao.deleteDaily(id);
    }


    @Override
    public List<Daily> findFriendDaily(Integer user_id) {
        // TODO Auto-generated method stub
        return dailyDao.findFriendDaily(user_id);
    }


    @Override
    public void updateDaily(Daily daily) {
        // TODO Auto-generated method stub
        dailyDao.updateDaily(daily);
    }


    @Override
    public int findUser_id(Integer daily_id) {
        // TODO Auto-generated method stub
        return  dailyDao.findUser_id( daily_id);
    }
}
