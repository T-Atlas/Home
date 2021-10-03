package com.example.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.example.config.ContextUser;
import com.example.dao.LogMapper;
import com.example.model.Log;
import com.example.model.Rt;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * @author LianJunhong
 */
@Controller
@RequestMapping("log")
public class LogController {

    @Autowired
    LogMapper logMapper;

    @RequestMapping("light")
    public String light() {
        return "log/light";
    }

    @RequestMapping("door")
    public String door() {
        return "log/door";
    }

    @RequestMapping("sensor")
    public String sensor() {
        return "log/sensor";
    }

    @RequestMapping("fans")
    public String fans() {
        return "log/fans";
    }

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
    public Object getList(String rId, String deviceId, Integer typeId, String startTime, String endTime,
                          @RequestParam int page,
                          @RequestParam int limit,
                          @RequestParam(required = false, defaultValue = "") String keyWord) {
        PageHelper.startPage(page, limit, "logId desc");
        List<Log> list = logMapper.selectAll(rId, deviceId, typeId, startTime, endTime, keyWord);
        PageInfo<Log> pageInfo = new PageInfo<>(list);
        return Rt.success(pageInfo);
    }

    @ResponseBody
    @RequestMapping("getNearly7DayCount")
    public Object getNearly7DayCount(String typeId) {
        Date date = new Date();
        DateTime startTime = DateUtil.offsetDay(date, -6);
        List<DateTime> dateList = DateUtil.rangeToList(startTime, new Date(), DateField.DAY_OF_MONTH);
        List<Map> list = logMapper.getCountByDate(typeId, ContextUser.sysUser().getRid().toString(), startTime.toString(), null);
        List<Map> result = new ArrayList<>();
        for (DateTime dateTime : dateList) {
            Map map = new HashMap<>();
            map.put("date", dateTime.toDateStr());
            map.put("count", 0);
            Optional<Map> optional = list.stream().filter(i -> StrUtil.toString(i.get("date")).equals(dateTime.toDateStr())).findFirst();
            optional.ifPresent(value -> map.put("count", value.get("c")));
            result.add(map);
        }
        return Rt.success(result);
    }

    @ResponseBody
    @RequestMapping("getDateValueByHour")
    public Object getDateValueByHour(String typeId) {
        int[] hours = new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
        List<Map> list = logMapper.getDateValueByHour(typeId, ContextUser.sysUser().getRid().toString(), DateUtil.formatDate(new Date()));
        List<Map> result = new ArrayList<>();
        for (int hour : hours) {
            Map map = new HashMap<>();
            map.put("hour", hour);
            map.put("temperature", 0);
            map.put("humidity", 0);
            Optional<Map> optional = list.stream().filter(i -> Convert.toInt(i.get("h"), -1).equals(hour)).findFirst();
            if (optional.isPresent()) {
                map.put("temperature", optional.get().get("temperature"));
                map.put("humidity", optional.get().get("humidity"));
            }
            result.add(map);
        }
        return Rt.success(result);
    }
}
