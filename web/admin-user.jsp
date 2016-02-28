<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 13:50
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
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;用户管理
        </div>
        <div class="col-xs-12 col-sm-2 col-md-2 clean text-center"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean">
            <table class="table table-hover">
                <caption>
                    <center>
                        <div class="input-group" style="width: 50vw">
                            <input type="text" class="form-control" placeholder="用输入要查找的用户的姓名"
                                   aria-describedby="basic-addon" id="searchKey" value="${sessionScope.key}">
                            <span class="input-group-addon btn btn-info" id="searchBtn">Go!</span>
                        </div>
                    </center>
                </caption>
                <thead>
                <tr>
                    <th>#</th>
                    <th>姓名</th>
                    <th>账号</th>
                    <th>电话号码</th>
                    <th>班级</th>
                    <th>职位</th>
                    <th class="text-center">操作</th>

                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty sessionScope.persons}">
                        <tr>
                            <th colspan="7">很抱歉，没有您想要的数据！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty sessionScope.persons}">
                        <c:forEach var="person" items="${sessionScope.persons}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1}</th>
                                <td>${person.name}</td>
                                <td>${person.account}</td>
                                <td>${person.tel}</td>
                                <td>${person.classes}</td>
                                <td>
                                    <c:if test='${person.job=="" || person.job==null}'>
                                        无
                                    </c:if>
                                    <c:if test='${!(person.job=="" || person.job==null)}'>
                                        ${person.job}
                                    </c:if>
                                </td>
                                <td class="text-center">
                                    <button onclick="modifyPasswordmodal('${person.id}','${person.name}')"
                                            class="btn btn-success">
                                        修改密码
                                    </button>
                                    <button onclick="sendMessageModal('${person.id}','${person.name}')"
                                            class="btn btn-success">
                                        发送消息
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
            <nav>
                <ul class="pagination clean">
                    <li>
                        <a href="javascript:previousPage()" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="${sessionScope.startAndEnd.start}" end="${sessionScope.startAndEnd.end}"
                               varStatus="status">
                        <li<c:if test="${status.index==sessionScope.targetPage}"> class="active"</c:if>>
                            <a href="adminUser?targetPage=${status.index}&key=${sessionScope.key}">${status.index}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <a href="javascript:nextPage()" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 clean text-center">
            <div class="input-group text-center" style="width: 20vw">
                <span class="input-group-addon" id="basic-addon1">一共${sessionScope.pageNumber}页</span>
                <input id="page" type="text" class="form-control" placeholder="页码" aria-describedby="basic-addon2"
                       value="${sessionScope.targetPage}">
                <span class="input-group-addon btn btn-info" id="selectPageBtn">Go!</span>
            </div>
        </div>
    </div>
</div>
<%--修改用户密码的模态对话框--%>
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modifyUserPasswordMsg">修改XXX用户的密码</h4>
            </div>
            <div class="modal-body">
                <input type="password" class="form-control" placeholder="新密码" style="margin-bottom: 2px"
                       id="newPassword">
                <input type="password" class="form-control" placeholder="确认密码" style="margin-top: 2px"
                       id="repeatPassword">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="modifyUserPasswordBtn">提交</button>
            </div>
        </div>
    </div>
</div>
<%--给用户发送信息的模态对话框--%>
<div class="modal fade" id="sendMessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">给用户：<span id="sendMsgModalPersonName"></span>发送消息</h4>
            </div>
            <div class="modal-body">
                <textarea style="width: 100%; height: 30vh" id="sendMsgContent">
                </textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="sendAdminMsgBtn">提交</button>
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
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    function modifyPasswordmodal(personId, personName) {
        $("#newPassword").val("");
        $("#repeatPassword").val("");
        $("#modifyUserPasswordMsg").html("修改" + personName + "用户的密码");
        $("#modifyPasswordModal").modal();

        $("#modifyUserPasswordBtn").click(function () {

            if ($("#newPassword").val().trim().length < 6) {
                $("#modifyUserPasswordMsg").html("修改" + personName + "用户的密码" + "<span style='color: #ff0000'>（密码长度不能少于6位！）</span>");
                return;
            }
            else if ($("#newPassword").val().trim() != $("#repeatPassword").val().trim()) {
                $("#modifyUserPasswordMsg").html("修改" + personName + "用户的密码" + "<span style='color: #ff0000'>（两次密码不一致！）</span>");
                return;
            }
            else {
                $.ajax({
                    type: "POST",  //提交方式
                    url: "modifyUserPassword",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "id": personId,
                        "password": $("#repeatPassword").val().trim()
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.status == "success") {
                            $("#msgContent").html("<span style='color: green'>修改成功！</span>");
                            $("#msg").modal();
                            $("#modifyPasswordModal").modal("hide");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            }
        });
    }
    function sendMessageModal(personId, personName) {
        $("#sendMsgModalPersonName").html(personName);
        $("#sendMsgContent").val("");
        $("#sendMessageModal").modal();
        $("#sendAdminMsgBtn").unbind("click");//吧上次绑定的click事件取消，要不然的话每次执行都会比上次多一次，比如第一次发送一条消息，第二次会发送两条相同的消息，第三次会发送三个相同的消息
        $("#sendAdminMsgBtn").click(function () {
            if ($("#sendMsgContent").val().trim() == "") {
                $("#sendMessageModal").modal("hide");
                $("#msgContent").html("消息不能为空！");
                $("#msg").modal({});
                return;
            } else {
                $.ajax({
                    type: "POST",  //提交方式
                    url: "sendAdminMsg",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "id": personId,
                        "msgContent": $("#sendMsgContent").val().trim()
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.status == "success") {
                            $("#msgContent").html("<span style='color: green'>发送成功！</span>");
                            $("#msg").modal();
                            $("#sendMessageModal").modal("hide");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            }
        });
    }

    $("#searchBtn").click(function () {
        var url = "adminUser?targetPage=1";
        if ($("#searchKey").val().trim() == "") {
            window.location.href = url;
        }
        else {
            window.location.href = url + "&key=" + $("#searchKey").val().trim();
        }
    });

    function previousPage() {
        if (${sessionScope.targetPage<=1}) {
            window.location.href = "adminUser?targetPage=1&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminUser?targetPage=${sessionScope.targetPage-1}&key=${sessionScope.key}";
        }
    }
    function nextPage() {
        if (${sessionScope.targetPage>=sessionScope.pageNumber}) {
            window.location.href = "adminUser?targetPage=${sessionScope.pageNumber}&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminUser?targetPage=${sessionScope.targetPage+1}&key=${sessionScope.key}";
        }
    }

    $("#selectPageBtn").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${sessionScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "adminUser?targetPage=" + targetPage;
            if (${sessionScope.key!=null}) {
                url += "&key=${sessionScope.key}";
            }
            window.location.href = url;
        }
        else {
            $("#msgContent").html("输入不合法！");
            $("#msg").modal({});
        }
    });

</script>