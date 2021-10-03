package com.example.controller;

import cn.hutool.core.convert.Convert;
import com.example.config.ContextUser;
import com.example.dao.DoorMapper;
import com.example.model.Door;
import com.example.model.Rt;
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
@RequestMapping("door")
public class DoorController {

    @Autowired
    DoorMapper doorMapper;

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
        List<Door> list = doorMapper.selectAll(rId, keyWord);
        PageInfo<Door> pageInfo = new PageInfo<>(list);
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
        Door record = doorMapper.selectByPrimaryKey(deviceId);
        // 赋值基本信息属性
        if (record == null) {
            record = new Door();
            record.setIsLock(Convert.toInt(request.getParameter("is_lock")));
            record.setIsClose(Convert.toInt(request.getParameter("is_close")));
            record.setLocation(request.getParameter("location"));
            record.setTypeid(Convert.toInt(request.getParameter("typeid")));
            record.setRid(Convert.toInt(request.getParameter("rid")));
            // 新增信息
            doorMapper.insertSelective(record);
        } else {
            record.setDeviceid(deviceId);
            record.setIsLock(Convert.toInt(request.getParameter("is_lock")));
            record.setIsClose(Convert.toInt(request.getParameter("is_close")));
            record.setLocation(request.getParameter("location"));
            record.setTypeid(Convert.toInt(request.getParameter("typeid")));
            record.setRid(Convert.toInt(request.getParameter("rid")));
            //修改信息
            doorMapper.updateByPrimaryKeySelective(record);
        }
        return Rt.success();
    }

    @ResponseBody
    @RequestMapping("info")
    public Object info(@RequestParam int id) {
        return Rt.success(doorMapper.selectByPrimaryKey(id));
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
        doorMapper.deleteByPrimaryKey(id);
        return Rt.success();
    }

    @ResponseBody
    @RequestMapping("getTopRoomCount")
    public Object getTopRoomCount() {
        List<Map> list = doorMapper.getTopRoomCount();
        return Rt.success(list);
    }
}
