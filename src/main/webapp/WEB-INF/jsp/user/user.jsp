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
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="key-word">
                                    <div class="input-group-append">
                                        <button class="btn btn-light" type="button" id="search">Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered mb-0" id="table1">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col">User ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">E-mail</th>
                                    <th scope="col">Tel</th>
                                    <c:if test="${utype==0}">
                                        <th scope="col">Room ID</th>
                                    </c:if>
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
    <tr data-id="{{ item.uid }}">
        <td>{{ item.uid }}</td>
        <td>{{ item.uname }}</td>
        <td>{{ item.uage }}</td>
        <td>{{ item.uemail }}</td>
        <th>{{ item.utel }}</th>
        <c:if test="${utype==0}">
            <th>{{ item.rid }}</th>
        </c:if>
        <td>
            <div class="btn-group pull-right">
                <button type="button" class="btn btn-light m-1 px-3 edit">Edit</button>
                <button type="button" class="btn btn-light m-1 px-3 del">Delete</button>
                <button type="button" class="btn btn-light m-1 px-3 restPwd">Rest Password</button>
            </div>
        </td>
    </tr>
    {{#  }) }}
</script>
<script id="form_html" type="text/html">
    <div class="layui-card-body">
        <form class="layui-form">
            <input type="hidden" name="utype" value="${utype}">
            {{# if(d.uid==''){ }}
            <div class="layui-form-item">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-block">
                    <input type="text" name="uid" class="layui-input"
                           value="{{ d.uid }}" lay-verify="required">
                </div>
            </div>
            {{# }else{}}
            <input type="hidden" name="uid" value="{{ d.uid }}">
            <input type="hidden" name="edit" value="true">
            {{# }}}
            <div class="layui-form-item">
                <label class="layui-form-label">Name</label>
                <div class="layui-input-block">
                    <input type="text" name="uname" class="layui-input"
                           value="{{ d.uname }}" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Age</label>
                <div class="layui-input-block">
                    <input type="text" name="uage" class="layui-input" value="{{ d.uage }}"
                           lay-verify="required|number">
                </div>
            </div>
            {{# if(d.uid==''){ }}
            <div class="layui-form-item">
                <label class="layui-form-label">Password</label>
                <div class="layui-input-block">
                    <input type="password" name="upassword" class="layui-input" value="{{ d.upassword }}"
                           lay-verify="required|pass">
                </div>
            </div>
            {{# }}}
            <div class="layui-form-item">
                <label class="layui-form-label">E-mail</label>
                <div class="layui-input-block">
                    <input type="text" name="uemail" class="layui-input" value="{{ d.uemail }}"
                           lay-verify="required|email">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Tel</label>
                <div class="layui-input-block">
                    <input type="text" name="utel" class="layui-input" value="{{ d.utel }}"
                           lay-verify="required|phone">
                </div>
            </div>
            <c:if test="${utype==0}">
                <div class="layui-form-item">
                    <label class="layui-form-label">Room ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="rid" class="layui-input" value="{{ d.rid }}"
                               lay-verify="required|number">
                    </div>
                </div>
            </c:if>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="form">Submit</button>
                    <button type="button" class="layui-btn layui-btn-primary form_close">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</script>
<script id="pwd_form_html" type="text/html">
    <div class="layui-card-body">
        <form class="layui-form">
            <input type="hidden" name="id" value="{{ d.id }}">
            <div class="layui-form-item">
                <label class="layui-form-label">Password</label>
                <div class="layui-input-block">
                    <input type="text" name="password" class="layui-input" value="{{ d.password }}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="pwd_form">Submit</button>
                    <button type="button" class="layui-btn layui-btn-primary form_close">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</script>
<script>
    layui.use(['form', 'layer', 'laytpl', 'laypage'], function () {
        const layer = layui.layer, laytpl = layui.laytpl, laypage = layui.laypage, form = layui.form, defaultValue = {
            uid: '',
            uname: '',
            upassword: '',
            utel: '',
            utype: '',
            uemail: '',
            uage: '',
            rid: ''
        };
        var page = 1;

        const getList = function () {
            ajax({
                url: "../user/getList",
                data: {keyWord: $('#key-word').val(), page: page, limit: 10, type: '${utype}'},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#list').html()).render(res.data, function (html) {
                            $('#view').html(html);
                            form.render();
                            edit();
                            del();
                            restPwd();
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
                    url: "../user/info",
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
            ],
            email: [
                /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
                'Incorrect email format'
            ],
            phone: [
                /^[1][3,4,5,7,8][0-9]{9}$/,
                'Incorrect mobile number format'
            ],
            pass: [
                /^[A-Za-z0-9]+$/,
                'Password must be English or digits'
            ]
        });

        const del = function () {
            $('.del').click(function () {
                const id = $(this).parents('tr:first').data('id');
                layer.confirm('Are you sure you want to delete it?', {btn: ['YES', 'NO'], icon: 3}, function () {
                    ajax({
                        url: "../user/del",
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

        const restPwd = function () {
            $('.restPwd').click(function () {
                const id = $(this).parents('tr:first').data('id');
                layer.open({
                    type: 1,
                    title: 'Reset Password',
                    area: '500px',
                    content: laytpl($('#pwd_form_html').html()).render({id: id, password: guid().substring(0, 8)}),
                    success: function (layero, index) {
                        form.render();
                        $('.form_close').click(function () {
                            layer.close(index);
                        });
                    }
                });
            });
        }

        form.on('submit(form)', function (data) {
            ajax({
                url: "../user/save",
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

        form.on('submit(pwd_form)', function (data) {
            ajax({
                url: "../user/editUserPwd",
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