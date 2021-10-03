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
                                    <div class="col-12 col-lg-6 border-right">
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
                                                <h5 class="mb-0">User ID: <%= sysUser.getUid() %>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <div class="d-md-flex align-items-center">
                                            <div class="ml-md-4 flex-grow-1">
                                                <div class="d-flex align-items-center mb-1">
                                                    <ul class="nav nav-pills">
                                                        <li class="nav-item">
                                                            <a class="nav-link">
                                                                <a class="dropdown-item" href="/user/editprofile">
                                                                    <i class="bx bx-cog"></i><span>Edit Profile</span>
                                                                </a>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end row-->
                                <div class="tab-content mt-3">
                                    <div class="card shadow-none border mb-0 radius-15">
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12 col-lg-4">
                                            <div class="card radius-15">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <h2 class="mb-0 text-white"><%= sysUser.getUname() %><i
                                                                    class=' font-14 text-white'></i></h2>
                                                        </div>
                                                        <div class="ml-auto font-35 text-white"><i
                                                                class="bx bx-user"></i>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <div>
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
                                                            <h2 class="mb-0 text-white">******<i
                                                                    class=' font-14 text-white'></i></h2>
                                                        </div>
                                                        <div class="ml-auto font-35 text-white"><i
                                                                class="bx bx-key"></i>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <p class="mb-0 text-white">Password</p>
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
                                                            <h2 class="mb-0 text-white"><%= sysUser.getUemail() %><i
                                                                    class=' font-14 text-white'></i></h2>
                                                        </div>
                                                        <div class="ml-auto font-35 text-white"><i
                                                                class="bx bx-mail-send"></i>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <p class="mb-0 text-white">User Email</p>
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
                                                            <h2 class="mb-0 text-white"><%= sysUser.getUtel() %><i
                                                                    class=' font-14 text-white'></i></h2>
                                                        </div>
                                                        <div class="ml-auto font-35 text-white"><i
                                                                class="bx bx-phone-call"></i>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <p class="mb-0 text-white">Phone</p>
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
                                                            <h2 class="mb-0 text-white"><%= sysUser.getRid() %><i
                                                                    class=' font-14 text-white'></i></h2>
                                                        </div>
                                                        <div class="ml-auto font-35 text-white"><i
                                                                class="bx bx-home"></i>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <p class="mb-0 text-white">Room ID</p>
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
                                                            <h2 class="mb-0 text-white"><%= sysUser.getUage() %><i
                                                                    class=' font-14 text-white'></i></h2>
                                                        </div>
                                                        <div class="ml-auto font-35 text-white"><i
                                                                class="bx bx-face"></i>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <p class="mb-0 text-white">Age</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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