<%@ page import="domain.Person" %>
<%@ page import="util.ConstantUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组队信息</title>
    <link rel="stylesheet" href="frame/bootstrap-3.3.4-dist/css/bootstrap.min.css">
    <script src="frame/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        #avatar {
            width: 8vw;
            height: 8vw;
            border-radius: 4vw;
        }

        th, td {
            text-align: center;
        }

        table tbody tr td {
            font-size: 1vw;
        }

        .am-modal-btn:hover {
            background-color: #aab3ff;
        }

        .am-modal-dialog table tbody tr td:hover {
            background-color: rgba(27, 162, 254, 0.50);
        }

        .w-3 {
            width: 3vw;
        }
    </style>
</head>
<body>

<%@include file="header.jsp" %>
<img src="img/main/STA.png" style="margin-top: 50px;width: 100%;height: auto"/>

<div style=";margin-top: 5vh;margin-left: 10vw;margin-right: 10vw">
    <%@include file="siteNavigation.jsp" %>

    <div style="width: 60vw;float: left;margin-left: 5vw">

        <h1><span class="am-icon-users am-icon-sm"></span>&nbsp;组队信息</h1>
        <hr style="width: 100%;border: black 2px groove">
        <div class="am-g am-g-collapse">
            <div class="am-u-sm-12 am-u-md-9 am-u-lg-12 am-u-sm-centered">
                <div data-am-widget="tabs" class="am-tabs am-tabs-d2">
                    <ul class="am-tabs-nav am-cf">
                        <li class="am-active"><a href="[data-tab-panel-0]">我发起的团队</a></li>
                        <li class=""><a href="[data-tab-panel-1]">我加入的团队</a></li>
                    </ul>
                    <div class="am-tabs-bd">
                        <div data-tab-panel-0 class="am-tab-panel am-active">
                            <table class="am-table am-table-striped am-table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>团队标题</th>
                                    <th>目前人数</th>
                                    <th>目标人数</th>
                                    <th>发布时间</th>
                                    <th>截止时间</th>
                                    <th>发起人</th>
                                    <th>成员信息</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="team" items="${sessionScope.releaseTeams}" varStatus="status">
                                    <tr>
                                        <td>${status.index+1}</td>
                                        <td>${team.name}</td>
                                        <td>${team.currentSize}</td>
                                        <td>${team.teamSize}</td>
                                        <td>${team.publishTime}</td>
                                        <td>${team.expiryDate}</td>
                                        <td>${sessionScope.person.name}</td>
                                        <td><a href="javascript:releaseGroupDetail(${team.id})">详情</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div data-tab-panel-0 class="am-tab-panel am-active">
                            <table class="am-table am-table-striped am-table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>团队标题</th>
                                    <th>目前人数</th>
                                    <th>目标人数</th>
                                    <th>发布时间</th>
                                    <th>截止时间</th>
                                    <th>发起人</th>
                                    <th>成员信息</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="team" items="${sessionScope.joinTeams}" varStatus="status">
                                    <tr>
                                        <td>${status.index+1}</td>
                                        <td>${team.name}</td>
                                        <td>${team.currentSize}</td>
                                        <td>${team.teamSize}</td>
                                        <td>${team.publishTime}</td>
                                        <td>${team.expiryDate}</td>
                                        <td><a href="briefPersonInfo?id=${sessionScope.ministers[status.index].id}"
                                               target="_blank">${sessionScope.ministers[status.index].name}</a></td>
                                        <td><a href="javascript:joinGroupDetail(${team.id})">详情</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="groupDetailMsg">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">复仇者联盟团队的成员信息</div>
        <table class="am-table am-table-striped">
            <tbody id="groupMsgTB">

            </tbody>
        </table>
        <div class="am-modal-bd" style="color: #ff0000">
            您想要解散该团队吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
        </div>
    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="removePersonConfirmMsg">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">请出队伍</div>

        <div class="am-modal-bd" style="color: #ff0000">
            您确定要将该成员&nbsp;<span id="removePersonName"></span>&nbsp;请出队伍吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
        </div>
    </div>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="removePersonResultMsg">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">提示</div>

        <div class="am-modal-bd" style="color: #ff0000" id="removePersonResultMsgContent">
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="deleteTeamResultMsg">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">提示</div>

        <div class="am-modal-bd" style="color: #ff0000" id="deleteTeamResultMsgContent">
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="joinGroupDetailMsg">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">复仇者联盟团队的成员信息</div>
        <table class="am-table am-table-striped">
            <tbody id="joinGroupMsgTB">

            </tbody>
        </table>
        <div class="am-modal-bd" style="color: #ff0000">
            您想要退出该团队吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
        </div>
    </div>
</div>
<script>
    /*使用ajax根据团队id查询团队成员信息，并显示到模态对话框中，这里是用户自己发布的团队*/
    function releaseGroupDetail(teamId) {
        $.ajax({
            type: "POST",  //提交方式
            url: "groupDetail",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "teamId": teamId
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理
                showGroupMsg(result, teamId);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

    var displayPerRow = <%=ConstantUtil.NUMBER_OF_RECORDS_IN_SITE_GROUP%>;

    function showGroupMsg(personsJson, teamId) {

        var $tbody = $("#groupMsgTB");
        $tbody.children().remove();
        var $tr = $("<tr></tr>");

        if (personsJson.personIdANdName.length < 1) {
            var $td = $("<td>还没有人加入您的团队，赶紧去宣传吧！</td>");
            $tr.append($td);
            $tbody.append($tr);
        }
        else {
            for (var i = 0; i < personsJson.personIdANdName.length; i++) {
                var $td = $("<td></td>");
                var $a = $("<a target='_blank' href='briefPersonInfo?id=" + personsJson.personIdANdName[i].id + "'>" + personsJson.personIdANdName[i].name + "</a>");
                var $click = "removePerson(" + personsJson.personIdANdName[i].id + "," + "'" + personsJson.personIdANdName[i].name + "'" + "," + teamId + ")";
                var $span = $("<span class='glyphicon glyphicon-remove w-3' aria-hidden='true' onclick=" + $click + "></span>");


                $td.append($a);
                $td.append($span);
                $tr.append($td);

                if (i != 0 && (i + 1) % displayPerRow == 0) {
                    $tbody.append($tr);
                    $tr = $("<tr></tr>");
                }
            }
            $tbody.append($tr);
        }

        $('#groupDetailMsg').modal({
            onConfirm: function (options) {
                $.ajax({
                    type: "POST",  //提交方式
                    url: "teamFallingApart",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "teamId": teamId
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.operateStatus == "success") {
                            $("#deleteTeamResultMsgContent").html("操作成功！");
                            $('#deleteTeamResultMsg').modal({
                                onConfirm: function (options) {
                                    window.location.href = "siteGroupMessage";
                                }
                            });
                        }
                        else {
                            $("#deleteTeamResultMsgContent").html("操作失败！");
                            $('#deleteTeamResultMsg').modal({});
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            },
            onCancel: function () {
            }
        });
    }

    /*遇到一个奇怪的bug，如果直接在下面的onConfirm里面使用personId或者personName的话，
     * 比如当我们第一次点击了id为1，名称为张三的旁边的×表示将该成员请出团队，则后面无论点击任何一个选项都不会变，只有将
     * 页面刷新才行，现在在外部新添了pId，和Pname两个全局变量才得以解决问题。
     * */
    var pId;
    var pName;
    function removePerson(personId, personName, teamId) {

        pId = personId;
        pName = personName;
        pTeamId = teamId;
        $("#removePersonName").html(personName);

        $('#removePersonConfirmMsg').modal({
            onConfirm: function (options) {
//                alert(pId + pName + pTeamId);
                $.ajax({
                    type: "POST",  //提交方式
                    url: "removePerson",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "pId": pId,
                        "pTeamId": pTeamId
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.operateStatus == "success") {
                            $("#removePersonResultMsgContent").html("操作成功！");
                            $('#removePersonResultMsg').modal({
                                onConfirm: function (options) {
                                    $('#groupDetailMsg').modal({});
                                    window.location.href = "siteGroupMessage";
                                }
                            });
                        }
                        else {
                            $("#removePersonResultMsgContent").html("操作失败！");
                            $('#removePersonResultMsg').modal({});
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            },
            // closeOnConfirm: false,
            onCancel: function () {
//                alert('cancel');
            }
        });
    }

    /*使用ajax根据团队id查询团队成员信息，这里是用户参与的团队*/
    function joinGroupDetail(teamId) {
        $.ajax({
            type: "POST",  //提交方式
            url: "groupDetail",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "teamId": teamId
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理
                showJoinGroupMsg(result, teamId);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function showJoinGroupMsg(personsJson, teamId) {

        var $tbody = $("#joinGroupMsgTB");
        $tbody.children().remove();
        var $tr = $("<tr></tr>");
        for (var i = 0; i < personsJson.personIdANdName.length; i++) {
            var $td = $("<td></td>");
            var $a = $("<a target='_blank' href='briefPersonInfo?id=" + personsJson.personIdANdName[i].id + "'>" + personsJson.personIdANdName[i].name + "</a>");
            $td.append($a);
            $tr.append($td);

            if (i != 0 && (i + 1) % displayPerRow == 0) {
                $tbody.append($tr);
                $tr = $("<tr></tr>");
            }
        }
        $tbody.append($tr);

        $('#joinGroupDetailMsg').modal({
            onConfirm: function (options) {
                $.ajax({
                    type: "POST",  //提交方式
                    url: "getRidOfGroup",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "pId": ${sessionScope.person.id},
                        "pTeamId": teamId
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.operateStatus == "success") {
                            $("#removePersonResultMsgContent").html("操作成功！");
                            $('#removePersonResultMsg').modal({
                                onConfirm: function (options) {
                                    window.location.href = "siteGroupMessage";
                                }
                            });
                        }
                        else {
                            $("#removePersonResultMsgContent").html("操作失败！");
                            $('#removePersonResultMsg').modal({});
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            },
            onCancel: function () {
            }
        });
    }
</script>
</body>
</html>
