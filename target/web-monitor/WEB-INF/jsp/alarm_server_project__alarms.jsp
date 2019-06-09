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
    <title>报警</title>
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


<br><br><br><br>
<font size="5" style="margin-left: 42%">服务器历史报警</font>
<div class="container" style="margin-top: -100px">

    <div class="component">
        <table>
            <thead>

            <tr>
                <th>项目id</th>
                <th>cpu报警指标</th>
                <th>内存报警指标</th>
                <th>磁盘报警指标</th>
                <th>cpu使用率</th>
                <th>内存使用率</th>
                <th>磁盘使用率</th>
                <th>报警时间</th>
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
