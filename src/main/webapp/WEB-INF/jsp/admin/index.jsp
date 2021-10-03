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
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="card radius-15">
                                <div class="card-body">
                                    <div class="media align-items-center">
                                        <div class="font-35 text-white">
                                            <i class="lni lni-timer"></i>&nbsp;
                                        </div>
                                        <div class="media-body">
                                            <h2 class="mb-0 font-weight-bold text-white" id="timeShow"></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="card-body">
                                <div class="media align-items-center">
                                    <button class="btn btn-light" type="button" id="refresh" style="float: right;">
                                        Update
                                        current information
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row" id="view">
                    </div>
                    <div class="card-deck flex-column flex-lg-row">
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5 class="mb-0">Light Top10</h5>
                                </div>
                                <div id="lightTop">
                                </div>
                            </div>
                        </div>
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5 class="mb-0">Door Top10</h5>
                                </div>
                                <div id="doorTop">
                                </div>
                            </div>
                        </div>
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5 class="mb-0">Sensor Top10</h5>
                                </div>
                                <div id="sensorTop">
                                </div>
                            </div>
                        </div>
                        <div class="card radius-15">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5 class="mb-0">Fans Top10</h5>
                                </div>
                                <div id="fansTop">
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
<script id="list" type="text/html">
    {{#  layui.each(d, function(index, item){ }}
    <div class="col-12 col-lg-3">
        <div class="card radius-15">
            <div class="card-body text-center">
                <div class="widgets-icons mx-auto rounded-circle">
                    {{# if(item.typeId==1){ }}
                    <i class="bx bx-bulb"></i>
                    {{# }else if(item.typeId==2){ }}
                    <i class="bx bx-door-open"></i>
                    {{# }else if(item.typeId==3){ }}
                    <i class="bx bx-send"></i>
                    {{# }else{ }}
                    <i class="lni lni-shuffle"></i>
                    {{# } }}
                </div>
                <h2 class="mb-0 font-weight-bold mt-3 text-white">{{item.c}}</h2>
                <p class="mb-0 text-white">{{item.fName}}</p>
            </div>
        </div>
    </div>
    {{#  }) }}
</script>
<script id="top" type="text/html">
    {{#  layui.each(d, function(index, item){ }}
    {{# if(index==0){ }}
    <hr>
    <div class="media align-items-center">
        <div class="media-body ml-3">
            <p class="mb-0">Room ID</p>
        </div>
        <p class="mb-0">Count</p>
    </div>
    {{# } }}
    <hr>
    <div class="media align-items-center">
        <div class="media-body ml-3">
            <p class="mb-0">{{ item.rId }}</p>
        </div>
        <p class="mb-0">{{ item.c }}</p>
    </div>
    {{#  }) }}
</script>
<script>
    layui.use(['layer', 'laytpl', 'laypage',], function () {
        const laytpl = layui.laytpl;

        const get = function () {
            ajax({
                url: "../factory/getCountByTypeId",
                data: {},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#list').html()).render(res.data, function (html) {
                            $('#view').html(html);
                        });
                    }
                }
            })
        };

        const lightTop = function () {
            ajax({
                url: "../light/getTopRoomCount",
                data: {},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#top').html()).render(res.data, function (html) {
                            $('#lightTop').html(html);
                        });
                    }
                }
            })
        };

        const doorTop = function () {
            ajax({
                url: "../door/getTopRoomCount",
                data: {},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#top').html()).render(res.data, function (html) {
                            $('#doorTop').html(html);
                        });
                    }
                }
            })
        };

        const sensorTop = function () {
            ajax({
                url: "../sensor/getTopRoomCount",
                data: {},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#top').html()).render(res.data, function (html) {
                            $('#sensorTop').html(html);
                        });
                    }
                }
            })
        };

        const fansTop = function () {
            ajax({
                url: "../fans/getTopRoomCount",
                data: {},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#top').html()).render(res.data, function (html) {
                            $('#fansTop').html(html);
                        });
                    }
                }
            })
        };

        $('#refresh').click(function () {
            location.reload();
        });

        setInterval(function () {
            get();
            lightTop();
            doorTop();
            sensorTop();
            fansTop();
        }, 60000);

        get();
        lightTop();
        doorTop();
        sensorTop();
        fansTop();
    });
</script>