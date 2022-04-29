<%@ page import="com.g65.entity.UserEntity" %>
<%@ page import="com.g65.util.Constants" %><%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2021/7/6
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%--this page is door--%>
<!DOCTYPE html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<%--    <%--%>
<%--        String path = request.getContextPath();--%>
<%--        String basePath = request.getScheme() + "://" + request.getServerName() + path + "/";--%>
<%--    %>--%>
    <base href="<%=basePath%>">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Smart home management system</title>
    <!--favicon-->
    <link rel="icon" href="<%=basePath%>assets/images/favicon-32x32.png" type="image/png" />
    <!-- Vector CSS -->
    <link href="<%=basePath%>assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!--plugins-->
    <link href="<%=basePath%>assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="<%=basePath%>assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="<%=basePath%>assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
    <link href="<%=basePath%>assets/plugins/apexcharts-bundle/css/apexcharts.css" rel="stylesheet" />
    <!-- loader-->
    <link href="<%=basePath%>assets/css/pace.min.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css" />
    <!-- Icons CSS -->
    <link rel="stylesheet" href="<%=basePath%>assets/css/icons.css" />
    <!-- App CSS -->
    <link rel="stylesheet" href="<%=basePath%>assets/css/app.css" />


</head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <!--sidebar-wrapper-->
    <div class="sidebar-wrapper" data-simplebar="true">
        <div class="sidebar-header">
            <div class="">
                <img src="${pageContext.request.contextPath }/assets/images/logo-icon.png" class="logo-icon-2" alt="" />
            </div>
            <div>
                <h4 class="logo-text">Smart Home</h4>
            </div>
            <a href="javascript:" class="toggle-btn ml-auto"> <i class="bx bx-menu"></i>
            </a>
        </div>
        <!--navigation-->
        <ul class="metismenu" id="menu">
            <li>
                <a href="./pages/index.jsp" >
                    <div class="parent-icon"><i class="bx bx-home-alt"></i>
                    </div>
                    <div class="menu-title">
                        <%
                        UserEntity user = (UserEntity) session.getAttribute(Constants.USER_SESSION);
                        String username = user.getuName();
                        %>
                        <%= username %>
                    </div>
                </a>
            </li>
            <li class="menu-label">Device</li>
            <li>
  <a href="./pages/environmental.jsp">
                    <div class="parent-icon"><i class="bx bx-planet"></i>
                    </div>
                    <div class="menu-title">Environmental monitoring</div>
                </a>
            </li>
            <li>
                <a href="./pages/content-grid-system.jsp">
                    <div class="parent-icon"> <i class="bx bx-bulb"></i>
                    </div>
                    <div class="menu-title">Light</div>
                </a>
            </li>
            <li>
                <a href="./pages/charts-apex-chart.jsp">
                    <div class="parent-icon"><i class="bx bx-door-open"></i>
                    </div>
                    <div class="menu-title">Door</div>
                </a>
            </li>
            <li>
                <a href="./pages/charts-chartjs.jsp">
                    <div class="parent-icon"><i class="bx bx-send"></i>
                    </div>
                    <div class="menu-title">Sensor</div>
                </a>
            </li>
            <li class="menu-label">Log</li>
            <li>
                <a href="./pages/table-basic-table.jsp">
                    <div class="parent-icon"> <i class="bx bx-time-five"></i>
                    </div>
                    <div class="menu-title">State</div>
                </a>
            </li>
            <li>
                <a href="./pages/to-do.jsp">
                    <div class="parent-icon"><i class="bx bx-task"></i>
                    </div>
                    <div class="menu-title">To do List</div>
                </a>
            </li>
            <li>
                <a href="./pages/fullcalender.jsp">
                    <div class="parent-icon"> <i class="bx bx-calendar-check"></i>
                    </div>
                    <div class="menu-title">Calendar</div>
                </a>
            </li>
            <li class="menu-label">User</li>
            <li>
                <a href="./pages/user-profile.jsp">
                    <div class="parent-icon"><i class="bx bx-user-circle"></i>
                    </div>
                    <div class="menu-title">User Profile</div>
                </a>
            </li>
        </ul>
        <!--end navigation-->
    </div>
    <!--end sidebar-wrapper-->
    <!--header-->
    <header class="top-header">
        <nav class="navbar navbar-expand">
            <div class="left-topbar d-flex align-items-center">
                <a href="javascript:" class="toggle-btn">	<i class="bx bx-menu"></i>
                </a>
            </div>
            <div class="flex-grow-1 search-bar">
            </div>
            <div class="right-topbar ml-auto">
                <ul class="navbar-nav">
                    <li class="nav-item search-btn-mobile">
                        <a class="nav-link position-relative" href="javascript:">	<i class="bx bx-search vertical-align-middle"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown dropdown-user-profile">
                        <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:" data-toggle="dropdown">
                            <div class="media user-box align-items-center">
                                <div class="media-body user-info">
                                    <p class="user-name mb-0"><%= username %></p>
                                </div>
                                <img src="${pageContext.request.contextPath }/assets/images/avatars/avatar-1.png" class="user-img" alt="user avatar">
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">	<a class="dropdown-item" href="<%=basePath%>user-profile.jsp"><i
                                class="bx bx-user"></i><span>Profile</span></a>
                            <form  action="./logout"  method="post" >
                                <div class="dropdown-divider mb-0"></div>
                                <button type="submit" class="dropdown-item"><i
                                        class="bx bx-power-off"></i>Logout</button>
                            </form>

                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!--end header-->
    <!--page-wrapper-->
    <div class="page-wrapper">
        <!--page-content-wrapper-->
        <div class="page-content-wrapper">
            <div class="page-content">
                <!--breadcrumb-->
                <div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
                    <div class="breadcrumb-title pr-3">Door</div>
                    <div class="pl-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 p-0">
                                <li class="breadcrumb-item"><a href="./pages/index.jsp"><i class='bx bx-home-alt'></i></a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">close and lock</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!--end breadcrumb-->
                <div class="card radius-15">
                    <div class="card-body">
                        <div class="card-title">
                            <h4 class="mb-0">Door State</h4>
                        </div>
                        <hr/>
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">door ID</th>
                                    <th scope="col">is_close</th>
                                    <th scope="col">is_lock</th>
                                </tr>
                                </thead>
<%--                                <tbody>--%>
<%--                                    <%--%>
<%--                                    UserEntity user = (UserEntity) session.getAttribute("user");--%>
<%--                                    int userId = user.getuId();--%>
<%--                                    session.setAttribute("user", user);--%>
<%--                                    DoorService doorService = new DoorServiceImpl();--%>
<%--                                    ArrayList<DoorEntity> list = doorService.getExistDoor(userId);--%>
<%--                                  System.out.println(user);--%>
<%--                                   System.out.println(list.size());--%>
<%--                                    System.out.println(user);--%>

<%--                                    int i = 1;--%>
<%--                                    for(DoorEntity door : list){--%>
<%--                                    %>--%>
<%--                                <tr>--%>
<%--                                    <th scope="row"> <%= i %> </th>--%>
<%--                                    <td> <%= door.getDoorId() %> </td>--%>
<%--                                    <td> <%= door.getDoorColse() %> </td>--%>
<%--                                    <td> <%= door.getDoorLock() %> </td>--%>
<%--                                </tr>--%>
<%--                                    <%--%>
<%--                                            i++;--%>
<%--                                    }--%>
<%--                                %>--%>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td><%= 123 %></td>
                                    <td><%= 1  %> </td>
                                    <td><%= 1  %></td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td><%= 456 %></td>
                                    <td><%= 1  %></td>
                                    <td><%= 0 %></td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td><%= 789  %></td>
                                    <td><%= 0  %></td>
                                    <td><%= 0  %></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end page-content-wrapper-->
    </div>
    <!--end row-->
</div>
</div>
<!--end page-content-wrapper-->
</div>
<!--end page-wrapper-->
<!--start overlay-->
<div class="overlay toggle-btn-mobile"></div>
<!--end overlay-->
<!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
<!--End Back To Top Button-->
</div>
<!-- end wrapper -->
<!--start switcher-->
<div class="switcher-wrapper">
    <div class="switcher-btn"> <i class='bx bx-cog bx-spin'></i>
    </div>
    <div class="switcher-body">
        <h5 class="mb-0 text-uppercase">Theme Customizer</h5>
        <hr/>
        <p class="mb-0">Gaussion Texture</p>
        <hr>

        <ul class="switcher">
            <li id="theme1"></li>
            <li id="theme2"></li>
            <li id="theme3"></li>
            <li id="theme4"></li>
            <li id="theme5"></li>
            <li id="theme6"></li>
        </ul>
        <hr>
        <p class="mb-0">Gradient Background</p>
        <hr>

        <ul class="switcher">
            <li id="theme7"></li>
            <li id="theme8"></li>
            <li id="theme9"></li>
            <li id="theme10"></li>
            <li id="theme11"></li>
            <li id="theme12"></li>
        </ul>
    </div>
</div>
<!--end switcher-->
<!-- JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="<%=basePath%>assets/js/jquery.min.js"></script>
<script src="<%=basePath%>assets/js/popper.min.js"></script>
<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<!--plugins-->
<script src="<%=basePath%>assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="<%=basePath%>assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="<%=basePath%>assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
<script src="<%=basePath%>assets/plugins/apexcharts-bundle/js/apex-custom.js"></script>
<!-- App JS -->
<script src="<%=basePath%>assets/js/app.js"></script>
</body>

</html>