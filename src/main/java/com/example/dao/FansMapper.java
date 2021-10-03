package com.example.dao;

import com.example.model.Fans;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author LianJunhong
 */
@Mapper
public interface FansMapper {
    int deleteByPrimaryKey(Integer deviceid);

    int insert(Fans record);

    int insertSelective(Fans record);

    Fans selectByPrimaryKey(Integer deviceid);

    int updateByPrimaryKeySelective(Fans record);

    int updateByPrimaryKey(Fans record);

    List<Fans> selectAll(@Param("rid") Integer rid, @Param("keyword") String keyword);

    List<Map> getTopRoomCount();
}