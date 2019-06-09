<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/26
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="/css/reset.min.css">
    <link rel="stylesheet" href="/css/style.css">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/css/lunbo.css"/>
    <script type="text/javascript" src="/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="/js/jquery.roundabout.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
</head>

<body>

<ul class="hList">

    <li>
        <a href="/cost/getCostProject.do" class="menu">
            <h2 class="menu-title menu-title_2nd" style="width: 204px;">接口耗时</h2>
            <ul class="menu-dropdown">
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_6th" style="width: 204px;">数据接入</h2>
            <ul class="menu-dropdown">
                <li id="accessDisplay">历史接入展示</li>
                <li id="accessNew">新建接入</li>
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_4th" style="width: 204px;">报警历史</h2>
            <ul class="menu-dropdown">
                <li id="api">接口耗时报警历史</li>
                <li id="server">服务器报警历史</li>
            </ul>
        </a>
    </li>

    <li>
        <a href="/offline/getOfflineProject.do" class="menu">
            <h2 class="menu-title menu-title_5th" style="width: 204px;">离线参数</h2>
            <ul class="menu-dropdown">
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_3rd" style="width: 204px;">服务器状态</h2>
            <ul class="menu-dropdown">
                <li id="serverNow">当前状态</li>
                <li id="serverHistory">历史状态</li>
            </ul>
        </a>
    </li>

    <li>
        <a href="/project/getProjectList.do" class="menu">
            <h2 class="menu-title-home" style="width: 204px;">项目管理</h2>
            <ul class="menu-dropdown">
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_7th" style="width: 204px;">账户</h2>
            <ul class="menu-dropdown">
                <li id="account">个人信息</li>
                <li id="login">登录</li>
                <li id="logout">退出</li>
            </ul>
        </a>
    </li>

</ul>

&nbsp;&nbsp;&nbsp;

<img src="/images/home.png" id="home">

<script>
    document.getElementById("account").onclick = function () {
        window.location = "/user/infoPage.do"
    };
    document.getElementById("login").onclick = function () {
        window.location = "/user/logPage.do"
    };
    document.getElementById("api").onclick = function () {
        window.location = "/alarm/api.do"
    };
    document.getElementById("server").onclick = function () {
        window.location = "/alarm/server.do"
    };
    document.getElementById("home").onclick = function () {
        window.location = "/"
    };
    document.getElementById("logout").onclick = function () {
        window.location = "/user/logout.do"
    };
    document.getElementById("serverNow").onclick = function () {
        window.location = "/server/getServerStateProjectPage.do"
    };
    document.getElementById("serverHistory").onclick = function () {
        window.location = "/server/getHistoryServerStateProjectPage.do"
    };
    document.getElementById("accessDisplay").onclick = function () {
        window.location = "/access/getAccessList.do"
    };
    document.getElementById("accessNew").onclick = function () {
        window.location = "/access/addAccessPage.do"
    };
</script>

<br><br><br>

<div id="tour" class="zebra">
    <div class="wrap">
        <div class="switcher-wrap slider">
            <a class="prev jQ_sliderPrev" href=""></a>
            <a class="next jQ_sliderNext" href=""></a>

            <ul id="img-slider" style="height: 450px;">
                <li class="img">
                    <img src="/images/01.png"/>
                    <div class="label"><a href="/cost/getCostProject.do">接口耗时</a></div>
                </li>
                <li class="img">
                    <img src="/images/02.png"/>
                    <div class="label"><a href="/access/getAccessList.do">数据接入</a></div>
                </li>
                <li class="img">
                    <img src="/images/03.png"/>
                    <div class="label"><a href="/alarm/api.do">报警历史</a></div>
                </li>
                <li class="img">
                    <img src="/images/04.png"/>
                    <div class="label"><a href="/offline/getOfflineProject.do">离线参数</a></div>
                </li>
                <li class="img">
                    <img src="/images/05.png"/>
                    <div class="label"><a href="/server/getServerStateProjectPage.do">服务器状态</a></div>
                </li>
            </ul>
            <ul class="switcher jQ_sliderSwitch">
                <li class="active"><a href=""></a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
                <li><a href=""></a></li>
            </ul>
        </div>
    </div>
</div>


</body>
</html>