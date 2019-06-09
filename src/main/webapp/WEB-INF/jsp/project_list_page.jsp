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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>项目管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

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


<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#newModal">
    新建项目
</button>


<div class="container" style="margin-top: -100px; width: 100%">

    <div class="component" style="margin: 0;width: 100%">

        <table style="margin: 0;width: 100%">
            <thead>
            <tr>
                <th>项目id</th>
                <th>项目名</th>
                <th>主机</th>
                <th>端口</th>
                <th>用户</th>
                <th>密码</th>
                <th>数据库</th>
                <th>cpu报警？</th>
                <th>内存报警？</th>
                <th>磁盘报警？</th>
                <th>报警值</th>
                <th></th>
            </tr>
            </thead>

            <c:forEach items="${projects}" var="temp" varStatus="st">
                <tr>
                    <td>${temp.project_id}</td>
                    <td>${temp.project_name}</td>
                    <td>${temp.hostname}</td>
                    <td>${temp.port}</td>
                    <td>${temp.username}</td>
                    <td>${temp.password}</td>
                    <td>${temp.db_name}</td>
                    <td>${temp.cpu_need_warn}</td>
                    <td>${temp.mem_need_warn} </td>
                    <td>${temp.disk_need_warn} </td>
                    <td>${temp.cpu_warn_num}_${temp.mem_warn_num}_${temp.disk_warn_num}</td>

                    <td>
                        <a href="" data-toggle="modal" data-target="#editModal"
                           data-project_id=${temp.project_id} data-project_name=${temp.project_name}
                           data-host=${temp.hostname} data-port=${temp.port}
                           data-user=${temp.username} data-password=${temp.password}
                           data-db=${temp.db_name} data-cpu_need=${temp.cpu_need_warn}
                           data-mem_need=${temp.mem_need_warn} data-disk_need=${temp.disk_need_warn}
                           data-cpu_alarm_num=${temp.cpu_warn_num} data-mem_alarm_num=${temp.mem_warn_num}
                           data-disk_alarm_num=${temp.disk_warn_num}>
                            修改
                        </a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/project/deleteProject.do?projectId=${temp.project_id}">
                            删除
                        </a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/project/getProjectMethods.do?projectId=${temp.project_id}">查看</a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

</div><!-- /container -->

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="editModalLabel">
                    项目信息
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/project/updateProject.do" method="post">
                    <div class="form-group">
                        <label for="project_id" class="col-sm-2 control-label">项目id</label>
                        <div class="col-sm-9">
                            <input type="text" id="project_id" name="project_id" class="form-control well"
                                   readonly="readOnly"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="project_name" class="col-sm-2 control-label">项目名</label>
                        <div class="col-sm-9">
                            <input type="text" id="project_name" name="project_name" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="host" class="col-sm-2 control-label">主机</label>
                        <div class="col-sm-9">
                            <input type="text" id="host" name="host" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="port" class="col-sm-2 control-label">端口</label>
                        <div class="col-sm-9">
                            <input type="text" id="port" name="port" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="user" class="col-sm-2 control-label">用户</label>
                        <div class="col-sm-9">
                            <input type="text" id="user" name="user" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="text" id="password" name="password" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="db" class="col-sm-2 control-label">数据库</label>
                        <div class="col-sm-9">
                            <input type="text" id="db" name="db" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cpu_need" class="col-sm-2 control-label">c报警？</label>
                        <div class="col-sm-9">
                            <input type="text" id="cpu_need" name="cpu_need" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="mem_need" class="col-sm-2 control-label">m报警？</label>
                        <div class="col-sm-9">
                            <input type="text" id="mem_need" name="mem_need" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="disk_need" class="col-sm-2 control-label">d报警？</label>
                        <div class="col-sm-9">
                            <input type="text" id="disk_need" name="disk_need" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cpu_alarm_num" class="col-sm-2 control-label">cpu指标</label>
                        <div class="col-sm-9">
                            <input type="text" id="cpu_alarm_num" name="cpu_alarm_num" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="mem_alarm_num" class="col-sm-2 control-label">内存指标</label>
                        <div class="col-sm-9">
                            <input type="text" id="mem_alarm_num" name="mem_alarm_num" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="disk_alarm_num" class="col-sm-2 control-label">磁盘指标</label>
                        <div class="col-sm-9">
                            <input type="text" id="disk_alarm_num" name="disk_alarm_num" class="form-control well"/>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消
                        </button>
                        <button type="submit" class="btn btn-primary">
                            提交
                        </button>
                    </div>
                </form>

            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>
    $('#editModal').on('show.bs.modal', function (event) {
        var modal = $(this);
        modal.find('#project_id').val($(event.relatedTarget).data('project_id'));
        modal.find('#project_name').val($(event.relatedTarget).data('project_name'));
        modal.find('#host').val($(event.relatedTarget).data('host'));
        modal.find('#port').val($(event.relatedTarget).data('port'));
        modal.find('#user').val($(event.relatedTarget).data('user'));
        modal.find('#password').val($(event.relatedTarget).data('password'));
        modal.find('#db').val($(event.relatedTarget).data('db'));
        modal.find('#cpu_need').val($(event.relatedTarget).data('cpu_need'));
        modal.find('#mem_need').val($(event.relatedTarget).data('mem_need'));
        modal.find('#disk_need').val($(event.relatedTarget).data('disk_need'));
        modal.find('#cpu_alarm_num').val($(event.relatedTarget).data('cpu_alarm_num'));
        modal.find('#mem_alarm_num').val($(event.relatedTarget).data('mem_alarm_num'));
        modal.find('#disk_alarm_num').val($(event.relatedTarget).data('disk_alarm_num'));
    })
</script>


<!-- 模态框（Modal） -->
<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    New Project
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/project/addProject.do" method="post">
                    <div class="form-group">
                        <label for="project_name" class="col-sm-2 control-label">项目名</label>
                        <div class="col-sm-9">
                            <input type="text" id="project_name1" name="project_name" class="form-control well"
                                   placeholder="您的项目名"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="host" class="col-sm-2 control-label">主机</label>
                        <div class="col-sm-9">
                            <input type="text" id="host1" name="host" class="form-control well"
                                   placeholder="您想存储数据的数据库的主机名"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="port" class="col-sm-2 control-label">端口</label>
                        <div class="col-sm-9">
                            <input type="text" id="port1" name="port" class="form-control well"
                                   placeholder="您想存储数据的数据库的端口"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="user" class="col-sm-2 control-label">用户</label>
                        <div class="col-sm-9">
                            <input type="text" id="user1" name="user" class="form-control well"
                                   placeholder="您想存储数据的数据库的用户名"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="text" id="password1" name="password" class="form-control well"
                                   placeholder="您想存储数据的数据库的密码"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="db" class="col-sm-2 control-label">数据库</label>
                        <div class="col-sm-9">
                            <input type="text" id="db1" name="db" class="form-control well"
                                   placeholder="数据库名"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cpu_need" class="col-sm-2 control-label">c报警？</label>
                        <div class="col-sm-9">
                            <input type="text" id="cpu_need1" name="cpu_need" class="form-control well"
                                   placeholder="您的项目需要监控cpu利用率并报警吗， 输入 yes 或 no"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="mem_need" class="col-sm-2 control-label">m报警？</label>
                        <div class="col-sm-9">
                            <input type="text" id="mem_need1" name="mem_need" class="form-control well"
                                   placeholder="您的项目需要监控内存利用率并报警吗， 输入 yes 或 no"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="disk_need" class="col-sm-2 control-label">d报警？</label>
                        <div class="col-sm-9">
                            <input type="text" id="disk_need1" name="disk_need" class="form-control well"
                                   placeholder="您的项目需要监控磁盘利用率并报警吗， 输入 yes 或 no"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cpu_alarm_num" class="col-sm-2 control-label">cpu指标</label>
                        <div class="col-sm-9">
                            <input type="text" id="cpu_alarm_num1" name="cpu_alarm_num" class="form-control well"
                                   placeholder="如果需要cpu报警，输入报警指标, 否则输入 0"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="mem_alarm_num" class="col-sm-2 control-label">内存指标</label>
                        <div class="col-sm-9">
                            <input type="text" id="mem_alarm_num1" name="mem_alarm_num" class="form-control well"
                                   placeholder="如果需要内存报警，输入报警指标, 否则输入 0"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="disk_alarm_num" class="col-sm-2 control-label">磁盘指标</label>
                        <div class="col-sm-9">
                            <input type="text" id="disk_alarm_num1" name="disk_alarm_num" class="form-control well"
                                   placeholder="如果需要磁盘报警，输入报警指标, 否则输入 0"/>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消
                        </button>
                        <button type="submit" class="btn btn-primary">
                            提交
                        </button>
                    </div>
                </form>

            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.ba-throttle-debounce.min.js"></script>
<script src="/js/jquery.stickyheader.js"></script>


</body>
</html>