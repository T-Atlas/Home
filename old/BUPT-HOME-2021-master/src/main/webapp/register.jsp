<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2021/7/6
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Smart home management system</title>
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
    <div class="section-authentication-register d-flex align-items-center justify-content-center">
        <div class="row">
            <div class="col-12 col-lg-10 mx-auto">
                <div class="card radius-15">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5">
                                <form action="./register" method="POST" id="registerForm">
                                    <div class="text-center">
                                        <img src="assets/images/logo-icon.png" width="80" alt="">
                                        <h3 class="mt-4 font-weight-bold">Create an Account</h3>
                                    </div>
                                    <div class="form-group mt-4">
                                        <label>User ID</label>
                                        <input type="text" name="user_id" id="user_id" class="form-control" placeholder="Please enter numbers" />
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6 col-xl-12">
                                            <label>User Name</label>
                                            <input type="text" name="user_name" id="user_name" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <div class="input-group" id="show_hide_password">
                                            <input class="form-control border-right-0" type="password" name="user_password" id="passWord" value="">
                                            <div class="input-group-append">	<a href="javascript:;" class="input-group-text border-left-0"><i class='bx bx-hide'></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Age</label>
                                        <input type="text" name="user_age" class="form-control" id="age"/>
                                    </div>
                                    <div class="form-group">
                                        <label>E-mail</label>
                                        <input type="text" class="form-control" name="user_email" id="user_email" placeholder="example@xx.com"/>
                                    </div>

                                    <div class="form-group">
                                        <label>TEL</label>
                                        <input type="text" name="user_tel" id="user_tel" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Room ID</label>
                                        <input type="text" name="user_room_id" id="user_room_id" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" value="checked" name="user_check"  class="custom-control-input" id="customCheck1">
                                            <label class="custom-control-label" for="customCheck1">I read and agree to Terms & Conditions</label>
                                        </div>
                                    </div>
                                    <span id="valid" style=" font-size: 15px;color: #f55959" class="text-center mt-4 font-weight-bold "></span>
                                    <div class="btn-group mt-3 w-100">
                                        <button type="submit" id="registerBtn" class="btn btn-light btn-block">Register</button>
                                        <button type="submit" class="btn btn-light"><i class="lni lni-arrow-right"></i>
                                        </button>
                                    </div>
                                    <hr/>
                                    <div class="text-center mt-4">
                                        <p class="mb-0">Already have an account? <a href="login.jsp">Login</a>
                                        </p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img src="assets/images/login-images/register-frent-img.jpg" class="card-img login-img h-100" alt="...">
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
<script src="assets/js/jquery.min.js"></script>
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
<script type="text/javascript" src="assets/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="assets/js/registervalid.js"></script>
</body>

</html>