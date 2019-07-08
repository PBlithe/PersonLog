package com.pblithe.rizhi.dao;

import com.pblithe.rizhi.model.Message;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface MessageDao {

    @Select("select * from messages where owner_id = #{owner_id} and sendto = #{sendto} order by time")
    public List<Message> findMessagesByOwner_id(@Param("owner_id")Integer owner_id, @Param("sendto") Integer sendto);

    @Insert("insert into messages(sender,receiver,owner_id,details,time,sendto)values(#{sender},#{receiver},#{owner_id},#{details},#{time},#{sendto})")
    public void addMessage(Message message);
}
