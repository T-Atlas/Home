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
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="user-profile-page">
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 col-lg-12">
                                        <div class="d-md-flex align-items-center">
                                            <div class="mb-md-0 mb-5">
                                                <img src="/static/images/avatars/avatar-1.png"
                                                     class="rounded-circle shadow" width="130" height="130" alt=""/>
                                            </div>
                                            <div class="ml-md-4 flex-grow-1">
                                                <div class="d-flex align-items-center mb-1">
                                                    <h2 class="mb-0"><%= sysUser.getUname() %>
                                                    </h2>
                                                </div>
                                                <h5 class="mb-0">User Id: <%= sysUser.getUid() %>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <form action="/doProfile" method="post">
                                    <div class="tab-content mt-3">
                                        <div class="row">
                                            <div class="col-12 col-lg-4">
                                                <div class="card radius-15">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <div>
                                                                <input type="text"
                                                                       value=<%= sysUser.getUname() %> name="user_name"
                                                                       class="form-control" id="user_name">
                                                            </div>
                                                            <div class="ml-auto font-35 text-white"><i
                                                                    class="bx bx-user"></i>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex align-items-center">
                                                            <div>
                                                                <br>
                                                                <p class="mb-0 text-white">User Name</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-4">
                                                <div class="card radius-15">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <div>
                                                                <input type="text"
                                                                       value=<%= sysUser.getUemail() %> name="user_email"
                                                                       class="form-control" id="user_email">
                                                            </div>
                                                            <div class="ml-auto font-35 text-white"><i
                                                                    class="bx bx-mail-send"></i>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex align-items-center">
                                                            <div><br>
                                                                <p class="mb-0 text-white">User Email</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-4">
                                                <div class="card radius-15">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <div>
                                                                <input type="text"
                                                                       value=<%= sysUser.getUtel() %> name="user_tel"
                                                                       class="form-control" id="user_tel">
                                                            </div>
                                                            <div class="ml-auto font-35 text-white"><i
                                                                    class="bx bx-phone-call"></i>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex align-items-center">
                                                            <div><br>
                                                                <p class="mb-0 text-white">Tel</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-lg-4">
                                                <div class="card radius-15">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <div>
                                                                <input type="text"
                                                                       value=<%= sysUser.getUage() %> name="user_age"
                                                                       class="form-control" id="age">
                                                            </div>
                                                            <div class="ml-auto font-35 text-white"><i
                                                                    class="bx bx-face"></i>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex align-items-center">
                                                            <div><br>
                                                                <p class="mb-0 text-white">Age</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${sysUser.getUtype()==0}">
                                                <div class="col-12 col-lg-4">
                                                    <div class="card radius-15">
                                                        <div class="card-body">
                                                            <div class="d-flex align-items-center">
                                                                <div>
                                                                    <input type="text"
                                                                           value=<%= sysUser.getRid() %> name="user_room_id"
                                                                           class="form-control" id="user_room_id">
                                                                </div>
                                                                <div class="ml-auto font-35 text-white"><i
                                                                        class="bx bx-home"></i>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex align-items-center">
                                                                <div><br>
                                                                    <p class="mb-0 text-white">Room ID</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="row">
                                            <div class=" form-group col-md-4 ">
                                                <div style="text-align: center;">
                                                    <span style="font-size: 15px;color: red" id="valid"></span>
                                                </div>
                                                <br>
                                                <button type="submit" class="btn btn-block btn-light form-control"
                                                        id="saveBtn">
                                                    Submit
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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
                if (!isNum(age)) {
                    $("#valid").html("Age format is incorrect!");
                    return false;
                }
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
                        <c:if test="${sysUser.getUtype()==0}">
                        if (!user_room_id) {
                            $("#valid").html("Room ID can't be null!");
                            return false;
                        }
                        if (!isNum(user_room_id)) {
                            $("#valid").html("Room ID format is incorrect!");
                            return false;
                        }
                        </c:if>
                    }
                }
            }
        }
    });
</script>