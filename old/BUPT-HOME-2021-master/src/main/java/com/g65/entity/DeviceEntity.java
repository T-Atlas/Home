package com.g65.entity;

/**
 * @author LianJunhong
 */
public class DeviceEntity {
    private int deviceId;
    private String location;
    private int isConsist;
    private int typeId;
    private int rId;


    public int getrId() {
        return rId;
    }

    public void setrId(int rId) {
        this.rId = rId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getIsConsist() {
        return isConsist;
    }

    public void setIsConsist(byte isConsist) {
        this.isConsist = isConsist;
    }

    public void setIsConsist(boolean isConsist) {
        if (isConsist) {
            this.isConsist = 1;
        } else {
            this.isConsist = 0;
        }
    }
}
