package com.g65.entity;

import java.sql.Timestamp;

/**
 * @author LianJunhong
 */
public class LogEntity {
    private int deviceId;
    private Timestamp time;
    private int state;

    public int getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
