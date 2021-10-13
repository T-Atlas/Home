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
                        <div class="col-12 col-lg-6">
                            <div class="media align-items-center">
                                <div class="col px-md-5 media align-items-center" id="he-plugin-standard"></div>
                                <div class="col px-md-5 media align-items-center">
                                    <button class="btn btn-light" type="button" id="refresh" style="float: right;">
                                        Update current information
                                    </button>
                                </div>
                            </div>
                        </div>
                        <script>
                            WIDGET = {
                                "CONFIG": {
                                    "layout": "1",
                                    "width": 450,
                                    "height": 150,
                                    "background": "1",
                                    "dataColor": "FFFFFF",
                                    "language": "en",
                                    "borderRadius": "5",
                                    "key": "347841292bd54500b323fd42c3555196"
                                }
                            }
                        </script>
                        <script src="https://widget.qweather.net/standard/static/js/he-standard-common.js?v=2.0"></script>
                    </div>
                    <br>
                    <div class="row" id="view">
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

        $('#refresh').click(function () {
            location.reload();
        });

        setInterval(function () {
            get();
        }, 60000);

        get();
    });
</script>