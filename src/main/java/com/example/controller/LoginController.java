package com.example.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.crypto.SecureUtil;
import com.example.config.ContextUser;
import com.example.dao.UserMapper;
import com.example.model.Rt;
import com.example.model.SysUser;
import com.example.model.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LianJunhong
 */
@Controller
public class LoginController {

    @Autowired
    UserMapper userMapper;

    @RequestMapping({"/", "login"})
    public String login(Model model, HttpServletRequest request) {
        model.addAttribute("error", request.getParameter("error"));
        return "login";
    }

    @RequestMapping("register")
    public String register(Model model, HttpServletRequest request) {
        model.addAttribute("error", request.getParameter("error"));
        return "register";
    }

    @RequestMapping("forgotpassword")
    public String forgotPassword(Model model, HttpServletRequest request) {
        model.addAttribute("error", request.getParameter("error"));
        return "forgot-password";
    }

    @RequestMapping({"mfuser", "mfuser/index"})
    public String index() {
        return "mfuser/index";
    }

    @RequestMapping("terms_conditions")
    public String termsConditions() {
        return "terms-conditions";
    }

    /**
     * 用户登录
     *
     * @param model
     * @param username
     * @param password
     * @param type
     * @param response
     * @throws IOException
     */
    @RequestMapping("doLogin")
    public void doLogin(Model model, String username, String password, Integer type, HttpServletResponse response) throws IOException {
        User user = userMapper.selectByPrimaryKey(Convert.toInt(username));
        if (user != null && SecureUtil.md5(password).equals(user.getUpassword())) {
            SysUser sysUser = new SysUser();
            BeanUtils.copyProperties(user, sysUser);
            ContextUser.setSysUser(sysUser);
            if (sysUser.getUtype() == 0) {
                response.sendRedirect("user/index");
            } else if (sysUser.getUtype() == 1) {
                response.sendRedirect("admin/index");
            } else {
                response.sendRedirect("mfuser/index");
            }
        } else {
            model.addAttribute("error", "error");
            // 登录失败
            response.sendRedirect("/login?error");
        }
    }

    @RequestMapping("doRegister")
    public void doRegister(Model model, Integer user_id, String user_name, String user_password, Integer user_age, String user_email, String user_tel, Integer user_room_id, HttpServletResponse response) throws IOException {
        User user = userMapper.selectByPrimaryKey(user_id);
        if (user == null) {
            user = new User();
            user.setUid(user_id);
            user.setUname(user_name);
            user.setUpassword(SecureUtil.md5(user_password));
            user.setUage(user_age);
            user.setUemail(user_email);
            user.setUtel(user_tel);
            user.setRid(user_room_id);
            user.setUtype(0);
            userMapper.insertSelective(user);
            response.sendRedirect("/login");
        } else {
            model.addAttribute("error", "error");
            response.sendRedirect("/register?error");
        }
    }

    @RequestMapping("doProfile")
    public void doProfile(String user_name, Integer user_age, String user_email, String user_tel, Integer user_room_id, HttpServletResponse response) throws IOException {
        SysUser sysUser = ContextUser.sysUser();
        User user = userMapper.selectByPrimaryKey(sysUser.getUid());
        if (user != null) {
            user.setUname(user_name);
            user.setUage(user_age);
            user.setUemail(user_email);
            user.setUtel(user_tel);
            user.setRid(user_room_id);
            userMapper.updateByPrimaryKeySelective(user);
            BeanUtils.copyProperties(user, sysUser);
            ContextUser.setSysUser(sysUser);
        }
        response.sendRedirect("/user/userprofile");
    }

    @RequestMapping("logout")
    public void logout(HttpServletResponse response) throws IOException {
        ContextUser.logout();
        response.sendRedirect("/login");
    }

    /**
     * 修改密码
     *
     * @param oldPwd
     * @param newPwd
     * @param newPwd1
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("modifyPwd")
    public Rt modifyPwd(String oldPwd, String newPwd, String newPwd1, HttpServletRequest request) {
        // 校验两次密码是否一致
        if (!newPwd.equals(newPwd1)) {
            return Rt.fail("两次密码输入不一致");
        }
        SysUser sysUser = ContextUser.sysUser();
        // 修改密码
        User user = userMapper.selectByPrimaryKey(sysUser.getUid());
        // 校验旧密码是否正确
        if (user != null && user.getUpassword().equals(SecureUtil.md5(oldPwd))) {
            user.setUpassword(SecureUtil.md5(newPwd));
            // 更新密码
            userMapper.updateByPrimaryKeySelective(user);
        } else {
            return Rt.fail("旧密码不正确");
        }
        return Rt.success();
    }

    @RequestMapping("resetPassword")
    public void resetPassword(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = userMapper.selectByPrimaryKey(Convert.toInt(request.getParameter("user_id")));
        if (user != null && (!user.getUname().equals(request.getParameter("user_name")) || !user.getUtel().equals(request.getParameter("user_teL")))) {
            model.addAttribute("error", "error");
            response.sendRedirect("/forgotpassword?error");
            return;
        }
        if (user != null) {
            // 更新密码
            user.setUpassword(SecureUtil.md5(request.getParameter("user_password")));
            userMapper.updateByPrimaryKeySelective(user);
        }
    }
}
