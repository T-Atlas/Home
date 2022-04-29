package com.g65.dao.device;

import com.g65.dao.BaseDao;
import com.g65.entity.DeviceEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DeviceDaoImpl implements DeviceDao{
    @Override
    public int getDeviceCount(Connection connection,int userId) {
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        int deviceNumber = 0;

        if(connection!=null){
            String sql = "SELECT count(1) as count\n" +
                    "FROM myhome.user u,myhome.device d\n" +
                    "WHERE d.rid=u.rid AND d.is_consist=true\n" +
                    "AND u.uid=?;";
            Object[] params = {userId};
            try {
                rs = BaseDao.execute(connection,sql, params,rs,pstmt);
                deviceNumber=rs.getInt("count");
                BaseDao.closeResource(null,pstmt,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return deviceNumber;
    }

    @Override
    public ArrayList<DeviceEntity> getExistDevice(Connection connection, int userId) {
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        DeviceEntity device = null;
        ArrayList<DeviceEntity> deviceList = new ArrayList<>();

        if(connection!=null){
            String sql = "SELECT d.deviceid,d.typeid,d.location\n" +
                    "FROM myhome.user u,myhome.device d\n" +
                    "WHERE d.rid=u.rid AND d.is_consist=true\n" +
                    "AND u.uid=?;";
            Object[] params = {userId};
            try {
                rs = BaseDao.execute(connection,sql, params,rs,pstmt);
                while (rs!=null && rs.next()){
                    device = new DeviceEntity();
                    device.setDeviceId(rs.getInt("deviceid"));
                    device.setLocation(rs.getString("location"));
                    device.setTypeId(rs.getInt("typeid"));
                    device.setIsConsist(true);
                    deviceList.add(device);
                }
                BaseDao.closeResource(null,pstmt,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }

        return deviceList;
    }
}
