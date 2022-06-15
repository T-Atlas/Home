package com.g65.dao.device;

import com.g65.entity.DeviceEntity;

import java.sql.Connection;
import java.util.ArrayList;

/**
 * @author LianJunhong
 */
public interface DeviceDao {
    public int getDeviceCount(Connection connection, int userId);

    public ArrayList<DeviceEntity> getExistDevice(Connection connection, int userId);
}
