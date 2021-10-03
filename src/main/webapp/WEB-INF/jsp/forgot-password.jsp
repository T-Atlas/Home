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
    <script src="/static/js/common.js"></script>
</head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <div class="authentication-forgot d-flex align-items-center justify-content-center">
        <div class="card shadow-lg forgot-box">
            <div class="card-body p-md-5">
                <div class="text-center">
                    <img alt="" src="/static/images/icons/forgot-2.png" width="80"/>
                </div>
                <h4 class="mt-3 font-weight-bold text-white">Forgot Password?</h4>
                <form action="/resetPassword" method="post">
                    <div class="form-group mt-5">
                        <label>User ID</label>
                        <input class="form-control form-control-lg radius-30" id="user_id" name="user_id" type="text"/>
                        <label>User Name</label>
                        <input class="form-control form-control-lg radius-30" id="user_name" name="user_name"
                               type="text"/>
                        <label>User Tel</label>
                        <input class="form-control form-control-lg radius-30" id="user_TEL" name="user_teL"
                               type="text"/>
                        <label>New Password</label>
                        <input class="form-control form-control-lg radius-30" id="user_nPassword" name="user_password"
                               type="text"/>
                    </div>
                    <span class="text-center mt-4 font-weight-bold " id="valid" style=" font-size: 15px;color: #f55959">
                        <c:if test="${error != null }">
                            <span>Message doesn't match, can't change password!</span>
                        </c:if>
                    </span>
                    <button class="btn btn-light btn-lg btn-block radius-30" id="sendBtn" type="submit">
                        Send
                    </button>
                    <a class="btn btn-link btn-block" href="/login"><i class='bx bx-arrow-back mr-1'></i>Back to
                        Login</a>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- end wrapper -->
</body>
<script src="/static/js/jquery-3.6.0.js" type="text/javascript"></script>
<script src="/static/js/forgetpassword.js" type="text/javascript"></script>