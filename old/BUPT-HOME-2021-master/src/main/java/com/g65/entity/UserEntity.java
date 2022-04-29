package com.g65.entity;

public class UserEntity {
    private int uId;
    private String uPassword;
    private String uName;
    private int uAge;
    private String uEmail;
    private String uTelephone;
    private int rId;

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public int getuAge() {
        return uAge;
    }

    public void setuAge(int uAge) {
        this.uAge = uAge;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuTelephone() {
        return uTelephone;
    }

    public void setuTelephone(String uTelephone) {
        this.uTelephone = uTelephone;
    }

    public int getrId() {
        return rId;
    }

    public void setrId(int rId) {
        this.rId = rId;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "uId=" + uId +
                ", uPassword='" + uPassword + '\'' +
                ", uName='" + uName + '\'' +
                ", uAge=" + uAge +
                ", uEmail='" + uEmail + '\'' +
                ", uTelephone='" + uTelephone + '\'' +
                ", roomRId=" + rId +
                '}';
    }
}
