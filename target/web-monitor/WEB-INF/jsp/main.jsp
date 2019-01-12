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
            <h2 class="menu-title menu-title_2nd" style="width: 204px;">api cost</h2>
            <ul class="menu-dropdown">
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_6th" style="width: 204px;">data access</h2>
            <ul class="menu-dropdown">
                <li id="accessDisplay">display</li>
                <li id="accessNew">new</li>
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_4th" style="width: 204px;">alarm history</h2>
            <ul class="menu-dropdown">
                <li id="api">api</li>
                <li id="server">server</li>
            </ul>
        </a>
    </li>

    <li>
        <a href="/offline/getOfflineProject.do" class="menu">
            <h2 class="menu-title menu-title_5th" style="width: 204px;">offline param</h2>
            <ul class="menu-dropdown">
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_3rd" style="width: 204px;">server state</h2>
            <ul class="menu-dropdown">
                <li id="serverNow">now</li>
                <li id="serverHistory">history</li>
            </ul>
        </a>
    </li>

    <li>
        <a href="/project/getProjectList.do" class="menu">
            <h2 class="menu-title-home" style="width: 204px;">Project</h2>
            <ul class="menu-dropdown">
            </ul>
        </a>
    </li>

    <li>
        <a class="menu">
            <h2 class="menu-title menu-title_7th" style="width: 204px;">Account</h2>
            <ul class="menu-dropdown">
                <li id="account">account</li>
                <li id="login">log in</li>
                <li id="logout">log out</li>
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
                    <div class="label"><a href="/cost/getCostProject.do">Api cost</a></div>
                </li>
                <li class="img">
                    <img src="/images/02.png"/>
                    <div class="label"><a href="/access/getAccessList.do">Data access</a></div>
                </li>
                <li class="img">
                    <img src="/images/03.png"/>
                    <div class="label"><a href="/alarm/api.do">Alarm history</a></div>
                </li>
                <li class="img">
                    <img src="/images/04.png"/>
                    <div class="label"><a href="/offline/getOfflineProject.do">Offline param</a></div>
                </li>
                <li class="img">
                    <img src="/images/05.png"/>
                    <div class="label"><a href="/server/getServerStateProjectPage.do">Server state</a></div>
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