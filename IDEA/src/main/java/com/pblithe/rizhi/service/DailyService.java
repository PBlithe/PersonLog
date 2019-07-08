package com.pblithe.rizhi.service;

import com.pblithe.rizhi.model.Daily;

import java.util.List;

public interface DailyService {

    public void createDaily(Daily daily);

    public List<Daily> findDailyList(Integer user_id);

    public void deleteDaily(Integer id);

    public List<Daily> findFriendDaily(Integer user_id);

    public void updateDaily(Daily daily);

    public int findUser_id(Integer daily_id);

}
