<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2021/7/6
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Smart home management system</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.js"></script>
    <!--favicon-->
    <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
    <!-- loader-->
    <link href="assets/css/pace.min.css" rel="stylesheet" />
    <script src="assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- Icons CSS -->
    <link rel="stylesheet" href="assets/css/icons.css" />
    <!-- App CSS -->
    <link rel="stylesheet" href="assets/css/app.css" />
</head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <div class="authentication-forgot d-flex align-items-center justify-content-center">
        <div class="card shadow-lg forgot-box">
            <div class="card-body p-md-5">
                <div class="text-center">
                    <img src="assets/images/icons/forgot-2.png" width="80" alt="" />
                </div>
                <h4 class="mt-3 font-weight-bold text-white">Forgot Password?</h4>
                <form  action="./resetPassword"  method="post" >
                    <input type="hidden" name="method" value="forgetPassword">
                <div class="form-group mt-5">
                    <label>User ID</label>
                    <input type="text" name="user_id" id="user_id" class="form-control form-control-lg radius-30" />
                    <label>User Name</label>
                    <input type="text" name="user_name" id="user_name" class="form-control form-control-lg radius-30" />
                    <label>User Tel</label>
                    <input type="text" name="user_TEL" id="user_TEL" class="form-control form-control-lg radius-30" />
                    <label>New Password</label>
                    <input type="text" name="user_nPassword" id="user_nPassword" class="form-control form-control-lg radius-30" />
                </div>
                    <span id="valid" style=" font-size: 15px;color: #f55959" class="text-center mt-4 font-weight-bold "></span>
                <button type="submit" value="submit" id="sendBtn" class="btn btn-light btn-lg btn-block radius-30">Send</button> <a href="login.jsp" class="btn btn-link btn-block"><i class='bx bx-arrow-back mr-1'></i>Back to Login</a>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- end wrapper -->
</body>
<script type="text/javascript" src="assets/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="assets/js/forgetpassword.js"></script>

