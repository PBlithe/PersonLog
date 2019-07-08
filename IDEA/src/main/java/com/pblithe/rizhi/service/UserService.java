package com.pblithe.rizhi.service;

import com.pblithe.rizhi.model.User;

public interface UserService {

    public User findUser(String usercode, String password);

    public String findUserName(Integer  user_id);

    public String findUserPicture(Integer user_id);

    public void addUser(String usercode,String password);

}
