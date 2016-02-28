<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 13:54
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
            <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;消息管理
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
                    <th>消息类型</th>
                    <th>消息内容</th>
                    <th>时间</th>
                    <th>标记</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty sessionScope.adMessages}">
                        <tr>
                            <th colspan="5">很抱歉，没有您想要的数据！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty sessionScope.adMessages}">
                        <c:forEach var="adMessage" items="${sessionScope.adMessages}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1}</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${adMessage.type==0}">
                                            招新
                                        </c:when>
                                        <c:when test="${adMessage.type==1}">
                                            提问
                                        </c:when>
                                        <c:when test="${adMessage.type==2}">
                                            反馈
                                        </c:when>

                                    </c:choose>
                                </td>
                                <td>
                                    <a target="_blank" href="applyFormDetail?id=${adMessage.applyFormId }"><span data-toggle="tooltip" data-placement="right"
                                                     title="${adMessage.content}">详情</span></a>
                                </td>
                                <td>2015-10-10</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${adMessage.isRead == 0}">
                                            <a onclick="changeReadStatus('${adMessage.id}','1')"><span data-toggle="tooltip" data-placement="right"
                                                              title="标记为已回复">未回复</span></a>
                                        </c:when>
                                        <c:when test="${adMessage.isRead == 1}">
                                            <a onclick="changeReadStatus('${adMessage.id}','0')"><span data-toggle="tooltip" data-placement="right"
                                                              title="标记为未回复">已回复</span></a>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <a class="btn btn-success" onclick="sendMessage('${adMessage.personId}','${adMessage.id}')">
                                        回复
                                    </a>
                                    <a onclick="deleteMessageModal('${adMessage.id}','${status.index+1}')"
                                       class="btn btn-success">
                                        删除
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
                </tbody>
            </table>
        </div>
        <div class="col-xs-12 col-sm-5 col-md-5 clean text-right">
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
                            <a href="adminMessage?targetPage=${status.index}&key=${sessionScope.key}">${status.index}</a>
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
        <div class="col-xs-12 col-sm-3 col-md-3 clean text-center">
            <div class="input-group text-center" style="width: 20vw">
                <span class="input-group-addon" id="basic-addon1">一共${sessionScope.pageNumber}页</span>
                <input id="page" type="text" class="form-control" placeholder="页码" aria-describedby="basic-addon2"
                       value="${sessionScope.targetPage}">
                <span class="input-group-addon btn btn-info" id="selectPageBtn">Go!</span>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3">
            <div class="dropup">
                <button class="btn btn-default" style="width: 100%" id="dLabel1" type="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                    <c:choose>
                        <c:when test="${sessionScope.key==0}">
                            招新
                        </c:when>
                        <c:when test="${sessionScope.key==1}">
                            提问
                        </c:when>
                        <c:when test="${sessionScope.key==2}">
                            反馈
                        </c:when>
                        <c:when test="${sessionScope.key==null||sessionScope.key==''}">
                            全部
                        </c:when>
                    </c:choose>
                    &nbsp;<span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dLabel" style="width: 100%;padding: 2px">
                    <li onclick="retriveMessagebytype('全部')">全部</li>
                    <li onclick="retriveMessagebytype('2')">反馈</li>
                    <li onclick="retriveMessagebytype('0')">招新</li>
                    <li onclick="retriveMessagebytype('1')">提问</li>
                </ul>
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
<%--删除比赛信息的模态对话框--%>
<div class="modal fade" id="deleteMessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">您确定要删除第“<span id="deleteMessageName"></span>”条信息么？</h4>
            </div>
            <div class="modal-body">
                <center>
                    <button class="btn btn-primary" style="width: 10vw" data-dismiss="modal">别，我开玩笑的</button>
                    <button class="btn btn-danger" style="width: 10vw" id="deleteConfirmBtn">嗯，删吧</button>
                </center>
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
                <h4 class="modal-title">给用户回复消息</h4>
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
<script>


    function deleteMessageModal(id, name) {

        $("#deleteMessageName").html(name);
        $("#deleteMessageModal").modal();
        $("#deleteConfirmBtn").unbind('click');
        $("#deleteConfirmBtn").click(function () {
            $.ajax({
                type: "POST",  //提交方式
                url: "deleteAdMessage",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "id": id
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#deleteMessageModal").modal("hide");
                        $("#msgContent").html("<span style='color: green'>删除成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function () {
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

    function changeReadStatus(id,statu) {
        $.ajax({
            type: "POST",  //提交方式
            url: "changeReadStatus",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "id": id,
                "statu": statu
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理
                if (result.status == "success") {
                    window.location.reload();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

    function sendMessage(peronId,adMessageId) {
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
                        "id": peronId,
                        "msgContent": $("#sendMsgContent").val().trim()
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.status == "success") {
                            $("#msgContent").html("<span style='color: green'>发送成功！</span>");
                            $("#msg").modal();
                            $("#sendMessageModal").modal("hide");
                            changeReadStatus(adMessageId,'1');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            }
        });
    }


    $("ul.dropdown-menu li").click(function () {
        $("#dLabel1").html(this.innerHTML + '&nbsp;<span class="caret"></span>');
    });
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });

    function previousPage() {
        if (${sessionScope.targetPage<=1}) {
            window.location.href = "adminMessage?targetPage=1&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminMessage?targetPage=${sessionScope.targetPage-1}&key=${sessionScope.key}";
        }
    }
    function nextPage() {
        if (${sessionScope.targetPage>=sessionScope.pageNumber}) {
            window.location.href = "adminMessage?targetPage=${sessionScope.pageNumber}&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminMessage?targetPage=${sessionScope.targetPage+1}&key=${sessionScope.key}";
        }
    }
    $("#selectPageBtn").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${sessionScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "adminMessage?targetPage=" + targetPage;
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

    function retriveMessagebytype(type) {
        var url = "adminMessage?targetPage=1";
        window.location.href = (url + "&key=" + type);
    }

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });

</script>
