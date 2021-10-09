<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Smart home management system</title>
</head>
<body>
<!--navigation-->
<ul class="metismenu" id="menu">
    <li>
        <a href="${sysUser.getUtype()==0?'/user/index':sysUser.getUtype()==1?'/admin/index':'/mfuser/index'}">
            <div class="parent-icon"><i class="bx bx-home-alt"></i>
            </div>
            <div class="menu-title">Home</div>
        </a>
    </li>
    <li class="menu-label">Device</li>
    <c:if test="${sysUser.getUtype()!=2}">
        <li>
            <a href="/device/light">
                <div class="parent-icon"><i class="bx bx-bulb"></i>
                </div>
                <div class="menu-title">Light</div>
            </a>
        </li>
        <li>
            <a href="/device/door">
                <div class="parent-icon"><i class="bx bx-door-open"></i>
                </div>
                <div class="menu-title">Door</div>
            </a>
        </li>
        <li>
            <a href="/device/sensor">
                <div class="parent-icon"><i class="bx bx-send"></i>
                </div>
                <div class="menu-title">Sensor</div>
            </a>
        </li>
        <li>
            <a href="/device/fans">
                <div class="parent-icon"><i class="lni lni-shuffle"></i>
                </div>
                <div class="menu-title">Fans</div>
            </a>
        </li>
    </c:if>
    <c:if test="${sysUser.getUtype()==2}">
        <li>
            <a href="/device/factory">
                <div class="parent-icon"><i class="lni lni-direction-alt"></i>
                </div>
                <div class="menu-title">Factory</div>
            </a>
        </li>
    </c:if>
    <c:if test="${sysUser.getUtype()==1}">
        <li class="menu-label">Log</li>
        <li>
            <a href="/log/light">
                <div class="parent-icon"><i class="bx bx-bulb"></i>
                </div>
                <div class="menu-title">Light</div>
            </a>
        </li>
        <li>
            <a href="/log/door">
                <div class="parent-icon"><i class="bx bx-door-open"></i>
                </div>
                <div class="menu-title">Door</div>
            </a>
        </li>
        <li>
            <a href="/log/sensor">
                <div class="parent-icon"><i class="bx bx-send"></i>
                </div>
                <div class="menu-title">Sensor</div>
            </a>
        </li>
        <li>
            <a href="/log/fans">
                <div class="parent-icon"><i class="lni lni-shuffle"></i>
                </div>
                <div class="menu-title">Fans</div>
            </a>
        </li>
    </c:if>
    <li class="menu-label">User</li>
    <c:if test="${sysUser.getUtype()==1}">
        <li>
            <a href="/user/user">
                <div class="parent-icon"><i class="bx bx-user-circle"></i>
                </div>
                <div class="menu-title">User Manage</div>
            </a>
        </li>
        <li>
            <a href="/user/mfuser">
                <div class="parent-icon"><i class="bx bx-user-circle"></i>
                </div>
                <div class="menu-title">Manufacturer Manage</div>
            </a>
        </li>
    </c:if>
    <li>
        <a href="/user/userprofile">
            <div class="parent-icon"><i class="bx bx-user-circle"></i>
            </div>
            <div class="menu-title">User Profile</div>
        </a>
    </li>
</ul>
<!--end navigation-->
</body>
</html>