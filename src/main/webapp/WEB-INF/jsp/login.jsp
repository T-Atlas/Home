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
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Icons CSS -->
    <link href="/static/css/icons.css" rel="stylesheet"/>
    <!-- App CSS -->
    <link href="/static/css/app.css" rel="stylesheet"/>
    <script src="/static/js/jquery-3.6.0.js" type="text/javascript"></script>
</head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <div class="section-authentication-login d-flex align-items-center justify-content-center">
        <div class="row">
            <div class="col-12 col-lg-10 mx-auto">
                <div class="card radius-15">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5">
                                <div class="text-center">
                                    <img alt="" src="/static/images/logo-icon.png" width="80">
                                    <h3 class="mt-4 font-weight-bold">Welcome Smart Home</h3>
                                </div>
                                <form action="/doLogin" method="post">
                                    <div class="form-group mt-4">
                                        <label>User ID</label>
                                        <input class="form-control" name="username" placeholder="Enter your User ID"
                                               type="text" id="userId"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" name="password" placeholder="Enter your password"
                                               type="password" id="passWord"/>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="user_check"
                                                       class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">I read and agree
                                                    to <a href="/terms_conditions">Terms & Conditions</a></label>
                                            </div>
                                        </div>
                                        <div class="form-group col text-right">
                                            <a href="/forgotpassword"><i class='bx bxs-key mr-2'></i>Forget
                                                Password?</a>
                                        </div>
                                    </div>
                                    <span class="text-center mt-4 font-weight-bold " id="valid"
                                          style=" font-size: 15px;color: #f55959">
                                        <c:if test="${error != null }">
                                            Account or password error
                                        </c:if>
                                    </span>
                                    <div class="btn-group mt-3 w-100">
                                        <button class="btn btn-light btn-block" type="submit" id="loginBtn">Log In
                                        </button>
                                        <button class="btn btn-light" type="submit">
                                            <i class="lni lni-arrow-right" style="margin-top:-0.6rem;"></i>
                                        </button>
                                    </div>
                                    <hr>
                                    <div class="text-center">
                                        <p class="mb-0">Don't have an account? <a href="/register">Sign up</a>
                                        </p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img alt="..." class="card-img login-img h-100"
                                 src="/static/images/login-images/login-frent-img.jpg">
                        </div>
                    </div>
                    <!--end row-->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end wrapper -->
</body>
<script src="/static/js/jquery-3.6.0.js" type="text/javascript"></script>
<script src="/static/js/loginvalid.js" type="text/javascript"></script>