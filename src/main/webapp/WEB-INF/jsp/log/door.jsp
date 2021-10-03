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
                <div class="table-responsive card-body">
                    <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4">
                        <div class="row">
                            <div class="col-sm-12 col-md-2">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Start Time</span>
                                    </div>
                                    <input type="text" class="form-control" id="starttime" placeholder="yyyy-MM-dd">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">End Time</span>
                                    </div>
                                    <input type="text" class="form-control" id="endtime" placeholder="yyyy-MM-dd">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Room ID</span>
                                    </div>
                                    <input type="text" class="form-control" id="rid">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Device ID</span>
                                    </div>
                                    <input type="text" class="form-control" id="deviceid">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2"></div>
                            <div class="col-sm-12 col-md-2">
                                <button class="btn btn-light" type="button" id="search" style="float: right;">Search
                                </button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered mb-0" id="table1">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col">Log ID</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Device ID</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Location</th>
                                    <th scope="col">Room ID</th>
                                </tr>
                                </thead>
                                <tbody id="view"></tbody>
                            </table>
                            <div id="page"></div>
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
    {{#  layui.each(d.list, function(index, item){ }}
    <tr>
        <td>{{ item.logid }}</td>
        <td>{{ item.time }}</td>
        <td>{{ item.deviceid }}</td>
        <td>{{ item.isClose==0?'Open':'Close' }}</td>
        <td>{{ item.location }}</td>
        <th>{{ item.rid }}</th>
    </tr>
    {{#  }) }}
</script>
<script>
    layui.use(['layer', 'laytpl', 'laypage', 'laydate'], function () {
        const laytpl = layui.laytpl, laypage = layui.laypage, laydate = layui.laydate;

        laydate.render({
            elem: '#starttime'
        });
        laydate.render({
            elem: '#endtime'
        });

        var page = 1;

        const getList = function () {
            ajax({
                url: "../log/getList",
                data: {
                    typeId: 2,
                    rId: $('#rid').val(),
                    deviceId: $('#deviceid').val(),
                    startTime: $('#starttime').val(),
                    endTime: $('#endtime').val(),
                    keyWord: $('#key-word').val(),
                    page: page,
                    limit: 10
                },
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#list').html()).render(res.data, function (html) {
                            $('#view').html(html);
                        });

                        laypage.render({
                            elem: 'page',
                            curr: page,
                            count: res.data.total,
                            layout: ['count', 'prev', 'page', 'next'],
                            jump: function (obj, first) {
                                if (!first) {
                                    page = obj.curr;
                                    getList();
                                }
                            }
                        });
                    }
                }
            })
        };

        $('#search').click(function () {
            page = 1;
            getList();
        });

        getList();
    });
</script>