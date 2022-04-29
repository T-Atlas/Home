package com.g65.entity;


/**
 * @author LianJunhong
 */
public class LightEntity {
    private int deviceId;
    private byte isClose;
    private int level;
    private int R;
    private int G;
    private int B;

    public int getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    public byte getIsClose() {
        return isClose;
    }

    public void setIsClose(byte isClose) {
        this.isClose = isClose;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getR() {
        return R;
    }

    public void setR(int r) {
        R = r;
    }

    public int getG() {
        return G;
    }

    public void setG(int g) {
        G = g;
    }

    public int getB() {
        return B;
    }

    public void setB(int b) {
        B = b;
    }
}
