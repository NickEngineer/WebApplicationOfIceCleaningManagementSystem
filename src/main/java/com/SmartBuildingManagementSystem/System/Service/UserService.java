package com.SmartBuildingManagementSystem.System.Service;

import com.SmartBuildingManagementSystem.System.DAO.UserDao;
import com.SmartBuildingManagementSystem.System.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    public boolean addNewUser(User newUser) {
        if (!"".equals(newUser.getLogin()) && !"".equals(newUser.getPassword()) && !"".equals(newUser.getRepeatPassword())) {
            return userDao.addNewUser(newUser);
        }
        return false;
    }

    public User getUserByLogin(String login) {
        return UserDao.getUserByLogin(login);
    }
}
