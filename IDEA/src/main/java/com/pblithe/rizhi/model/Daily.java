package com.pblithe.rizhi.model;

import javax.persistence.Entity;
import java.util.Date;
import java.util.List;

@Entity
public class Daily {

    private Integer daily_id;      //用户id
    private String daily_details;     //用户账号
    private String daily_author;     //用户名称
    private Date daily_createtime; //用户密码
    private Integer user_id;
    private String daily_picture;//用户头像
    private String privacy;
    private List<Comment> comments;

    public Integer getDaily_id() {
        return daily_id;
    }

    public void setDaily_id(Integer daily_id) {
        this.daily_id = daily_id;
    }

    public String getDaily_details() {
        return daily_details;
    }

    public void setDaily_details(String daily_details) {
        this.daily_details = daily_details;
    }

    public String getDaily_author() {
        return daily_author;
    }

    public void setDaily_author(String daily_author) {
        this.daily_author = daily_author;
    }

    public Date getDaily_createtime() {
        return daily_createtime;
    }

    public void setDaily_createtime(Date daily_createtime) {
        this.daily_createtime = daily_createtime;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getDaily_picture() {
        return daily_picture;
    }

    public void setDaily_picture(String daily_picture) {
        this.daily_picture = daily_picture;
    }

    public String getPrivacy() {
        return privacy;
    }

    public void setPrivacy(String privacy) {
        this.privacy = privacy;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
