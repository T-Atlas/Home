package com.example.config;

import com.example.model.SysUser;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Objects;

/**
 * @author LianJunhong
 */
public class ContextUser {

    public static SysUser sysUser() {
        return (SysUser) ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest().getSession().getAttribute("sysUser");
    }

    public static void setSysUser(SysUser sysUser) {
        ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest().getSession().setAttribute("sysUser", sysUser);
    }

    public static void logout() {
        ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest().getSession().removeAttribute("sysUser");
    }
}
