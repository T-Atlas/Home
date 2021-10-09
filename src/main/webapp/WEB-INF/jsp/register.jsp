<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Smart home management system</title>
    <!--favicon-->
    <link href="/static/images/favicon-32x32.png" rel="icon" type="image/png"/>
    <!-- loader-->
    <link href="/static/css/pace.min.css" rel="stylesheet"/>
    <!--    <script src="../js/pace.min.js"></script>-->
    <script type="text/javascript" src="/static/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet"/>
    <!-- Icons CSS -->
    <link href="/static/css/icons.css" rel="stylesheet"/>
    <!-- App CSS -->
    <link href="/static/css/app.css" rel="stylesheet"/>
    <script src="/static/js/jquery.js" type="text/javascript"></script>

    <script src="/static/layui/layui.js"></script>
    <script src="/static/js/common.js"></script>
</head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <div class="section-authentication-register d-flex align-items-center justify-content-center">
        <div class="row">
            <div class="col-12 col-lg-10 mx-auto">
                <div class="card radius-15">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5">
                                <form action="/doRegister" id="registerForm" method="post">
                                    <div class="text-center">
                                        <img alt="" src="/static/images/logo-icon.png" width="80">
                                        <h3 class="mt-4 font-weight-bold">Create an Account</h3>
                                    </div>
                                    <div class="form-group mt-4">
                                        <label>User ID</label>
                                        <input class="form-control" id="user_id" name="user_id"
                                               placeholder="Please enter numbers"
                                               type="text"/>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6 col-xl-12">
                                            <label>User Name</label>
                                            <input class="form-control" id="user_name" name="user_name" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <div class="input-group" id="show_hide_password">
                                            <input class="form-control border-right-0" id="passWord"
                                                   name="user_password" type="password" value="">
                                            <div class="input-group-append">
                                                <a class="input-group-text border-left-0" href="javascript:;">
                                                    <i class='bx bx-hide'></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Age</label>
                                        <input class="form-control" id="age" name="user_age" type="text"/>
                                    </div>
                                    <div class="form-group">
                                        <label>E-mail</label>
                                        <input class="form-control" id="user_email" name="user_email"
                                               placeholder="example@xx.com"
                                               type="text"/>
                                    </div>

                                    <div class="form-group">
                                        <label>TEL</label>
                                        <input class="form-control" id="user_tel" name="user_tel" type="text"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Room ID</label>
                                        <input class="form-control" id="user_room_id" name="user_room_id" type="text"/>
                                    </div>
                                    <span class="text-center mt-4 font-weight-bold " id="valid"
                                          style=" font-size: 15px;color: #f55959">
                                        <c:if test="${error != null }">
                                            <span>User ID Already exist</span>
                                        </c:if>
                                    </span>
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="user_check"
                                                       class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">I read and agree
                                                    to <a href="/terms_conditions">Terms of Service</a> & <a
                                                            href="/privacy_policy">Privacy Policy</a></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-group mt-3 w-100">
                                        <button class="btn btn-light btn-block" id="registerBtn" type="submit">
                                            Register
                                        </button>
                                        <button class="btn btn-light" type="submit">
                                            <i class="lni lni-arrow-right" style="margin-top:-0.6rem;"></i>
                                        </button>
                                    </div>
                                    <hr/>
                                    <div class="text-center mt-4">
                                        <p class="mb-0">Already have an account? <a href="/login">Login</a>
                                        </p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img alt="..." class="card-img login-img h-100"
                                 src="/static/images/login-images/register-frent-img.jpg">
                        </div>
                    </div>
                    <!--end row-->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end wrapper -->
<!-- JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/js/jquery.js"></script>
<!--Password show & hide js -->
<script>
    $(document).ready(function () {
        $("#show_hide_password a").on('click', function (event) {
            event.preventDefault();
            if ($('#show_hide_password input').attr("type") == "text") {
                $('#show_hide_password input').attr('type', 'password');
                $('#show_hide_password i').addClass("bx-hide");
                $('#show_hide_password i').removeClass("bx-show");
            } else if ($('#show_hide_password input').attr("type") == "password") {
                $('#show_hide_password input').attr('type', 'text');
                $('#show_hide_password i').removeClass("bx-hide");
                $('#show_hide_password i').addClass("bx-show");
            }
        });
    });

</script>
<script src="/static/js/jquery.js" type="text/javascript"></script>
<script src="/static/js/registervalid.js" type="text/javascript"></script>
</body>

</html>