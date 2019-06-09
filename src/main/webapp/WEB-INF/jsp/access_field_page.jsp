<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/31
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3">
    <title>接口耗时</title>
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

&nbsp;&nbsp;

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
    <c:forEach items="${fields}" var="temp">
    data.unshift(["${temp.time_field}", "${temp.action_field}"]);
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
            text: '沿Y轴的渐变'
        }, {
            top: '55%',
            left: 'center',
            text: '沿X轴的渐变'
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
<font size="5" style="margin-left: 42%">接入数据展示</font>
<div class="container" style="margin-top: -100px">

    <div class="component">
        <table>
            <thead>

            <tr>
                <th>时间维度字段/x轴</th>
                <th>数值字段/y轴</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${fields}" var="temp" varStatus="st">
                <tr>
                    <td>${temp.time_field}</td>
                    <td>${temp.action_field}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

</div><!-- /container -->

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.ba-throttle-debounce.min.js"></script>
<script src="/js/jquery.stickyheader.js"></script>


</body>
</html>

