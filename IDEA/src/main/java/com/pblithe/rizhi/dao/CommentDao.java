package com.pblithe.rizhi.dao;

import com.pblithe.rizhi.model.Comment;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CommentDao {

    @Insert("insert into comments(daily_id,user_name,user_id,com_detail)values(#{daily_id},#{user_name},#{user_id},#{com_detail})")
    public void addComment(Comment comment);
    @Select("select * from comments where daily_id = #{daily_id} order by id")
    public List<Comment> findComments(Integer daily_id);
    @Delete("delete from comments where daily_id=#{daily_id}")
    public void deleteComment(Integer daily_id);

}
