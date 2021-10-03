package com.example.dao;

import com.example.model.Sensor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author LianJunhong
 */
@Mapper
public interface SensorMapper {
    int deleteByPrimaryKey(Integer deviceid);

    int insert(Sensor record);

    int insertSelective(Sensor record);

    Sensor selectByPrimaryKey(Integer deviceid);

    int updateByPrimaryKeySelective(Sensor record);

    int updateByPrimaryKey(Sensor record);

    List<Sensor> selectAll(@Param("rid") Integer rid, @Param("keyword") String keyword);

    List<Map> getTopRoomCount();
}