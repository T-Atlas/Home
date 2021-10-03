package com.example.dao;

import com.example.model.Log;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author LianJunhong
 */
@Mapper
public interface LogMapper {
    int deleteByPrimaryKey(Integer logid);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer logid);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

    List<Log> selectAll(@Param("rId") String rId,
                        @Param("deviceId") String deviceId,
                        @Param("typeId") Integer typeId,
                        @Param("startTime") String startTime,
                        @Param("endTime") String endTime,
                        @Param("keyword") String keyword);

    List<Map> getCountByDate(@Param("typeId") String typeId,
                             @Param("rId") String rId,
                             @Param("startTime") String startTime,
                             @Param("endTime") String endTime);

    List<Map> getDateValueByHour(@Param("typeId") String deviceId,
                                 @Param("rId") String rId,
                                 @Param("date") String date);
}