package com.pblithe.rizhi.dao;

import com.pblithe.rizhi.model.Daily;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface DailyDao {
    @Insert("insert into rizhidaily_author,daily_details,daily_createtime,user_id,daily_picture,privacy)values(#{daily_author},#{daily_details},#{daily_createtime},#{user_id},#{daily_picture},#{privacy})")
    public void createDaily(Daily dadily);
    @Select("select * from rizhi where user_id = #{user_id} order by daily_id desc")
    public List<Daily> selectDailyList(Integer user_id);
    @Delete("delete from rizhi where daily_id=#{id}")
    void deleteDaily(Integer id);
    @Select("select * from rizhi where user_id = #{user_id} and privacy = '0' order by daily_id desc")
    public List<Daily> findFriendDaily(Integer user_id);
    @Update("update rizhi SET daily_details = #{daily_details} where daily_id = #{daily_id}")
    public void updateDaily(Daily daily);
    @Select("select user_id from rizhi where daily_id = #{daily_id}")
    public int findUser_id(Integer daily_id);
}
