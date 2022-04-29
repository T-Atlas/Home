package com.g65.service.user;

import com.g65.entity.UserEntity;

/**
 * @author LianJunhong
 */
public interface UserService {
    public UserEntity login(int userId, String userPassword);

    public boolean updatePassword(int userId, String userPassword);

    public UserEntity informationCheck(int userId);

    public String userRegister(int userId, String userName, String userPassword, int userAge, String userEmail, String userTel, int userRoom);

    public boolean updateInfo(int userId, String userName, String userPassword, int userAge, String userEmail, String userTel, int userRoom);
}
