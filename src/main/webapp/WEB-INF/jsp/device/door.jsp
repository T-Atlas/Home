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
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_length">
                                    <button type="button" class="btn btn-light m-1 px-3" id="add">Add</button>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2">
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <c:if test="${sysUser.getUtype()==1}">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" id="key-word" placeholder="Room ID">
                                        <div class="input-group-append">
                                            <button class="btn btn-light" type="button" id="search">Search</button>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered mb-0" id="table1">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col">Device ID</th>
                                    <th scope="col">Locked</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Location</th>
                                    <c:if test="${sysUser.getUtype()==1}">
                                        <th scope="col">Room ID</th>
                                    </c:if>
                                    <th scope="col">Anomalies</th>
                                    <th>Operation</th>
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
    <tr data-id="{{ item.deviceid }}" data-typeid="{{ item.typeid }}">
        <td>{{ item.deviceid }}</td>
        <td>{{ item.isLock==0?'Locked':'Unlocked' }}</td>
        <td>{{ item.isClose==0?'Open':'Close' }}</td>
        <td>{{ item.location }}</td>
        <c:if test="${sysUser.getUtype()==1}">
            <th>{{ item.rid }}</th>
        </c:if>
        <td>{{ item.isLock==0&&item.isClose==0?'Intrusion':'None' }}</td>
        <td>
            <div class="btn-group pull-right">
                <button type="button" class="btn btn-light m-1 px-3 edit">Edit</button>
                <button type="button" class="btn btn-light m-1 px-3 del">Delete</button>
                <button type="button" class="btn btn-light m-1 px-3 insView">Instruction</button>
            </div>
        </td>
    </tr>
    {{#  }) }}
</script>
<script id="form_html" type="text/html">
    <div class="layui-card-body">
        <form class="layui-form">
            <input type="hidden" name="deviceid" value="{{ d.deviceid }}">
            <input type="hidden" name="typeid" value="{{ d.typeid }}">
            <div class="layui-form-item">
                <label class="layui-form-label">Status</label>
                <div class="layui-input-block">
                    <input type="radio" name="is_close" value="0" title="Open" {{ d.isClose=='0'?'checked':'' }}>
                    <input type="radio" name="is_close" value="1" title="Close" {{ d.isClose=='1'?'checked':'' }}>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Locked</label>
                <div class="layui-input-block">
                    <input type="radio" name="is_lock" value="0" title="Locked" {{ d.isLock=='0'?'checked':'' }}>
                    <input type="radio" name="is_lock" value="1" title="Unlocked" {{ d.isLock=='1'?'checked':'' }}>
                </div>
            </div>
            <c:if test="${sysUser.getUtype()==1}">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px;">Room ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="rid" class="layui-input" value="{{ d.rid }}"
                               lay-verify="required|number">
                    </div>
                </div>
            </c:if>
            <c:if test="${sysUser.getUtype()==0}">
                <input type="hidden" name="rid" value="${sysUser.getRid()}">
            </c:if>
            <div class="layui-form-item">
                <label class="layui-form-label">Location</label>
                <div class="layui-input-block">
                    <input type="text" name="location" class="layui-input"
                           value="{{ d.location }}" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="form">Submit</button>
                    <button type="button" class="layui-btn layui-btn-primary form_close">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</script>
<script id="ins_html" type="text/html">
    <div class="layui-card-body" style="color: black;">
        {{d}}
    </div>
</script>
<script>
    layui.use(['form', 'layer', 'laytpl', 'laypage'], function () {
        const layer = layui.layer, laytpl = layui.laytpl, laypage = layui.laypage, form = layui.form, defaultValue = {
            deviceid: '',
            isLock: 0,
            isClose: 0,
            location: '',
            typeid: 1,
            rid: ''
        };
        var page = 1;

        const getList = function () {
            ajax({
                url: "../door/getList",
                data: {keyWord: $('#key-word').val(), page: page, limit: 10},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#list').html()).render(res.data, function (html) {
                            $('#view').html(html);
                            form.render();
                            edit();
                            del();
                            insView();
                        });

                        laypage.render({
                            elem: 'page',
                            curr: page,
                            count: res.data.total,
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

        $('#add').click(function () {
            layer.open({
                type: 1,
                title: 'Add',
                area: '500px',
                content: laytpl($('#form_html').html()).render(defaultValue),
                success: function (layero, index) {
                    form.render();
                    $('.form_close').click(function () {
                        layer.close(index);
                    });
                }
            });
        });

        $('#search').click(function () {
            page = 1;
            getList();
        });

        $('#key-word:enabled').bind('keypress', function (e) {
            if (e.keyCode === 13) {
                page = 1;
                getList();
            }
        });

        const edit = function () {
            $('.edit').click(function () {
                const id = $(this).parents('tr:first').data('id');
                ajax({
                    url: "../door/info",
                    data: {id: id},
                    success: function (res) {
                        if (res.code > 0) {
                            layer.open({
                                type: 1,
                                title: 'Edit',
                                area: '500px',
                                content: laytpl($('#form_html').html()).render(res.data),
                                success: function (layero, index) {
                                    form.render();
                                    $('.form_close').click(function () {
                                        layer.close(index);
                                    });
                                }
                            });
                        } else {
                            layer.msg("Request failed, try again!", {icon: 2});
                        }
                    }
                })
            });
        }

        form.verify({
            number: [
                /^([1-9]\d*|[0]{1,1})$/,
                'Must be digital number'
            ]
        });

        const del = function () {
            $('.del').click(function () {
                const id = $(this).parents('tr:first').data('id');
                layer.confirm('Are you sure you want to delete it?', {btn: ['YES', 'NO'], icon: 3}, function () {
                    ajax({
                        url: "../door/del",
                        data: {id: id},
                        success: function (res) {
                            if (res.code > 0) {
                                layer.closeAll();
                                layer.msg("Deleted successfully!", {icon: 1});
                                getList();
                            } else {
                                layer.msg("Failed to delete, please try again!", {icon: 2});
                            }
                        }
                    })
                });
            });
        }

        const insView = function () {
            $('.insView').click(function () {
                const typeid = $(this).parents('tr:first').data('typeid');
                ajax({
                    url: "../factory/info",
                    data: {id: typeid},
                    success: function (res) {
                        if (res.code > 0) {
                            layer.open({
                                type: 1,
                                title: 'Information',
                                area: '500px',
                                content: laytpl($('#ins_html').html()).render(res.data.instruction),
                                success: function (layero, index) {
                                }
                            });
                        } else {
                            layer.msg("Request failed, try again!", {icon: 2});
                        }
                    }
                })
            });
        }

        form.on('submit(form)', function (data) {
            if (data.field.is_close == 0 && data.field.is_lock == 0) {
                layer.msg('Must be closed before locking', {icon: 2});
                return false;
            }
            ajax({
                url: "../door/save",
                data: data.field,
                success: function (res) {
                    if (res.code > 0) {
                        layer.closeAll();
                        getList();
                    }
                    layer.msg(res.msg, {icon: res.code > 0 ? 1 : 2});
                }
            })
            return false;
        });

        getList();
    });
</script>