package com.pblithe.rizhi.dao;

import com.pblithe.rizhi.model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface UserDao {

    @Select("SELECT * FROM user  where user_code = #{usercode} and user_pswd =#{password}")
    public User findUser(@Param("usercode") String usercode, @Param("password") String password);

    @Select("select daily_picture from user where user_id = #{user_id}")
    public String findUserPicture(Integer user_id);

    @Select("select  user_name from user where user_id = #{user_id}")
    public String findUserName(Integer user_id);

    @Insert("insert into user(user_name,user_code,user_pswd,daily_picture)values('我在天南海北',t#{usercode},#{password},'head.png')")
    public void addUser(@Param("usercode")String usercode,@Param("password") String password);

}
