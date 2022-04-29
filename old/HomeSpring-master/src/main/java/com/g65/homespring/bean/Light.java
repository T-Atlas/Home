package com.g65.homespring.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @author LianJunhong
 * @TableName light
 */
@TableName(value ="light")
@Data
public class Light implements Serializable {
    /**
     * 
     */
    @TableId
    private Integer deviceid;

    /**
     * 0开启，1关闭
     */
    private Integer isClose;

    /**
     * 
     */
    private Integer b;

    /**
     * 
     */
    private Integer g;

    /**
     * 
     */
    private Integer r;

    /**
     * 
     */
    private Integer level;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

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
        Light other = (Light) that;
        return (this.getDeviceid() == null ? other.getDeviceid() == null : this.getDeviceid().equals(other.getDeviceid()))
            && (this.getIsClose() == null ? other.getIsClose() == null : this.getIsClose().equals(other.getIsClose()))
            && (this.getB() == null ? other.getB() == null : this.getB().equals(other.getB()))
            && (this.getG() == null ? other.getG() == null : this.getG().equals(other.getG()))
            && (this.getR() == null ? other.getR() == null : this.getR().equals(other.getR()))
            && (this.getLevel() == null ? other.getLevel() == null : this.getLevel().equals(other.getLevel()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getDeviceid() == null) ? 0 : getDeviceid().hashCode());
        result = prime * result + ((getIsClose() == null) ? 0 : getIsClose().hashCode());
        result = prime * result + ((getB() == null) ? 0 : getB().hashCode());
        result = prime * result + ((getG() == null) ? 0 : getG().hashCode());
        result = prime * result + ((getR() == null) ? 0 : getR().hashCode());
        result = prime * result + ((getLevel() == null) ? 0 : getLevel().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", deviceid=").append(deviceid);
        sb.append(", isClose=").append(isClose);
        sb.append(", b=").append(b);
        sb.append(", g=").append(g);
        sb.append(", r=").append(r);
        sb.append(", level=").append(level);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}