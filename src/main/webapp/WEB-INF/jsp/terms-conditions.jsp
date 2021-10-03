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
</head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <div class="page-content">
        <div class="row">
            <div class="section-authentication-register d-flex align-items-center justify-content-center">
                <div class="col-12 col-lg-10 mx-auto">
                    <div class="card radius-15">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-lg-12" style="text-align: center;"><h2>用户使用协议</h2></div>
                            </div>
                            <p>
                                本次版本更新时间：2021年【9】月【30】日

                                【首部及导言】

                                《哔哩哔哩弹幕网用户使用协议》（以下简称“本协议”）是您与哔哩哔哩之间关于使用哔哩哔哩各项服务的法律协议。“哔哩哔哩”是指哔哩哔哩弹幕网的运营公司上海宽娱数码科技有限公司及其关联公司。

                                本协议中与您的权益（可能）存在重大关系的条款（包括免除哔哩哔哩责任的条款、限制您权利的条款、争议解决条款及司法管辖条款等），哔哩哔哩已采用字体加粗的方式来特别提醒您，请您留意重点查阅。请您确保您在使用哔哩哔哩服务前已仔细阅读、充分理解并毫无保留地接受本协议所有条款。

                                《哔哩哔哩隐私政策》、《帮助中心》、《社区规则》、《小黑屋处罚条例》以及哔哩哔哩公布的其他协议规范、规则、声明、公告、政策等（以下统称“其他哔哩哔哩规则”）是本协议不可分割的组成部分，您在使用哔哩哔哩服务时应同样遵守。您接受并同意本协议的行为即视为您同意并接受其他哔哩哔哩规则，您接受并同意任一其他哔哩哔哩规则的行为亦视为您接受并同意本协议。

                                您确认您具备完全民事权利能力和完全民事行为能力，有能力同意并遵守本协议，并对您本协议项下的全部行为独立承担法律责任。若您不具备前述与您行为相适应的民事行为能力，则应获得法定监护人的知情同意。如您尚未成年，请在法定监护人的陪同下阅读和判断是否同意本协议，请特别注意未成年人条款。未成年人行使和履行本协议项下的权利和义务视为已获得法定监护人的认可。
                            </p>
                            <button class="btn btn-light m-1 px-3" type="button" onclick="back()">Back
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end wrapper -->
</div>
</body>
</html>
<script>
    function back() {
        window.history.back();
    }
</script>