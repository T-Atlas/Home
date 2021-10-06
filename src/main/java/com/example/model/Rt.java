package com.example.model;

import java.io.Serializable;

/**
 * @author LianJunhong
 */
public class Rt implements Serializable {

    private int code;

    private String msg;

    private Object data;

    public Rt() {
    }

    public Rt(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Rt(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static Rt success() {
        return new Rt(1, "Operation successful", null);
    }

    public static Rt success(Object data) {
        return new Rt(1, "Operation successful", data);
    }

    public static Rt fail() {
        return new Rt(-1, "Operation failed", null);
    }

    public static Rt fail(String msg) {
        return new Rt(-1, msg, null);
    }
}
