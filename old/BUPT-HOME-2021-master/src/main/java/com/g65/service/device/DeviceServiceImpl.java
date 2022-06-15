package com.g65.service.device;

import com.g65.dao.BaseDao;
import com.g65.dao.device.DeviceDao;
import com.g65.dao.device.DeviceDaoImpl;
import com.g65.entity.DeviceEntity;

import java.sql.Connection;
import java.util.ArrayList;

/**
 * @author LianJunhong
 */
public class DeviceServiceImpl implements DeviceService {

    private DeviceDao deviceDao;

    public DeviceServiceImpl() {
        deviceDao = new DeviceDaoImpl();
    }

    @Override
    public int getDeviceCount(int userId) {
        Connection connection = BaseDao.getConnection();
        int count = 0;
        count = deviceDao.getDeviceCount(connection, userId);

        BaseDao.closeResource(connection, null, null);
        return count;
    }

    @Override
    public ArrayList<DeviceEntity> getExistDevice(int userId) {
        Connection connection = BaseDao.getConnection();
        ArrayList<DeviceEntity> list = deviceDao.getExistDevice(connection, userId);

        BaseDao.closeResource(connection, null, null);
        System.out.println(list.size());
        return list;
    }
}
