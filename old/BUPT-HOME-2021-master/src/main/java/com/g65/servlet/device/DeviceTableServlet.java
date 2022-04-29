package com.g65.servlet.device;

import com.g65.entity.DeviceEntity;
import com.g65.service.device.DeviceService;
import com.g65.service.device.DeviceServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @author LianJunhong
 */
public class DeviceTableServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("username"));

        DeviceService deviceService = new DeviceServiceImpl();
        ArrayList<DeviceEntity> list = deviceService.getExistDevice(userId);
        if(!list.isEmpty()){
            HttpSession session=req.getSession();
            session.setAttribute("list", list);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
