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
public class InfoEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();

        int userId = Integer.parseInt(req.getParameter("userIdEditor"));
        String userName = req.getParameter("user_name");
        String userPassword = req.getParameter("user_password");
        int userAge = Integer.parseInt(req.getParameter("user_age"));
        String userEmail = req.getParameter("user_email");
        String userTel = req.getParameter("user_tel");
        int userRoom = Integer.parseInt(req.getParameter("user_room_id"));

        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        if(userName==null||userPassword==null||userAge<0||userEmail==null||userTel==null||userRoom<0){
            out.println(" <script language='javascript'> alert('Please input right format');location.href='pages/edit.jsp'; </script> ");
            out.close();
        }else{
            boolean flag = userService.updateInfo(userId, userName, userPassword, userAge, userEmail, userTel, userRoom);

            if(flag) {
                UserEntity user = new UserEntity();
                user.setuId(userId);
                user.setuName(userName);
                user.setuPassword(userPassword);
                user.setuAge(userAge);
                user.setuEmail(userEmail);
                user.setuTelephone(userTel);
                user.setrId(userRoom);

                HttpSession session=req.getSession();
                session.removeAttribute(Constants.USER_SESSION);
                session.setAttribute(Constants.USER_SESSION,user);
                out.println(" <script language='javascript'> alert('Successful!');location.href='pages/user-profile.jsp'; </script> ");
                out.close();
            }else{
                out.println(" <script language='javascript'> alert('Unsuccessful!');location.href='pages/user-profile.jsp'; </script> ");
                out.close();
            }
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
