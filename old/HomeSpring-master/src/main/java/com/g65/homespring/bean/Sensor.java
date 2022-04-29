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
 * @TableName sensor
 */
@TableName(value ="sensor")
@Data
public class Sensor implements Serializable {
    /**
     * 
     */
    @TableId
    private Integer deviceid;

    /**
     * 百分比
     */
    private Double humidity;

    /**
     * 
     */
    private Double temperature;

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
        Sensor other = (Sensor) that;
        return (this.getDeviceid() == null ? other.getDeviceid() == null : this.getDeviceid().equals(other.getDeviceid()))
            && (this.getHumidity() == null ? other.getHumidity() == null : this.getHumidity().equals(other.getHumidity()))
            && (this.getTemperature() == null ? other.getTemperature() == null : this.getTemperature().equals(other.getTemperature()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getDeviceid() == null) ? 0 : getDeviceid().hashCode());
        result = prime * result + ((getHumidity() == null) ? 0 : getHumidity().hashCode());
        result = prime * result + ((getTemperature() == null) ? 0 : getTemperature().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", deviceid=").append(deviceid);
        sb.append(", humidity=").append(humidity);
        sb.append(", temperature=").append(temperature);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}