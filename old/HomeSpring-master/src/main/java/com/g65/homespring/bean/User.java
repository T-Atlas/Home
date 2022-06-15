package com.g65.homespring.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

/**
 * 存储用户信息
 *
 * @author LianJunhong
 * @TableName user
 */
@TableName(value = "user")
@Data
public class User implements Serializable {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
    /**
     *
     */
    @TableId
    private Integer uid;
    /**
     * room id
     */
    private Integer rid;
    /**
     *
     */
    private String utel;
    /**
     *
     */
    private String uemail;
    /**
     *
     */
    private Integer uage;
    /**
     *
     */
    private String uname;
    /**
     *
     */
    private String upassword;

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        User other = (User) that;
        return (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
                && (this.getRid() == null ? other.getRid() == null : this.getRid().equals(other.getRid()))
                && (this.getUtel() == null ? other.getUtel() == null : this.getUtel().equals(other.getUtel()))
                && (this.getUemail() == null ? other.getUemail() == null : this.getUemail().equals(other.getUemail()))
                && (this.getUage() == null ? other.getUage() == null : this.getUage().equals(other.getUage()))
                && (this.getUname() == null ? other.getUname() == null : this.getUname().equals(other.getUname()))
                && (this.getUpassword() == null ? other.getUpassword() == null : this.getUpassword().equals(other.getUpassword()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getRid() == null) ? 0 : getRid().hashCode());
        result = prime * result + ((getUtel() == null) ? 0 : getUtel().hashCode());
        result = prime * result + ((getUemail() == null) ? 0 : getUemail().hashCode());
        result = prime * result + ((getUage() == null) ? 0 : getUage().hashCode());
        result = prime * result + ((getUname() == null) ? 0 : getUname().hashCode());
        result = prime * result + ((getUpassword() == null) ? 0 : getUpassword().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", uid=").append(uid);
        sb.append(", rid=").append(rid);
        sb.append(", utel=").append(utel);
        sb.append(", uemail=").append(uemail);
        sb.append(", uage=").append(uage);
        sb.append(", uname=").append(uname);
        sb.append(", upassword=").append(upassword);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}