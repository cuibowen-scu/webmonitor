<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/30
  Time: 16:59
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
    <link rel="stylesheet" type="text/css" href="/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="/css/demo.css"/>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="/css/component.css"/>

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


<br><br><br><br>
<font size="5" style="margin-left: 40%">Server performance alarms history</font>
<div class="container" style="margin-top: -100px">

    <div class="component">
        <table>
            <thead>

            <tr>
                <th>project_id</th>
                <th>cpu_alarm_num</th>
                <th>mem_alarm_num</th>
                <th>disk_alarm_num</th>
                <th>cpu_usage</th>
                <th>mem_usage</th>
                <th>disk_usage</th>
                <th>alarm_time</th>
            </tr>
            </thead>

            <c:forEach items="${alarmServerPerformances}" var="temp" varStatus="st">
                <tr>
                    <td>${temp.project_id}</td>
                    <td>${temp.cpu_warn_num} %</td>
                    <td>${temp.mem_warn_num} %</td>
                    <td>${temp.disk_warn_num} %</td>
                    <td>${temp.cpu_usage} %</td>
                    <td>${temp.mem_usage} %</td>
                    <td>${temp.disk_usage} %</td>
                    <td>${temp.time_min}</td>
                </tr>
            </c:forEach>


            </tbody>


        </table>
    </div>

</div><!-- /container -->

<div style="text-align:center ">
    <a href="/alarm/getProjectServerAlarms.do?projectId=<c:choose><c:when test="${alarmServerPerformances== null || fn:length(alarmServerPerformances) == 0}">0</c:when><c:otherwise>${alarmServerPerformances.get(0).project_id}</c:otherwise></c:choose>&&start=0">first</a>
    &nbsp;&nbsp;
    <a href="/alarm/getProjectServerAlarms.do?projectId=<c:choose><c:when test="${alarmServerPerformances== null || fn:length(alarmServerPerformances) == 0}">0</c:when><c:otherwise>${alarmServerPerformances.get(0).project_id}</c:otherwise></c:choose>&&start=<c:choose><c:when test="${start-10<0}">0</c:when><c:otherwise>${start-10}</c:otherwise></c:choose>">prev</a>&nbsp;&nbsp;
    <a href="/alarm/getProjectServerAlarms.do?projectId=<c:choose><c:when test="${alarmServerPerformances== null || fn:length(alarmServerPerformances) == 0}">0</c:when><c:otherwise>${alarmServerPerformances.get(0).project_id}</c:otherwise></c:choose>&&start=<c:choose><c:when test="${start+10>lastStart}">${lastStart}</c:when><c:otherwise>${start+10}</c:otherwise></c:choose>">next</a>&nbsp;&nbsp;
    <a href="/alarm/getProjectServerAlarms.do?projectId=<c:choose><c:when test="${alarmServerPerformances== null || fn:length(alarmServerPerformances) == 0}">0</c:when><c:otherwise>${alarmServerPerformances.get(0).project_id}</c:otherwise></c:choose>&&start=${lastStart}">last</a>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.ba-throttle-debounce.min.js"></script>
<script src="/js/jquery.stickyheader.js"></script>


</body>
</html>