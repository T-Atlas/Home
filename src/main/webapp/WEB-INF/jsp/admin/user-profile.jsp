<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Smart home management system</title>
</head>
<body class="bg-theme bg-theme1">
<div class="layui-layout layui-layout-admin">
    <!-- wrapper -->
    <div class="wrapper">
        <!--sidebar-wrapper-->
        <div class="sidebar-wrapper" data-simplebar="true">
            <div class="sidebar-header">
                <div class="">
                    <img alt="" class="logo-icon-2" src="/static/images/logo-icon.png"/>
                </div>
                <div>
                    <h4 class="logo-text">Smart Home</h4>
                </div>
                <a class="toggle-btn ml-auto" href="javascript:"> <i class="bx bx-menu"></i>
                </a>
            </div>
            <%@ include file="../layout/left.jsp" %>
        </div>
        <!--end sidebar-wrapper-->
        <%@ include file="../layout/header.jsp" %>
        <!--page-wrapper-->
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="tab-content mt-3">
                        <div class="card shadow-none border mb-0 radius-15">
                            <div class="card-body">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <form action="/doProfile" method="post">
                                                <div class="form-group">
                                                    <label>User Name</label>
                                                    <input class="form-control" id="user_name" name="user_name"
                                                           type="text" value="${sysUser.getUname()}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Age</label>
                                                    <input class="form-control" id="age" name="user_age" type="text"
                                                           value="${sysUser.getUage()}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>E-mail</label>
                                                    <input class="form-control" id="user_email" name="user_email"
                                                           placeholder="example@xx.com"
                                                           type="text" value="${sysUser.getUemail()}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>TEL</label>
                                                    <input class="form-control" id="user_tel" name="user_tel"
                                                           type="text" value="${sysUser.getUtel()}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Room ID</label>
                                                    <input class="form-control" id="user_room_id" name="user_room_id"
                                                           type="text" value="${sysUser.getRid()}"/>
                                                </div>
                                                <span class="text-center mt-4 font-weight-bold " id="valid"
                                                      style=" font-size: 15px;color: #f55959"></span>
                                                <br>
                                                <button type="submit" class="btn btn-light m-1 px-3" id="saveBtn">Submit
                                                </button>
                                            </form>
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end page-content-wrapper-->
        </div>
        <!--end page-wrapper-->
        <!--start overlay-->
        <div class="overlay toggle-btn-mobile"></div>
        <!--end overlay-->
    </div>
    <!-- end wrapper -->
    <!--start switcher-->
    <%@ include file="../layout/switcher.jsp" %>
</div>
</body>
</html>
<script>
    $("#saveBtn").click(function () {
        var user_name = $("#user_name").val();
        var age = $("#age").val();
        var user_email = $("#user_email").val();
        var user_tel = $("#user_tel").val();
        var user_room_id = $("#user_room_id").val();
        if (!user_name) {
            $("#valid").html("User Name can't be null!");
            return false;
        } else {
            if (!age) {
                $("#valid").html("Age can't be null!");
                return false;
            } else {
                if (!user_email) {
                    $("#valid").html("E-mail can't be null!");
                    return false;
                } else {
                    if (!isEmail(user_email)) {
                        $("#valid").html("E-mail format is incorrect!");
                        return false;
                    }
                    if (!user_tel) {
                        $("#valid").html("Tel can't be null!");
                        return false;
                    } else {
                        if (!isTel(user_tel) && !isPhone(user_tel)) {
                            $("#valid").html("Tel format is incorrect!");
                            return false;
                        }
                        if (!user_room_id) {
                            $("#valid").html("Room ID can't be null!");
                            return false;
                        }
                    }
                }
            }
        }
    });
</script>