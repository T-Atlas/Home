package com.example.controller;

import cn.hutool.core.convert.Convert;
import com.example.config.ContextUser;
import com.example.dao.LogMapper;
import com.example.dao.SensorMapper;
import com.example.model.Log;
import com.example.model.Rt;
import com.example.model.Sensor;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author LianJunhong
 */
@RestController
@RequestMapping("sensor")
public class SensorController {

    @Autowired
    SensorMapper sensorMapper;
    @Autowired
    LogMapper logMapper;

    /**
     * 列表
     *
     * @param page
     * @param limit
     * @param keyWord
     * @return
     */
    @ResponseBody
    @RequestMapping("getList")
    public Object getList(@RequestParam int page,
                          @RequestParam int limit,
                          @RequestParam(required = false, defaultValue = "") String keyWord) {
        PageHelper.startPage(page, limit, "deviceId desc");
        Integer rId = null;
        if (ContextUser.sysUser().getUtype() == 0) {
            rId = ContextUser.sysUser().getRid();
        }
        List<Sensor> list = sensorMapper.selectAll(rId, keyWord);
        PageInfo<Sensor> pageInfo = new PageInfo<>(list);
        return Rt.success(pageInfo);
    }

    /**
     * 保存信息
     *
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("save")
    public Object save(HttpServletRequest request) {
        int deviceId = Convert.toInt(request.getParameter("deviceid"), 0);
        Sensor record = sensorMapper.selectByPrimaryKey(deviceId);
        // 赋值基本信息属性
        if (record == null) {
            record = new Sensor();
            record.setTemperature(Convert.toDouble(request.getParameter("temperature")));
            record.setHumidity(Convert.toDouble(request.getParameter("humidity")));
            record.setLocation(request.getParameter("location"));
            record.setTypeid(Convert.toInt(request.getParameter("typeid")));
            record.setRid(Convert.toInt(request.getParameter("rid")));
            // 新增信息
            sensorMapper.insertSelective(record);
        } else {
            record.setDeviceid(deviceId);
            record.setTemperature(Convert.toDouble(request.getParameter("temperature")));
            record.setHumidity(Convert.toDouble(request.getParameter("humidity")));
            record.setLocation(request.getParameter("location"));
            record.setTypeid(Convert.toInt(request.getParameter("typeid")));
            record.setRid(Convert.toInt(request.getParameter("rid")));
            //修改信息
            sensorMapper.updateByPrimaryKeySelective(record);
        }
        Log log = new Log();
        log.setDeviceid(deviceId);
        log.setLocation(record.getLocation());
        log.setRid(record.getRid());
        log.setHumidity(record.getHumidity());
        log.setTemperature(record.getTemperature());
        log.setTypeid(record.getTypeid());
        logMapper.insertSelective(log);
        return Rt.success();
    }

    @ResponseBody
    @RequestMapping("info")
    public Object info(@RequestParam int id) {
        return Rt.success(sensorMapper.selectByPrimaryKey(id));
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("del")
    public Object del(@RequestParam int id) {
        sensorMapper.deleteByPrimaryKey(id);
        return Rt.success();
    }

    @ResponseBody
    @RequestMapping("getTopRoomCount")
    public Object getTopRoomCount() {
        List<Map> list = sensorMapper.getTopRoomCount();
        return Rt.success(list);
    }
}
