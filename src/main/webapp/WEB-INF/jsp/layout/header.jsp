<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.model.SysUser" %>
<%
    SysUser sysUser = (SysUser) session.getAttribute("sysUser");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport"/>
    <title>Smart home management system</title>
    <!--favicon-->
    <link href="/static/images/favicon-32x32.png" rel="icon" type="image/png"/>
    <!-- Vector CSS -->
    <link href="/static/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
    <!--plugins-->
    <link href="/static/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
    <link href="/static/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet"/>
    <link href="/static/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet"/>
    <!-- loader-->
    <link href="/static/css/pace.min.css" rel="stylesheet"/>
    <script src="/static/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Icons CSS -->
    <link href="/static/css/icons.css" rel="stylesheet"/>
    <!-- App CSS -->
    <link href="/static/css/app.css" rel="stylesheet"/>
    <link href="/static/css/all.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/layui/css/layui.css"/>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/popper.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <!--plugins-->
    <script src="/static/plugins/simplebar/js/simplebar.min.js"></script>
    <script src="/static/plugins/metismenu/js/metisMenu.min.js"></script>
    <script src="/static/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
    <!-- Vector map JavaScript -->
    <script src="/static/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="/static/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="/static/plugins/vectormap/jquery-jvectormap-in-mill.js"></script>
    <script src="/static/plugins/vectormap/jquery-jvectormap-us-aea-en.js"></script>
    <script src="/static/plugins/vectormap/jquery-jvectormap-uk-mill-en.js"></script>
    <script src="/static/plugins/vectormap/jquery-jvectormap-au-mill.js"></script>
    <%--    <script src="/static/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>--%>
     <script src="/static/js/echarts.min.js"></script>
    <!-- App JS -->
    <script src="/static/js/app.js"></script>

    <script src="/static/layui/layui.js"></script>
    <script src="/static/js/common.js"></script>

    <style>
        .layui-form-label, .layui-layer-dialog, .layui-form-radio, .layui-form-select {
            color: #0C0C0C;
        }
    </style>
</head>
<body>
<!--header-->
<header class="top-header">
    <nav class="navbar navbar-expand">
        <div class="left-topbar d-flex align-items-center">
            <a class="toggle-btn" href="javascript:"> <i class="bx bx-menu"></i>
            </a>
        </div>
        <div class="flex-grow-1 search-bar">
        </div>
        <div class="right-topbar ml-auto">
            <ul class="navbar-nav">
                <li class="nav-item search-btn-mobile">
                    <a class="nav-link position-relative" href="javascript:"> <i
                            class="bx bx-search vertical-align-middle"></i>
                    </a>
                </li>
                <li class="nav-item dropdown dropdown-user-profile">
                    <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown"
                       href="javascript:">
                        <div class="media user-box align-items-center">
                            <div class="media-body user-info">
                                <p class="user-name mb-0"><%=sysUser.getUname() %> Home</p>
                            </div>
                        <img src="/static/images/avatars/avatar-1.png" class="user-img" alt="user avatar">
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="javascript:;" id="modify-pwd">
                            <i class="bx bx-cog"></i><span>Edit password</span>
                        </a>
                        <form action="/logout" method="post">
                            <div class="dropdown-divider mb-0"></div>
                            <button class="dropdown-item" type="submit">
                                <i class="bx bx-power-off"></i>Logout
                            </button>
                        </form>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!--end header-->
</body>
</html>
<script id="form_modify_pwd_html" type="text/html">
    <div class="layui-card-body">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">Old Password</label>
                <div class="layui-input-block">
                    <input type="password" name="oldPwd" lay-verify="required|pass" placeholder="Old Password"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">New Password</label>
                <div class="layui-input-block">
                    <input type="password" name="newPwd" lay-verify="required|pass" placeholder="New Password"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Confirm Password</label>
                <div class="layui-input-block">
                    <input type="password" name="newPwd1" lay-verify="required|pass" placeholder="Confirm Password"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formModifyPwd">Submit</button>
                    <button type="button" id="form_modify_pwd_close" class="layui-btn layui-btn-primary">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</script>