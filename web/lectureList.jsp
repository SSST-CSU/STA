<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/14
  Time: 15:55
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
    <title>听讲座</title>
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
<img src="img/lecture/lectureTitle.png" style="margin-top: 50px;width: 100vw;height: auto"/>

<div style="text-align: center;margin-top: 20px;margin-left: 10vw;margin-right: 10vw">
    <form class="am-form-inline" role="form">
        <div class="am-form-group">
            <input type="text" class="am-form-field button-block" placeholder="讲座关键字……" id="searchKey"
            <c:if test="${requestScope.key != null}">
                   value="${requestScope.key}"
            </c:if>>
        </div>
        <a class="button button-royal button-rounded" id="searchBtn" href="javascript:retriveBykey()">搜索讲座</a>
    </form>
    <table class="am-table am-table-striped am-table-hover">
        <thead>
        <tr>
            <th style="width: 40%">讲座名称</th>
            <th>时间</th>
            <th>介绍</th>
            <th style="text-align: center">操作</th>
        </tr>
        </thead>

        <tbody>

        <c:choose>
            <c:when test="${empty requestScope.lectures}">
                <span style="font-size: 2em">很抱歉，这里没有你想要的...</span>
            </c:when>
            <c:otherwise>
                <c:forEach var="lecture" items="${requestScope.lectures}" varStatus="status">
                    <tr style="vertical-align: middle">
                        <td>${lecture.name}</td>
                        <td>${lecture.time}</td>
                        <td><span
                                data-am-popover="{theme: 'success sm', content: '${lecture.introduce}', trigger: 'hover focus'}">
                                        查看介绍
                                    </span></td>
                        <td style="text-align: center">
                            <c:choose>
                                <c:when test="${lecture.accessable == 1}">
                                    <a name="join" class="button button-caution button-tiny"
                                       onclick="applyToJoinLecture('${lecture.id}')">申请加入</a>
                                </c:when>
                                <c:when test="${lecture.accessable == 0}">
                                    <a name="join" class="button button-caution button-tiny disabled">不可申请</a>
                                </c:when>
                            </c:choose>
                            <a  class="button button-royal button-tiny"
                                    <c:if test="${lecture.accessable == 1}">
                                        href="checkParticipants?id=${lecture.id}"
                                    </c:if>
                               target="_Blank">查看参加者名单</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

</div>
<ul class="am-pagination am-pagination-centered">
    <li><a href="javascript:previousPage()">&laquo;</a></li>

    <c:forEach begin="${requestScope.startAndEnd.start}" end="${requestScope.startAndEnd.end}" varStatus="status">
    <li
    <c:if test="${status.index==requestScope.targetPage}">
            class="am-active"
    </c:if>
            ><a href="retriveLectureByPage?targetPage=${status.index}&key=${requestScope.key}">${status.index}
        </c:forEach>
        <li><a href="javascript:nextPage()">&raquo;</a></li>
        <li>共${requestScope.pageNumber}页，跳转到<input id="page" type="text"
                                                   value="${requestScope.targetPage}">页
            <button id="changePage" class="button button-tiny button-pill button-primary button-caution"
                    style="margin-left: 1vh">确定
            </button>
        </li>
</ul>
<div class="am-modal am-modal-confirm" tabindex="-1" id="msg">
    <div class="am-modal-dialog">
        <center>
            <h3>消息提示</h3>
            <h6 id="msgContent">
            </h6>
        </center>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm id="confirmBtn">确定</span>
        </div>
    </div>
</div>
</body>
</body>
<script>

    function applyToJoinLecture(id) {

        if (${requestScope.person == null}) {
            $("#msgContent").html("请先登录！");
            $("#msg").modal();
            return;
        }

        $.ajax({
            type: "POST",  //提交方式
            url: "applyToJoinLecture",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "id": id
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理
                $("#msgContent").html(result.result);
                $("#msg").modal();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

    }

    function previousPage() {
        if (${requestScope.targetPage<=1}) {
            var url = "retriveLectureByPage?targetPage=" + 1;
            if (${requestScope.key!=null}) {
                url += "&key=${requestScope.key}";
            }
            window.location.href = url;
        }
        else {
            var url = "retriveLectureByPage?targetPage=" + (${requestScope.targetPage-1});
            if (${requestScope.key!=null}) {
                url += "&key=${requestScope.key}";
            }
            window.location.href = url;
        }
    }
    function nextPage() {
        if (${requestScope.targetPage>=requestScope.pageNumber}) {
            var url = "retriveLectureByPage?targetPage=" + (${requestScope.pageNumber});
            if (${requestScope.key!=null}) {
                url += "&key=${requestScope.key}";
            }
            window.location.href = url;
        }
        else {
            var url = "retriveLectureByPage?targetPage=" + (${requestScope.targetPage+1});
            if (${requestScope.key!=null}) {
                url += "&key=${requestScope.key}";
            }
            window.location.href = url;
        }
    }
    function retriveBykey() {
        var url = "retriveLectureByPage?targetPage=1";
        if ($("#searchKey").val().trim() != "") {
            url += "&key=" + $("#searchKey").val();
        }
        window.location.href = url;
    }

    $("#changePage").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${requestScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "retriveLectureByPage?targetPage=" + targetPage;
            if (${requestScope.key!=null}) {
                url += "&key=${requestScope.key}";
            }
            window.location.href = url;
        }
        else {
            $("#msgContent").html("输入不合法！");
            $("#msg").modal({});
        }
    });

</script>
</html>
