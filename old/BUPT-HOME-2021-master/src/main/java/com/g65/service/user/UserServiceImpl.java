package com.g65.service.user;

import com.g65.dao.BaseDao;
import com.g65.dao.user.UserDao;
import com.g65.dao.user.UserDaoImpl;
import com.g65.entity.UserEntity;

import java.sql.Connection;

/**
 * @author LianJunhong
 */
public class UserServiceImpl implements UserService {


    /**
     * 引入Dao层
     */
    private UserDao userDao;

    public UserServiceImpl() {
        userDao = new UserDaoImpl();
    }

    @Override
    public UserEntity login(int userId, String userPassword) {
        Connection connection = null;
        UserEntity user = null;

        connection = BaseDao.getConnection();
        user = userDao.getLoginUser(connection, userId);

        BaseDao.closeResource(connection, null, null);

        if (user != null && userPassword.equals(user.getuPassword())) {
            return user;
        } else {
            return null;
        }
    }

    @Override
    public boolean updatePassword(int userId, String userPassword) {
        Connection connection = null;

        boolean flag = false;
        connection = BaseDao.getConnection();
        if (userDao.updatePassword(connection, userId, userPassword) > 0) {
            flag = true;
        }
        BaseDao.closeResource(connection, null, null);
        return flag;
    }

    @Override
    public UserEntity informationCheck(int userId) {
        Connection connection = BaseDao.getConnection();

        UserEntity user = userDao.getLoginUser(connection, userId);

        BaseDao.closeResource(connection, null, null);

        return user;
    }

    @Override
    public String userRegister(int userId, String userName, String userPassword, int userAge, String userEmail, String userTel, int userRoom) {

        Connection connection = BaseDao.getConnection();
        UserEntity user = userDao.getLoginUser(connection, userId);
        boolean flag;

        if (user == null) {
            flag = userDao.registerUser(connection, userId, userName, userPassword, userAge, userEmail, userTel, userRoom) > 0;
        } else {
            return "User ID has already exist";
        }
        if (flag) {
            return "Successful";
        } else {
            return "Error";
        }

    }

    @Override
    public boolean updateInfo(int userId, String userName, String userPassword, int userAge, String userEmail, String userTel, int userRoom) {
        Connection connection = null;

        boolean flag = false;
        connection = BaseDao.getConnection();

        if (userDao.updateUserName(connection, userId, userName) > 0 && userDao.updatePassword(connection, userId, userPassword) > 0
                && userDao.updateAge(connection, userId, userAge) > 0 && userDao.updateTel(connection, userId, userTel) > 0 && userDao.updateRoom(connection, userId, userRoom) > 0) {
            flag = true;
        }

        BaseDao.closeResource(connection, null, null);
        return flag;
    }
}
