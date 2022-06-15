package com.g65.servlet.user;

import com.g65.entity.UserEntity;
import com.g65.service.user.UserService;
import com.g65.service.user.UserServiceImpl;
import com.g65.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author LianJunhong
 */
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();

        int userId = Integer.parseInt(req.getParameter("user_id"));
        String userName = req.getParameter("user_name");
        String userPassword = req.getParameter("user_password");
        int userAge = Integer.parseInt(req.getParameter("user_age"));
        String userEmail = req.getParameter("user_email");
        String userTel = req.getParameter("user_tel");
        int userRoom = Integer.parseInt(req.getParameter("user_room_id"));
        String userCheck = req.getParameter("user_check");


        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        if (userCheck == null) {
            out.println(" <script language='javascript'> alert('Please read and agree to Terms & Conditions');location.href='register.jsp'; </script> ");
            out.close();
        } else {
            String information = userService.userRegister(userId, userName, userPassword, userAge, userEmail, userTel, userRoom);

            if (information.equals("User ID has already exist")) {
                out.println(" <script language='javascript'> alert('User ID has already exist');location.href='register.jsp'; </script> ");
                out.close();
            } else if (information.equals("Error")) {
                out.println(" <script language='javascript'> alert('Register false,try again!');location.href='register.jsp'; </script> ");
                out.close();
            } else {
                out.println(" <script language='javascript'> alert('Register successful!');location.href='login.jsp'; </script> ");
                out.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
