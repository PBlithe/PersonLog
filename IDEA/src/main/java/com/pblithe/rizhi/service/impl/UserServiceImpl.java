package com.pblithe.rizhi.service.impl;

import com.pblithe.rizhi.dao.UserDao;
import com.pblithe.rizhi.model.User;
import com.pblithe.rizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User findUser(String usercode, String password){
        User user = this.userDao.findUser(usercode, password);
        return user;
    }
    @Override
    public String findUserName(Integer user_id) {
        String user = this.userDao.findUserName(user_id);
        return user;
    }
    @Override
    public String findUserPicture(Integer user_id) {
        String user = this.userDao.findUserPicture(user_id);
        return user;
    }
    @Override
    public void addUser(String usercode, String password) {
         userDao.addUser(usercode, password);
    }
}
