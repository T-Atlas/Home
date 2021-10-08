package com.example.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.crypto.SecureUtil;
import com.example.dao.UserMapper;
import com.example.model.Rt;
import com.example.model.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author LianJunhong
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    UserMapper userMapper;

    @RequestMapping({"/", "index"})
    public String index() {
        return "user/index";
    }

    @RequestMapping("user")
    public String user(Model model) {
        model.addAttribute("utype", 0);
        return "user/user";
    }

    @RequestMapping("mfuser")
    public String mfUser(Model model) {
        model.addAttribute("utype", 2);
        return "user/user";
    }

    @RequestMapping("userprofile")
    public String userProfile() {
        return "user/user-profile";
    }

    @RequestMapping("editprofile")
    public String editProfile() {
        return "user/edit-profile";
    }

    /**
     * 用户列表
     *
     * @param type
     * @param page
     * @param limit
     * @param keyWord
     * @return
     */
    @ResponseBody
    @RequestMapping("getList")
    public Object getList(Integer type,
                          @RequestParam int page,
                          @RequestParam int limit,
                          @RequestParam(required = false, defaultValue = "") String keyWord) {
        PageHelper.startPage(page, limit, "uId desc");
        List<User> list = userMapper.selectAll(type, keyWord);
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return Rt.success(pageInfo);
    }

    /**
     * 保存学生信息
     *
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("save")
    public Object save(HttpServletRequest request) {
        boolean edit = Convert.toBool(request.getParameter("edit"), false);
        int id = Convert.toInt(request.getParameter("uid"));
        User user = userMapper.selectByPrimaryKey(id);
        if (!edit) {
            // 新增校验用户id是否重复
            if (user != null) {
                return Rt.fail("ID already exists");
            }
        }
        // 赋值基本信息属性
        if (user == null) {
            user = new User();
            user.setUid(id);
            user.setUpassword(SecureUtil.md5(request.getParameter("upassword")));
            user.setUname(request.getParameter("uname"));
            user.setUage(Convert.toInt(request.getParameter("uage")));
            user.setUemail(request.getParameter("uemail"));
            user.setUtel(request.getParameter("utel"));
            user.setUtype(Convert.toInt(request.getParameter("utype")));
            user.setRid(user.getUtype() == 2 ? null : Convert.toInt(request.getParameter("rid")));
            // 新增用户信息
            userMapper.insertSelective(user);
        } else {
            user.setUid(id);
            user.setUname(request.getParameter("uname"));
            user.setUage(Convert.toInt(request.getParameter("uage")));
            user.setUemail(request.getParameter("uemail"));
            user.setUtel(request.getParameter("utel"));
            user.setUtype(Convert.toInt(request.getParameter("utype")));
            user.setRid(user.getUtype() == 2 ? null : Convert.toInt(request.getParameter("rid")));
            //修改用户信息
            userMapper.updateByPrimaryKeySelective(user);
        }
        return Rt.success();
    }

    @ResponseBody
    @RequestMapping("info")
    public Object info(@RequestParam int id) {
        return Rt.success(userMapper.selectByPrimaryKey(id));
    }

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("del")
    public Object del(@RequestParam int id) {
        userMapper.deleteByPrimaryKey(id);
        return Rt.success();
    }

    /**
     * 修改用户密码
     *
     * @param id
     * @param password
     * @return
     */
    @ResponseBody
    @RequestMapping("editUserPwd")
    public Object del(@RequestParam int id, @RequestParam String password) {
        User user = new User();
        user.setUid(id);
        user.setUpassword(SecureUtil.md5(password));
        userMapper.updateByPrimaryKeySelective(user);
        return Rt.success();
    }
}
