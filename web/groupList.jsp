<%@ page import="java.util.List" %>
<%@ page import="domain.Person" %>
<%@ page import="domain.Team" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/23
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/app.css">
    <link rel="stylesheet" href="css/button.css">
    <title></title>
    <style type="text/css" rel="stylesheet">
        @font-face {
            font-family: title;
            src: url("font/title.TTF");
        }

        #page {
            border-top: medium none;
            border-left: medium none;
            border-right: medium none;
            width: 10vh;
            text-align: center;
            line-height: 5vh;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<img src="img/group/groupTitle.png" style="margin-top: 50px;width: 100vw;height: auto"/>

<div style="text-align: center;margin-top: 20px;margin-left: 10vw;margin-right: 10vw">
    <form class="am-form-inline" role="form">
        <div class="am-form-group">
            <input type="text" class="am-form-field button-block" placeholder="团队关键字……" id="searchKey"
                   value="${sessionScope.key}">
        </div>
        <a class="button button-royal button-rounded" href="javascript:retriveBykey()">搜索团队</a>
    </form>
    <table class="am-table am-table-striped am-table-hover">
        <thead>
        <tr>
            <th style="width: 40%">组队标题<a href="javascript:releaseGroupInfo()"
                                          class="button button-tiny button-pill button-primary"
                                          style="margin-left: 10%">我要发布</a></th>
            <th>已加入/总人数</th>
            <th>发起人</th>
            <th>时间截止</th>
            <th>查看详细</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${sessionScope.teams != null}">
            <c:forEach var="team" items="${sessionScope.teams}" varStatus="status">
                <tr style="vertical-align: middle">
                    <td>${team.name}
                    </td>
                    <td>${team.currentSize}/${team.teamSize}
                    </td>
                    <td>${sessionScope.ministers[status.index].name}
                    </td>
                    <td>${team.expiryDate}
                    </td>
                    <td><a class="button button-caution button-tiny" data-am-modal="{target: '#information'}"
                           onclick="javascript:showDetail('${team.name}','${sessionScope.ministers[status.index].name}','${team.teamSize}','${team.currentSize}','${team.publishTime}','${team.introduce}','${team.expiryDate}','${team.id}')">Show</a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <ul class="am-pagination am-pagination-centered">
        <li><a href="javascript:previousPage()">&laquo;</a></li>

        <c:forEach begin="${sessionScope.startAndEnd.start}" end="${sessionScope.startAndEnd.end}" varStatus="status">
        <li
        <c:if test="${status.index==sessionScope.targetPage}">
                class="am-active"
        </c:if>
                ><a href="retriveTeamByPage?targetPage=${status.index}&key=${sessionScope.key}">${status.index}
            </c:forEach>
            <li><a href="javascript:nextPage()">&raquo;</a></li>
            <li>共${sessionScope.pageNumber}页，跳转到<input id="page" type="text"
                                                       value="${sessionScope.targetPage}">页
                <button id="changePage" class="button button-tiny button-pill button-primary button-caution"
                        style="margin-left: 1vh">确定
                </button>
            </li>
    </ul>

</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="groupDetailMsg">
    <div class="am-modal-dialog">
        <center>
            <h3>团队详细信息</h3>
            <table class="am-table am-table-hover" style="width: 90%">
                <tbody>
                <tr>
                    <td>团队名称：</td>
                    <td><span id="title"></span></td>
                </tr>
                <tr>
                    <td>发起人：</td>
                    <td><span id="leader"></span></td>
                </tr>
                <tr>
                    <td>现有人数：</td>
                    <td><span id="nowNum"></span></td>
                </tr>
                <tr>
                    <td>还需人数：</td>
                    <td><span id="needNum"></span></td>
                </tr>
                <tr>
                    <td>发布日期：</td>
                    <td><span id="publishTime"></span></td>
                </tr>
                <tr>
                    <td>截止日期：</td>
                    <td><span id="deadline"></span></td>
                </tr>
                <tr>
                    <td>详细说明：</td>
                    <td><span id="introduce"></span></td>
                </tr>
                </tbody>
            </table>
            <h6 style="color: #6cd86b">
                您想要加入该团队吗？
            </h6>
        </center>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
            <span class="am-modal-btn" data-am-modal-confirm id="applyToJoinGroup">确定</span>
        </div>
    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="joinMsg">
    <div class="am-modal-dialog">
        <center>
            <h3>发布组队信息</h3>
            <h6 id="msgContent">
            </h6>
        </center>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm id="confirmBtn">确定</span>
        </div>
    </div>
</div>
</body>

<script>
    function showDetail(name, minister, teamSize, currentSize, publishTime, introduce, dateLine, GroupId) {
        $("#title").text(name);
        $("#leader").text(minister);
        $("#needNum").text(teamSize - currentSize);
        $("#nowNum").text(currentSize);
        $("#publishTime").text(publishTime);
        $("#deadline").text(dateLine);
        $("#introduce").text(introduce);
        selectGroupId = GroupId;

        $('#groupDetailMsg').modal({});

    }

    $("#changePage").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${sessionScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "retriveTeamByPage?targetPage=" + targetPage;
            if (${sessionScope.key!=null}) {
                url += "&key=${sessionScope.key}";
            }
            window.location.href = url;
        }
        else {
            $("#msgContent").html("输入不合法！");
            $("#joinMsg").modal({});
        }
    });

    function previousPage() {
        if ((<s:property value="#session.targetPage"/>) <= 1) {
            var url = "retriveTeamByPage?targetPage=" + 1;
            if (${sessionScope.key!=null}) {
                url += "&key=${sessionScope.key}";
            }
            window.location.href = url;
        }
        else {
            var url = "retriveTeamByPage?targetPage=" + (<s:property value="#session.targetPage"/>-1);
            if (${sessionScope.key!=null}) {
                url += "&key=${sessionScope.key}";
            }
            window.location.href = url;
        }
    }
    function nextPage() {
        if ((<s:property value="#session.targetPage"/>) >= (<s:property value="#session.pageNumber"/>)) {
            var url = "retriveTeamByPage?targetPage=" + <s:property value="#session.pageNumber"/>;
            if (${sessionScope.key!=null}) {
                url += "&key=${sessionScope.key}";
            }
            window.location.href = url;
        }
        else {
            var url = "retriveTeamByPage?targetPage=" + (<s:property value="#session.targetPage"/>+1);
            if (${sessionScope.key!=null}) {
                url += "&key=${sessionScope.key}";
            }
            window.location.href = url;
        }
    }

    function releaseGroupInfo() {
        if (${sessionScope.person == null}) {
            $("#msgContent").html("您还未登录，请先登录！");
            $("#joinMsg").modal({});
            return;
        }
        else {
            window.location.href = "groupRelease.jsp";
        }
    }

    var selectGroupId;
    $("#applyToJoinGroup").click(function () {

        if (${sessionScope.person == null}) {
            $("#msgContent").html("您还未登录，请先登录！");
            $("#joinMsg").modal({});
            return;
        }

        $.ajax({
            type: "POST",  //提交方式
            url: "applyToJoinGroup",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "groupId": selectGroupId
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理

                if (result.applyStatus == 'success') {
                    $("#msgContent").html("申请成功，" + result.reason);
                    $("#joinMsg").modal({});
                }
                else {
                    $("#msgContent").html("申请失败，" + result.reason);
                    $("#joinMsg").modal({});
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

    });
    function retriveBykey() {
        var url = "retriveTeamByPage?targetPage=1";
        if ($("#searchKey").val().trim() != "") {
            url += "&key=" + $("#searchKey").val();
        }
        window.location.href = url;
    }
</script>
</html>
