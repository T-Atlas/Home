package com.example.dao;

import com.example.model.Factory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author LianJunhong
 */
@Mapper
public interface FactoryMapper {
    int deleteByPrimaryKey(Integer typeid);

    int insert(Factory record);

    int insertSelective(Factory record);

    Factory selectByPrimaryKey(Integer typeid);

    int updateByPrimaryKeySelective(Factory record);

    int updateByPrimaryKeyWithBLOBs(Factory record);

    int updateByPrimaryKey(Factory record);

    List<Factory> selectAll(@Param("keyword") String keyword);

    List<Map> getCountByTypeId(@Param("rid") Integer rid);
}