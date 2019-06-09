<%--
  Created by IntelliJ IDEA.
  User: cuibowen5
  Date: 2018/12/30
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>接口耗时</title>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#newModal">
    Add a method
</button>


<div class="container" style="margin-top: -100px; width: 100%">

    <div class="component" style="margin: 0;width: 100%">

        <table style="margin: 0;width: 100%">
            <thead>
            <tr>
                <th>项目id</th>
                <th>方法id</th>
                <th>类名</th>
                <th>方法名</th>
                <th>需要记录耗时？</th>
                <th>需要报警？</th>
                <th>报警指标</th>
                <th>需要离线参数？</th>

                <th></th>
            </tr>
            </thead>

            <c:forEach items="${methods}" var="temp" varStatus="st">
                <tr>
                    <td>${temp.project_id}</td>
                    <td>${temp.method_id}</td>
                    <td>${temp.method_class}</td>
                    <td>${temp.method_name}</td>
                    <td><c:choose><c:when
                            test="${temp.flag != 2}">yes</c:when><c:otherwise>no</c:otherwise></c:choose></td>
                    <td>${temp.if_cost_need_warn}</td>
                    <td>${temp.cost_warn_num} ms</td>
                    <td><c:choose><c:when
                            test="${temp.flag != 1}">yes</c:when><c:otherwise>no</c:otherwise></c:choose></td>

                    <td>
                        <a href="" data-toggle="modal" data-target="#editModal"
                           data-project_id=${temp.project_id} data-method_id=${temp.method_id}
                           data-method_class=${temp.method_class} data-method_name=${temp.method_name}
                           data-need_cost_cal=<c:choose><c:when test="${temp.flag != 2}">yes</c:when><c:otherwise>no</c:otherwise>
                        </c:choose>
                           data-cost_need_alarm=${temp.if_cost_need_warn} data-cost_alarm_num=${temp.cost_warn_num}
                           data-need_offline_param=<c:choose><c:when test="${temp.flag != 1}">yes</c:when><c:otherwise>no</c:otherwise>
                        </c:choose>
                        >
                            edit
                        </a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/project/deleteProjectMethod.do?methodId=${temp.method_id}&projectId=${temp.project_id}">
                            delete
                        </a>
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
                    Method Info
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/project/updateProjectMethod.do" method="post">

                    <div class="form-group">
                        <label for="project_id" class="col-sm-2 control-label">project_id</label>
                        <div class="col-sm-9">
                            <input type="text" id="project_id" name="project_id" class="form-control well"
                                   readonly="readOnly"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="method_id" class="col-sm-2 control-label">method_id</label>
                        <div class="col-sm-9">
                            <input type="text" id="method_id" name="method_id" class="form-control well"
                                   readonly="readOnly"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="method_class" class="col-sm-2 control-label">method_class</label>
                        <div class="col-sm-9">
                            <input type="text" id="method_class" name="method_class" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="method_name" class="col-sm-2 control-label">method_name</label>
                        <div class="col-sm-9">
                            <input type="text" id="method_name" name="method_name" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="need_cost_cal" class="col-sm-2 control-label">cost_cal?</label>
                        <div class="col-sm-9">
                            <input type="text" id="need_cost_cal" name="need_cost_cal" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cost_need_alarm" class="col-sm-2 control-label">cost_alarm?</label>
                        <div class="col-sm-9">
                            <input type="text" id="cost_need_alarm" name="cost_need_alarm" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cost_alarm_num" class="col-sm-2 control-label">alarm_num</label>
                        <div class="col-sm-9">
                            <input type="text" id="cost_alarm_num" name="cost_alarm_num" class="form-control well"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="need_offline_param" class="col-sm-2 control-label">off_param?</label>
                        <div class="col-sm-9">
                            <input type="text" id="need_offline_param" name="need_offline_param"
                                   class="form-control well"/>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            update
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
        modal.find('#method_id').val($(event.relatedTarget).data('method_id'));
        modal.find('#method_class').val($(event.relatedTarget).data('method_class'));
        modal.find('#method_name').val($(event.relatedTarget).data('method_name'));
        modal.find('#need_cost_cal').val($(event.relatedTarget).data('need_cost_cal'));
        modal.find('#cost_need_alarm').val($(event.relatedTarget).data('cost_need_alarm'));
        modal.find('#cost_alarm_num').val($(event.relatedTarget).data('cost_alarm_num'));
        modal.find('#need_offline_param').val($(event.relatedTarget).data('need_offline_param'));
    })
</script>


<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="newModalLabel">
                    New method
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/project/addProjectMethod.do" method="post">

                    <div class="form-group">
                        <label for="project_id" class="col-sm-2 control-label">project_id</label>
                        <div class="col-sm-9">
                            <input type="text" id="project_id1" name="project_id" class="form-control well"
                                   value=${projectId} readonly="readOnly"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="method_class" class="col-sm-2 control-label">method_class</label>
                        <div class="col-sm-9">
                            <input type="text" id="method_class1" name="method_class" class="form-control well"
                                   placeholder="the whole method class path in your project"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="method_name" class="col-sm-2 control-label">method_name</label>
                        <div class="col-sm-9">
                            <input type="text" id="method_name1" name="method_name" class="form-control well"
                                   placeholder="the method name in your project"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="need_cost_cal" class="col-sm-2 control-label">cost_cal?</label>
                        <div class="col-sm-9">
                            <input type="text" id="need_cost_cal1" name="need_cost_cal" class="form-control well"
                                   placeholder="need api cost monitor? type yes or no"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cost_need_alarm" class="col-sm-2 control-label">cost_alarm?</label>
                        <div class="col-sm-9">
                            <input type="text" id="cost_need_alarm1" name="cost_need_alarm" class="form-control well"
                                   placeholder="need api cost alarm? type yes or no"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cost_alarm_num" class="col-sm-2 control-label">alarm_num</label>
                        <div class="col-sm-9">
                            <input type="text" id="cost_alarm_num1" name="cost_alarm_num" class="form-control well"
                                   placeholder="type the alarm num if you need cost monitor, else type 0"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="need_offline_param" class="col-sm-2 control-label">off_param?</label>
                        <div class="col-sm-9">
                            <input type="text" id="need_offline_param1" name="need_offline_param"
                                   class="form-control well" placeholder="need offline params monitor? type yes or no"/>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            submit
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