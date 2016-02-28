<%@ page import="domain.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>消息通知</title>
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="frame/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="frame/bootstrap-3.3.4-dist/css/bootstrap.min.css">
    <style type="text/css">
        #newAvatar {
            border-radius: 100px;
        }

        #avatar {
            width: 8vw;
            height: 8vw;
            border-radius: 4vw;
        }

        .border-line {
            padding-top: 10px;
            padding-bottom: 8px;
            border-bottom: 1px solid;
            border-color: #dcdcdc;
            transition: all linear 0.5s;
            -moz-transition: all linear 0.5s; /* Firefox 4 */
            -webkit-transition: all linear 0.5s; /* Safari 和 Chrome */
            -o-transition: allr linear 0.5s; /* Opera */
        }

        .border-line:hover {
            background-color: #c0c0c0;
            transition: all linear 0.5s;
            -moz-transition: all linear 0.5s; /* Firefox 4 */
            -webkit-transition: all linear 0.5s; /* Safari 和 Chrome */
            -o-transition: all linear 0.5s; /* Opera */
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<img src="img/main/STA.png" style="margin-top: 50px;width: 100%;height: auto"/>

<div style=";margin-top: 5vh;margin-left: 10vw;margin-right: 10vw">

    <%@include file="siteNavigation.jsp" %>

    <div style="width: 60vw;float: left;margin-left: 5vw">

        <h1><span class="am-icon-envelope am-icon-sm"></span>&nbsp;消息通知</h1>
        <hr style="width: 100%;border: black 2px groove">

        <div class="container-fluid">
            <c:forEach var="message" items="${sessionScope.messages}" varStatus="status">
                <c:choose>
                    <c:when test="${message.messageType == 1}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9"><a target="_blank"
                                                     href="briefPersonInfo?id=${message.personId}">${message.personName}</a>
                                申请加入您的团队： ${message.teamName}，
                                <c:if test="${message.operatable == 1}">
                                    <a href="javascript:acceptApplication('${message.id}','${message.personId}','${message.teamId}')">允许</a>
                                    <a href="javascript:rejectApplication('${message.id}','${message.personId}','${message.teamId}')">拒绝</a>
                                </c:if>
                                <c:if test="${message.operatable == 2}">
                                    已允许
                                </c:if>
                                <c:if test="${message.operatable == 3}">
                                    已拒绝
                                </c:if>
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 2}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9"><a target="_blank"
                                                     href="briefPersonInfo?id=${message.personId}">${message.personName}</a>
                                加入您的团队： ${message.teamName}，快去看看吧！
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 3}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9"><a target="_blank"
                                                     href="briefPersonInfo?id=${message.personId}">${message.personName}</a>
                                退出了您的团队： ${message.teamName}。
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 4}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9"><a target="_blank"
                                                     href="briefPersonInfo?id=${message.personId}">${message.personName}</a>
                                拒绝了您申请加入团队 ：${message.teamName}。
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 5}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9"><a target="_blank"
                                                     href="briefPersonInfo?id=${message.personId}">${message.personName}</a>
                                已经通过了您的请求，您已经是 ${message.teamName} 团队中的一员了，快去看看吧。
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 6}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">
                                您成功申请参加讲座：${message.occurName}，请记得于${message.occurTime}到${message.occurPlace}参加讲座。
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 7}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">
                                你成功申请加入科协：${message.occurName}部门，请于${message.occurTime}到${message.occurPlace}参加面试。
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 8}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">${message.teamName} 团队已经被您解散。</div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 9}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">${message.teamName} 团队已经被<a target="_blank"
                                                                              href="briefPersonInfo?id=${message.personId}">${message.personName}</a>解散。
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 10}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">您成功创建团队：${message.teamName}。</div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 11}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">成功更改${message.teamName}团队的团队信息。</div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 12}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9"><a target="_blank"
                                                     href="briefPersonInfo?id=${message.personId}">${message.personName}</a>已经被请出队伍：${message.teamName}
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 13}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">您已经被<a target="_blank"
                                                         href="briefPersonInfo?id=${message.personId}">${message.personName}</a>请出队伍：${message.teamName}
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                    <c:when test="${message.messageType == 14}">
                        <div class="row border-line">
                            <div class="col-md-1">${status.index+1}</div>
                            <div class="col-md-9">科协发来消息：${message.msgContent}
                            </div>
                            <div class="col-md-2">${message.time}</div>
                        </div>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
        <div class="container-fluid" style="padding: 20px">
            <div class="row">
                <div class="col-md-4 col-md-offset-8">
                    <div class="row">
                        <div class="col-sm-6">
                            <button class="am-btn am-btn-default" id="prePageBtn">
                                <i class="am-icon-arrow-left"></i>
                                上一页
                            </button>
                        </div>
                        <div class="col-sm-6">
                            <button class="am-btn am-btn-default" id="nextPageBtn">
                                下一页
                                <i class="am-icon-arrow-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="msg">
    <div class="am-modal-dialog">
        <center>
            <h3>提示</h3>
            <h6 id="msgContent">
            </h6>
        </center>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm id="confirmBtn">确定</span>
        </div>
    </div>
</div>
<script>
    $("#prePageBtn").click(function () {
        window.location.href = "siteMessage?targetPage=${sessionScope.targetPage-1}";
    });
    $("#nextPageBtn").click(function () {
        window.location.href = "siteMessage?targetPage=${sessionScope.targetPage+1}";
    });

    function acceptApplication(messageId, personId, teamId) {
        $.ajax({
            type: "POST",  //提交方式
            url: "accpetApplyToJoin",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "messageId": messageId,
                "receiverId": personId,
                "teamId": teamId
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理

                $("#msgContent").html(result.reason);
                var option = {
                    "closeViaDimmer": false,
                    onConfirm: function () {
                        window.location.href = "siteMessage?targetPage=${sessionScope.targetPage}";
                    }
                };
                $("#msg").modal(option);

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function rejectApplication(messageId, personId, teamId) {
        $.ajax({
            type: "POST",  //提交方式
            url: "rejectApplyToJoin",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "messageId": messageId,
                "receiverId": personId,
                "teamId": teamId
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理

                if (result.status == 'success') {
                    $("#msgContent").html("已拒绝！");
                    var option = {
                        "closeViaDimmer": false,
                        onConfirm: function () {
                            window.location.href = "siteMessage?targetPage=${sessionScope.targetPage}";
                        }
                    };
                    $("#msg").modal(option);
                }
                else {
                    $("#msgContent").html("出现未知错误！请联系科协成员。");
                    var option = {
                        "closeViaDimmer": false
                    };
                    $("#msg").modal(option);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

</script>
</body>
</html>
