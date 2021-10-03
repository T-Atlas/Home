package com.example.dao;

import com.example.model.Light;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author LianJunhong
 */
@Mapper
public interface LightMapper {
    int deleteByPrimaryKey(Integer deviceid);

    int insert(Light record);

    int insertSelective(Light record);

    Light selectByPrimaryKey(Integer deviceid);

    int updateByPrimaryKeySelective(Light record);

    int updateByPrimaryKey(Light record);

    List<Light> selectAll(@Param("rid") Integer rid, @Param("keyword") String keyword);

    List<Map> getTopRoomCount();
}