package com.pblithe.rizhi.model;

import javax.persistence.Entity;

@Entity
public class Comment {

    private Integer id;
    private Integer daily_id;
    private String user_name;
    private Integer user_id;
    private String com_detail;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDaily_id() {
        return daily_id;
    }

    public void setDaily_id(Integer daily_id) {
        this.daily_id = daily_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getCom_detail() {
        return com_detail;
    }

    public void setCom_detail(String com_detail) {
        this.com_detail = com_detail;
    }
}
