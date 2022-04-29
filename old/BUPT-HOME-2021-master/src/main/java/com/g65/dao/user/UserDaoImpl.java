package com.g65.dao.user;

import com.g65.dao.BaseDao;
import com.g65.entity.UserEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author LianJunhong
 */
public class UserDaoImpl implements UserDao{
    @Override
    public UserEntity getLoginUser(Connection connection, int userId) {
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        UserEntity user = null;

        if(connection!=null){
            String sql = "SELECT * FROM myhome.user WHERE uid = ?";
            Object[] params = {userId};
            try {
                rs = BaseDao.execute(connection,sql, params,rs,pstmt);
                if(rs.next()){
                    user = new UserEntity();
                    user.setuId(rs.getInt("uid"));
                    user.setuPassword(rs.getString("upassword"));
                    user.setuName(rs.getString("uname"));
                    user.setuAge(rs.getInt("uage"));
                    user.setuEmail(rs.getString("uemail"));
                    user.setuTelephone(rs.getString("utel"));
                    user.setrId(rs.getInt("rid"));
                }
                BaseDao.closeResource(null,pstmt,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }

        return user;
    }

    @Override
    public int updateUserName(Connection connection, int userId, String userName) {
        PreparedStatement pstmt =null;
        int execute = 0;
        if(connection!=null){
            String sql = "UPDATE myhome.user SET uname = ? WHERE uid = ?";
            Object[] params = {userName,userId};
            try {
                execute = BaseDao.execute(connection,sql,params,pstmt);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            BaseDao.closeResource(null,pstmt,null);
        }

        return execute;
    }

    @Override
    public int updatePassword(Connection connection, int userId, String userPassword) {
        PreparedStatement pstmt =null;
        int execute = 0;
        if(connection!=null){
            String sql = "UPDATE myhome.user SET upassword = ? WHERE uid = ?";
            Object[] params = {userPassword,userId};
            try {
                execute = BaseDao.execute(connection,sql,params,pstmt);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            BaseDao.closeResource(null,pstmt,null);
        }

        return execute;
    }

    @Override
    public int updateAge(Connection connection, int userId, int userAge) {
        PreparedStatement pstmt =null;
        int execute = 0;
        if(connection!=null){
            String sql = "UPDATE myhome.user SET uage = ? WHERE uid = ?";
            Object[] params = {userAge,userId};
            try {
                execute = BaseDao.execute(connection,sql,params,pstmt);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            BaseDao.closeResource(null,pstmt,null);
        }

        return execute;
    }

    @Override
    public int updateEmail(Connection connection, int userId, String userEmail) {
        PreparedStatement pstmt =null;
        int execute = 0;
        if(connection!=null){
            String sql = "UPDATE myhome.user SET uemail = ? WHERE uid = ?";
            Object[] params = {userEmail,userId};
            try {
                execute = BaseDao.execute(connection,sql,params,pstmt);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            BaseDao.closeResource(null,pstmt,null);
        }

        return execute;
    }

    @Override
    public int updateTel(Connection connection, int userId, String userTel) {
        PreparedStatement pstmt =null;
        int execute = 0;
        if(connection!=null){
            String sql = "UPDATE myhome.user SET utel = ? WHERE uid = ?";
            Object[] params = {userTel,userId};
            try {
                execute = BaseDao.execute(connection,sql,params,pstmt);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            BaseDao.closeResource(null,pstmt,null);
        }

        return execute;
    }

    @Override
    public int updateRoom(Connection connection, int userId, int userRoom) {
        PreparedStatement pstmt =null;
        int execute = 0;
        if(connection!=null){
            String sql = "UPDATE myhome.user SET rid = ? WHERE uid = ?";
            Object[] params = {userRoom,userId};
            try {
                execute = BaseDao.execute(connection,sql,params,pstmt);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            BaseDao.closeResource(null,pstmt,null);
        }

        return execute;
    }

    @Override
    public int registerUser(Connection connection, int userId, String userName, String userPassword, int userAge, String userEmail, String userTel, int userRoom) {
        PreparedStatement pstmt =null;
        int execute = 0;
        if(connection!=null){
            String sql = "INSERT INTO mydb.user VALUES (?,?,?,?,?,?,?)";
            Object[] params = {userId,userName,userPassword,userAge,userEmail,userTel,userRoom};
            try {
                execute = BaseDao.execute(connection,sql,params,pstmt);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            BaseDao.closeResource(null,pstmt,null);
        }

        return execute;
    }
}
