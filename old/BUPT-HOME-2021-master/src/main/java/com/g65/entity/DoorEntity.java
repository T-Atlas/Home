package com.g65.entity;

/**
 * @author LianJunhong
 */
public class DoorEntity {
    private int deviceId;
    private byte isClose;
    private byte isLock;

    public int getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(int deviceDId) {
        this.deviceId = deviceId;
    }

    public byte getIsClose() {
        return isClose;
    }

    public void setIsClose(byte isClose) {
        this.isClose = isClose;
    }

    public byte getIsLock() {
        return isLock;
    }

    public void setIsLock(byte isLock) {
        this.isLock = isLock;
    }
}
