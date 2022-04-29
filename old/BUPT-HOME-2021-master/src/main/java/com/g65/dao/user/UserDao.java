package com.g65.dao.user;

import java.sql.Connection;
import  com.g65.entity.UserEntity;

/**
 * @author LianJunhong
 */
public interface UserDao {
    public UserEntity getLoginUser(Connection connection,int userId);

    public int updateUserName(Connection connection, int userId, String userName);

    public int updatePassword(Connection connection, int userId, String userPassword);

    public int updateAge(Connection connection, int userId, int userAge);

    public int updateEmail(Connection connection, int userId, String userEmail);

    public int updateTel(Connection connection, int userId, String userTel);

    public int updateRoom(Connection connection, int userId, int userRoom);

    public int registerUser(Connection connection, int userId, String userName, String userPassword, int userAge, String userEmail, String userTel, int userRoom);
}
