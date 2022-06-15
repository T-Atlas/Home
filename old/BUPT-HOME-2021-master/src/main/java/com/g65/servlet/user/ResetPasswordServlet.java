package com.g65.servlet.user;

import com.g65.entity.UserEntity;
import com.g65.service.user.UserService;
import com.g65.service.user.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author LianJunhong
 */
@SuppressWarnings("AlibabaUndefineMagicConstant")
public class ResetPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String method = req.getParameter("method");
        if (method != null && method.equals("forgetPassword")) {
            this.forgetPassword(req, resp);
        } else if (method != null && method.equals("resetPassword")) {
            this.forgetPassword(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void forgetPassword(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        UserService userService = new UserServiceImpl();
        UserEntity user = null;

        int userId = Integer.parseInt(req.getParameter("user_id"));
        //调用service检查信息
        user = userService.informationCheck(userId);

        boolean flag = false;

        if (user != null) {
            if (user.getuName().equals(req.getParameter("user_name")) && user.getuTelephone().equals(req.getParameter("user_TEL"))) {
                String newPassword = req.getParameter("user_nPassword");
                flag = userService.updatePassword(userId, newPassword);
                resp.setContentType("text/html;charset=utf-8");
                PrintWriter out = resp.getWriter();
                if (flag) {
                    out.println(" <script language='javascript'> alert('Successful');location.href='login.jsp'; </script> ");
                    out.close();
                } else {
                    out.println(" <script language='javascript'> alert('Error'); </script> ");
                    out.close();

                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            } else {
                resp.setContentType("text/html;charset=utf-8");
                PrintWriter out = resp.getWriter();
                out.println(" <script language='javascript'> alert('Information wrong,try again!');location.href='forgot-password.jsp'; </script> ");
                out.close();

            }

        } else {
            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out = resp.getWriter();
            out.println(" <script language='javascript'> alert('Information wrong,try again!');location.href='forgot-password.jsp'; </script> ");
            out.close();
            req.getRequestDispatcher("forgot-password.jsp").forward(req, resp);
        }
    }

    private void resetPassword(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        UserService userService = new UserServiceImpl();
        UserEntity user = null;

        int userId = Integer.parseInt(req.getParameter("user_id"));

        //调用service检查信息
        user = userService.informationCheck(userId);

        boolean flag = false;

        if (user != null) {
            String newPassword = req.getParameter("user_nPassword");
            String rnewPassword = req.getParameter("user_rnPassword");
            if (user.getuPassword().equals(req.getParameter("user_oldPassword")) && newPassword.equals(req.getParameter(rnewPassword))) {
                flag = userService.updatePassword(userId, newPassword);
                resp.setContentType("text/html;charset=utf-8");
                PrintWriter out = resp.getWriter();
                if (flag) {
                    out.println(" <script language='javascript'> alert('Successful');location.href='login.jsp'; </script> ");
                    out.close();
                } else {
                    out.println(" <script language='javascript'> alert('Error'); </script> ");
                    out.close();

                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            } else {
                resp.setContentType("text/html;charset=utf-8");
                PrintWriter out = resp.getWriter();
                out.println(" <script language='javascript'> alert('Information wrong,try again!');location.href='forgot-password.jsp'; </script> ");
                out.close();

            }

        } else {
            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out = resp.getWriter();
            out.println(" <script language='javascript'> alert('Information wrong,try again!');location.href='forgot-password.jsp'; </script> ");
            out.close();
            req.getRequestDispatcher("forgot-password.jsp").forward(req, resp);
        }
    }

}
