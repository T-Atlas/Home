package com.g65.service.device;

import com.g65.entity.DeviceEntity;

import java.sql.Connection;
import java.util.ArrayList;

/**
 * @author LianJunhong
 */
public interface DeviceService {
    public int getDeviceCount(int userId);

    public ArrayList<DeviceEntity> getExistDevice(int userId);
}

