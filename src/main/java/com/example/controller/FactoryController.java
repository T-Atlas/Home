package com.example.controller;

import cn.hutool.core.convert.Convert;
import com.example.config.ContextUser;
import com.example.dao.FactoryMapper;
import com.example.model.Factory;
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
@RequestMapping("factory")
public class FactoryController {

    @Autowired
    FactoryMapper factoryMapper;

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
        PageHelper.startPage(page, limit, "typeId desc");
        List<Factory> list = factoryMapper.selectAll(keyWord);
        PageInfo<Factory> pageInfo = new PageInfo<>(list);
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
        int typeId = Convert.toInt(request.getParameter("typeid"), 0);
        Factory record = factoryMapper.selectByPrimaryKey(typeId);
        // 赋值基本信息属性
        if (record == null) {
            record = new Factory();
            record.setFname(request.getParameter("fname"));
            record.setModel(Convert.toInt(request.getParameter("model")));
            record.setInstruction(request.getParameter("instruction"));
            // 新增信息
            factoryMapper.insertSelective(record);
        } else {
            record.setFname(request.getParameter("fname"));
            record.setModel(Convert.toInt(request.getParameter("model")));
            record.setInstruction(request.getParameter("instruction"));
            //修改信息
            factoryMapper.updateByPrimaryKeySelective(record);
        }
        return Rt.success();
    }

    @ResponseBody
    @RequestMapping("info")
    public Object info(@RequestParam int id) {
        return Rt.success(factoryMapper.selectByPrimaryKey(id));
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
        factoryMapper.deleteByPrimaryKey(id);
        return Rt.success();
    }

    @ResponseBody
    @RequestMapping("getCountByTypeId")
    public Object getCountByTypeId() {
        List<Map> list = factoryMapper.getCountByTypeId(ContextUser.sysUser().getRid());
        return Rt.success(list);
    }
}
