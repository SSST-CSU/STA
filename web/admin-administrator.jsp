<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-xs-12 col-sm-10 col-md-10 clean">
    <div class="row clean">
        <div class="col-xs-12 col-sm-2 col-md-2 clean"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
            <a href="javascript:history.back(-1)" style="text-decoration: none;font-family: 'Microsoft YaHei'">返回上一页</a>
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 clean text-center"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
            <span class="glyphicon glyphicon-tower" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;管理员管理
        </div>
        <div class="col-xs-12 col-sm-2 col-md-2 clean text-center"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean">
            <table class="table table-hover">

                <thead>
                <tr>
                    <th>#</th>
                    <th>姓名</th>
                    <th>账号</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>

                <c:choose>
                    <c:when test="${empty sessionScope.admins}">
                        <tr>
                            <th colspan="6">很抱歉，没有您想要的数据！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty sessionScope.admins}">
                        <c:forEach var="helloAdmin" items="${sessionScope.admins}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1}</th>
                                <td>${helloAdmin.name}</td>
                                <td>${helloAdmin.account}</td>
                                <td>
                                    <button onclick="deleteAdminModal('${helloAdmin.adminId}','${helloAdmin.name}')"
                                            class="btn btn-success">
                                        删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
                </tbody>
            </table>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 clean text-right">

        </div>
        <div class="col-xs-12 col-sm-3 col-md-3 clean">

        </div>
        <div class="col-xs-12 col-sm-3 col-md-3 clean">
            <button class="btn btn-primary" onclick="newAdminModal()">添加新管理员</button>
        </div>
    </div>
</div>

<%--添加比赛信息的模态对话框--%>
<div class="modal fade" id="newAdminModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加部门职责</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="管理员姓名" style="margin: 2px" id="new-name">
                <input class="form-control" placeholder="管理员账号" style="margin: 2px" id="new-account">
                <input type="password" class="form-control" placeholder="管理员密码" style="margin: 2px" id="new-password">
                <input type="password" class="form-control" placeholder="确认密码" style="margin: 2px"
                       id="new-repeatPassword">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="newAdminConfirmBtn">提交</button>
            </div>
        </div>
    </div>
</div>
<%--删除比赛信息的模态对话框--%>
<div class="modal fade" id="deleteAdminModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">您确定要删除“<span id="deleteAdminName"></span>”这条管理员信息么？</h4>
            </div>
            <div class="modal-body">
                <center>
                    <button class="btn btn-primary" style="width: 10vw" data-dismiss="modal">别，我开玩笑的</button>
                    <button class="btn btn-danger" style="width: 10vw" id="deleteAdminConfirmBtn">嗯，删吧</button>
                </center>
            </div>
        </div>
    </div>
</div>
<%--消息提示模态对话框--%>
<div class="modal fade" id="msg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">消息提示</h4>
            </div>
            <div class="modal-body">
                <span id="msgContent"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="msgBtn">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    function newAdminModal() {

        $("#newAdminModal").modal();

        $("#newAdminConfirmBtn").unbind('click');
        $("#newAdminConfirmBtn").click(function () {
            var name = $("#new-name").val().trim();
            var account = $("#new-account").val().trim();
            var password = $("#new-password").val().trim();
            var repeatPassword = $("#new-repeatPassword").val().trim();

            if (name.length <= 0) {
                $("#msgContent").html("<span style='color: green'>管理员姓名不能为空！！</span>");
                $("#msg").modal();
                return;
            }
            if (account.length <= 0) {
                $("#msgContent").html("<span style='color: green'>管理员账号不能为空！！</span>");
                $("#msg").modal();
                return;
            }
            if (password.length <= 0) {
                $("#msgContent").html("<span style='color: green'>管理员密码不能为空！！</span>");
                $("#msg").modal();
                return;
            }
            if (repeatPassword.length != password.length) {
                $("#msgContent").html("<span style='color: green'>两次密码不正确！！</span>");
                $("#msg").modal();
                return;
            }

            $.ajax({
                type: "POST",  //提交方式
                url: "addAdmin",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "name": name,
                    "account": account,
                    "password": password
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#msgContent").html("<span style='color: green'>添加成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function () {
                            $("#newAdminModal").modal("hide");
                            window.location.reload();
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        });
    }
    function deleteAdminModal(id, name) {

        $("#deleteAdminName").html(name);
        $("#deleteAdminModal").modal();
        $("#deleteAdminConfirmBtn").unbind('click');
        $("#deleteAdminConfirmBtn").click(function () {
            $.ajax({
                type: "POST",  //提交方式
                url: "deleteDdmin",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "id": id
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#msgContent").html("<span style='color: green'>删除成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function () {
                            $("#deleteAdminModal").modal("hide");
                            window.location.reload();
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        });
    }

</script>