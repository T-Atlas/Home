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

public class LoginServlet extends HttpServlet {

    /**
     * servlet：控制层调用业务层代码
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("username"));
        String userPassword = req.getParameter("password");

        UserService userService = new UserServiceImpl();
        UserEntity user = userService.login(userId, userPassword);
        if (user != null) {

            HttpSession session = req.getSession();
            session.setAttribute(Constants.USER_SESSION, user);

            session.setAttribute("user", user);
            session.setAttribute("username", user.getuName());

            req.getRequestDispatcher("pages/index.jsp").forward(req, resp);

        } else {
            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out = resp.getWriter();
            out.println(" <script language='javascript'> alert('User ID or Password wrong');location.href='login.jsp'; </script> ");
            out.close();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
