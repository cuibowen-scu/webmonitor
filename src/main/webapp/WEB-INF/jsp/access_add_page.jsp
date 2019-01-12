<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/31
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>User Account</title>
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


<center>
    <br/><br/><br/>

    <form action="/access/addAccess.do" method="post">
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
                    margin-left: 20px;">Access Name</h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="access_name"/>
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
                    margin-left: 20px;">Hostname
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="hostname"/>
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
                    margin-left: 20px;">Port
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="port"/>
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
                    margin-left: 20px;">Username
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="username"/>
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
                    margin-left: 20px;">Password
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="password"/>
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
                    margin-left: 20px;">DB name
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="db_name"/>
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
                    margin-left: 20px;">Table
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="table"/>
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
                    margin-left: 20px;">Time Field
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="time_field"/>
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
                    margin-left: 20px;">Action Field
                </h3>
                <p style="float: left; margin: 0; width: 310px">
                    <input type="text" value="" name="action_field"/>
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
                            src="/images/access.png" alt="Fake signup button"
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
