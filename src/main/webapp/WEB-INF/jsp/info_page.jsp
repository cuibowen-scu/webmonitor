<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/25
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="/css/reset.min.css">
    <link rel="stylesheet" href="/css/style.css">


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/css/lunbo.css"/>
    <script type="text/javascript" src="/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="/js/jquery.roundabout.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人信息</title>
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


<center>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <h2><img src="/images/header.png" border="none" alt="Account information" style="margin-right: 30px"/></h2>
    <br/><br/>
    <form action="/user/modify.do" method="post">
        <ul>
            <li class="first" style="
            border-bottom: 1px solid #DFDFDF;
            border-top: 1px solid #DFDFDF;
            padding: 15px 0;
            width: 600px;
            overflow: hidden;">
                <h3 style="float: left;font-size: 14px;
                    font-weight: bold;
                    margin: 5px 0 0 0;
                    width: 200px;
                    margin-left: 20px;">昵称</h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="Monitor User" id="user" readonly="readonly"/>
                </p>
            </li>

            <li class="first" style="
            border-bottom: 1px solid #DFDFDF;
            padding: 15px 0;
            width: 600px;
            overflow: hidden;">
                <h3 style="float: left;font-size: 14px;
                    font-weight: bold;
                    margin: 5px 0 0 0;
                    width: 200px;
                    margin-left: 20px;">电话
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value=${userInfo.phone} id="phone" readonly="readonly"/>
                </p>
            </li>

            <li style="
            border-bottom: 1px solid #DFDFDF;
            padding: 15px 0;
            width: 600px;
            overflow: hidden;">
                <h3 style="float: left;font-size: 14px;
                    font-weight: bold;
                    margin: 5px 0 0 0;
                    width: 200px;
                    margin-left: 20px;">邮箱
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value=${userInfo.email} name="email"/>
                </p>
            </li>

            <li style="
            border-bottom: 1px solid #DFDFDF;
            padding: 15px 0;
            width: 600px;
            overflow: hidden;">
                <h3 style="float: left;font-size: 14px;
                    font-weight: bold;
                    margin: 5px 0 0 0;
                    width: 200px;
                    margin-left: 20px;">密码
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value=${userInfo.password} name="password"/>
                </p>
            </li>

            <li class="last" style="
            border-bottom: 1px solid #DFDFDF;
            border: none;
            margin-left: 60px;
            padding: 15px 0;
            width: 600px;
            overflow: hidden;">
                <button style="
                    background:white;
                    border: 0" type="submit">
                    <a id="signup" type="submit" href="modify.do"><img
                            src="/images/button.png" alt="Fake signup button"
                            style="vertical-align:middle;"/>
                    </a>
                    <img
                            src="/images/clickhere.png" alt=""
                            style="vertical-align:middle;"
                    />
                </button>
            </li>
        </ul>

    </form>

</center>

</body>
</html>