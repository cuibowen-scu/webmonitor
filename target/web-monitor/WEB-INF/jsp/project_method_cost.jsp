<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/31
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <%--<meta http-equiv="refresh" content="2">--%>
    <title>Time Cost</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="/css/reset.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="/css/demo.css"/>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="/css/component.css"/>
    <script src="/js/echarts.min.js"></script>
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

<br><br><br><br><br><br>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 1500px;height:600px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));


    var data = [];
    <c:forEach items="${costs}" var="temp">
    data.unshift(["${temp.start_user_time}", ${temp.cost}]);
    </c:forEach>


    var dateList = data.map(function (item) {
        return item[0];
    });
    var valueList = data.map(function (item) {
        return item[1];
    });

    option = {

        // Make gradient line here
        visualMap: [{
            show: false,
            type: 'continuous',
            seriesIndex: 0,
            min: 0,
            max: 400
        }, {
            show: false,
            type: 'continuous',
            seriesIndex: 1,
            dimension: 0,
            min: 0,
            max: dateList.length - 1
        }],


        title: [{
            left: 'center',
            text: 'Gradient along the y axis'
        }, {
            top: '55%',
            left: 'center',
            text: 'Gradient along the x axis'
        }],
        tooltip: {
            trigger: 'axis'
        },
        xAxis: [{
            data: dateList
        }, {
            data: dateList,
            gridIndex: 1
        }],
        yAxis: [{
            splitLine: {show: false}
        }, {
            splitLine: {show: false},
            gridIndex: 1
        }],
        grid: [{
            bottom: '60%'
        }, {
            top: '60%'
        }],
        series: [{
            type: 'line',
            showSymbol: false,
            data: valueList
        }, {
            type: 'line',
            showSymbol: false,
            data: valueList,
            xAxisIndex: 1,
            yAxisIndex: 1
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

<br><br><br><br>
<font size="5" style="margin-left: 40%">Method costs history</font>
<div class="container" style="margin-top: -100px">

    <div class="component">
        <table>
            <thead>

            <tr>
                <th>project_id</th>
                <th>method_id</th>
                <th>class_name</th>
                <th>method_name</th>
                <th>cost_alarm_num</th>
                <th>real_cost</th>
                <th>trigger_time</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${costs}" var="temp" varStatus="st">
                <tr>
                    <td>${temp.project_id}</td>
                    <td>${temp.method_id}</td>
                    <td>${temp.class_name}</td>
                    <td>${temp.method_name}</td>
                    <td>${temp.cost_warn_num} ms</td>
                    <td>${temp.cost} ms</td>
                    <td>${temp.start_user_time}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

</div><!-- /container -->

<div style="text-align:center ">
    <a href="/cost/getProjectMethodCost.do?projectId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).method_id}</c:otherwise></c:choose>&&start=0">first</a>&nbsp;&nbsp;
    <a href="/cost/getProjectMethodCost.do?projectId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).method_id}</c:otherwise></c:choose>&&start=<c:choose><c:when test="${start-10<0}">0</c:when><c:otherwise>${start-10}</c:otherwise></c:choose>">prev</a>&nbsp;&nbsp;
    <a href="/cost/getProjectMethodCost.do?projectId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).method_id}</c:otherwise></c:choose>&&start=<c:choose><c:when test="${start+10>lastStart}">${lastStart}</c:when><c:otherwise>${start+10}</c:otherwise></c:choose>">next</a>&nbsp;&nbsp;
    <a href="/cost/getProjectMethodCost.do?projectId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).project_id}</c:otherwise></c:choose>&methodId=<c:choose><c:when test="${costs== null || fn:length(costs) == 0}">0</c:when><c:otherwise>${costs.get(0).method_id}</c:otherwise></c:choose>&&start=${lastStart}">last</a>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.ba-throttle-debounce.min.js"></script>
<script src="/js/jquery.stickyheader.js"></script>


</body>
</html>
