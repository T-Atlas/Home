package com.example.dao;

import com.example.model.Door;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author LianJunhong
 */
@Mapper
public interface DoorMapper {
    int deleteByPrimaryKey(Integer deviceid);

    int insert(Door record);

    int insertSelective(Door record);

    Door selectByPrimaryKey(Integer deviceid);

    int updateByPrimaryKeySelective(Door record);

    int updateByPrimaryKey(Door record);

    List<Door> selectAll(@Param("rid") Integer rid, @Param("keyword") String keyword);

    List<Map> getTopRoomCount();
}