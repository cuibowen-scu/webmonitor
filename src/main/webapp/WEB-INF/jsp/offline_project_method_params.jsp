<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/30
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/plain; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Offline params</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet"></link>
    <link rel="stylesheet" href="/css/download.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="/css/reset.min.css">
    <link rel="stylesheet" href="/css/style.css">
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


<div class="container home">

    <div class="row">
        <font size="5" style="margin-left: 40%">Method params history</font>

        <div class="top-panel">
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Export to
                    <span class="caret"></span></button>
                <ul class="dropdown-menu" role="menu">
                    <li><a onclick="exportTo('csv');" href="javascript://">CSV</a></li>
                    <li><a onclick="exportTo('txt');" href="javascript://">TXT</a></li>
                    <li><a onclick="exportTo('xls');" href="javascript://">XLS</a></li>
                    <li><a onclick="exportTo('sql');" href="javascript://">SQL</a></li>
                </ul>
            </div>
        </div>

        <div class="table-responsive">
            <table id="firm_table" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th>project_id</th>
                    <th>method_id</th>
                    <th>method_class</th>
                    <th>method_name</th>
                    <th>upload_time</th>
                    <th>content</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${methodParams}" var="temp" varStatus="st">
                    <tr>
                        <td>${temp.project_id}</td>
                        <td>${temp.method_id}</td>
                        <td>${temp.method_class}</td>
                        <td>${temp.method_name}</td>
                        <td>${temp.time_s}</td>
                        <td>${temp.content}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>

</div>


<div style="text-align:center ">
    <a href="/offline/getProjectMethodParam.do?projectId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).method_id}</c:otherwise></c:choose>&&start=0">first</a>
    &nbsp;&nbsp;
    <a href="/offline/getProjectMethodParam.do?projectId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).method_id}</c:otherwise></c:choose>&&start=<c:choose><c:when test="${start-10<0}">0</c:when><c:otherwise>${start-10}</c:otherwise></c:choose>">prev</a>&nbsp;&nbsp;
    <a href="/offline/getProjectMethodParam.do?projectId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).method_id}</c:otherwise></c:choose>&&start=<c:choose><c:when test="${start+10>lastStart}">${lastStart}</c:when><c:otherwise>${start+10}</c:otherwise></c:choose>">next</a>&nbsp;&nbsp;
    <a href="/offline/getProjectMethodParam.do?projectId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${methodParams== null || fn:length(methodParams) == 0}">0</c:when><c:otherwise>${methodParams.get(0).method_id}</c:otherwise></c:choose>&&start=${lastStart}">last</a>
</div>


<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script src="/js/tableExporter.js"></script>
<script src="/js/download.js"></script>

</body>
</html>
