<%@ page import="java.util.List" %>
<%@ page import="domain.Resource" %>
<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/1
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>资源下载</title>
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="frame/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="frame/bootstrap-3.3.4-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/color-5279.css">
    <link rel="stylesheet" href="css/color-5300.css">
    <link rel="stylesheet" href="css/color-0000.css">
    <style>
        .font-small * {
            font-size: small;
        }

        #pageBody {
            background: -webkit-linear-gradient(left top, #C4F2C8, #E6DAF7, #E7EBC3, #D8DDF0, #EDD1D1); /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(bottom right, #C4F2C8, #E6DAF7, #E7EBC3, #D8DDF0, #EDD1D1); /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(bottom right, #C4F2C8, #E6DAF7, #E7EBC3, #D8DDF0, #EDD1D1); /* Firefox 3.6 - 15 */
            background: linear-gradient(to bottom right, #C4F2C8, #E6DAF7, #E7EBC3, #D8DDF0, #EDD1D1); /* 标准的语法 */
        }

        .quickSearch {
            text-align: center;
            padding: 2px;
        }

        .quickSearch a {
            text-decoration: none;
            color: #11661a;
            font-family: "Segoe UI", "Lucida Grande", Helvetica, Arial, "Microsoft YaHei", FreeSans, Arimo, "Droid Sans", "wenquanyi micro hei", "Hiragino Sans GB", "Hiragino Sans GB W3", FontAwesome, sans-serif;
            font-weight: 900;
        }

        #searchBtn, #selectPageBtn {
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
            background-color: #1ad5ff;
            color: #fff;
            font-weight: 700;
            transition: background 0.5s;
            -moz-transition: background 0.5s; /* Firefox 4 */
            -webkit-transition: background 0.5s; /* Safari 和 Chrome */
            -o-transition: background 0.5s; /* Opera */

        }

        #searchBtn:hover, #selectPageBtn:hover {
            background-color: #ff5974;
            transition: background 0.5s;
            -moz-transition: background 0.5s; /* Firefox 4 */
            -webkit-transition: background 0.5s; /* Safari 和 Chrome */
            -o-transition: background 0.5s; /* Opera */
        }

        .table tr td:last-child {
            text-align: center;
        }
    </style>
</head>
<body id="pageBody">
<%@include file="header.jsp" %>
<img src="img/resource/resourceTitle.jpg" style="margin-top: 50px;width: 100vw;height: auto"/>

<div class="container-fluid font-small">
    <div class="row">
        <div class="col-sm-1 color-5279-1 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=java">Java</a></div>
        <div class="col-sm-1 color-5279-2 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=IOS">IOS</a></div>
        <div class="col-sm-1 color-5279-3 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=Android">Android</a></div>
        <div class="col-sm-1 color-5279-4 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=C">C++</a></div>
        <div class="col-sm-1 color-5279-5 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=汇编语言">汇编语言</a></div>
        <div class="col-sm-1 color-5300-5 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=数据库系统">数据库系统</a></div>
        <div class="col-sm-1 color-0000-1 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=数据结构">数据结构</a></div>
        <div class="col-sm-1 color-0000-2 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=高数">高数</a></div>
        <div class="col-sm-1 color-0000-3 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=计算机网络">计算机网络</a></div>
        <div class="col-sm-1 color-0000-4 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=软件架构">软件架构</a></div>
        <div class="col-sm-1 color-0000-5 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=软件测试">软件测试</a></div>
        <div class="col-sm-1 color-0000-6 quickSearch"><a href="retriveResourceByPage?targetPage=1&key=SOA">SOA</a></div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3" style="padding-top: 1vh">
            <div class="input-group">
                <input type="text" id="keyInput" class="form-control" placeholder="请输入查找资源的名称："
                       aria-describedby="basic-addon2"
                <c:if test="${sessionScope.key != null}">
                       value="${sessionScope.key}"
                </c:if>
                        >
                <span class="input-group-addon btn" id="searchBtn">Go!</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>资源名称</th>
                    <th>资源大小</th>
                    <th>资源下载次数</th>
                    <th>资源简介</th>
                    <th>最后修改时间</th>
                    <th style="text-align: center">下载地址</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty sessionScope.resources}">
                        <span style="font-size: 2em">很抱歉，这里没有你想要的...</span>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="resource" items="${sessionScope.resources}" varStatus="status">
                            <tr class="color-5279-${status.index+1}">
                                <th scope="row">${status.index+1}</th>
                                <td>${resource.name}</td>
                                <td>${resource.size}</td>
                                <td>${resource.downloadTimes}</td>
                                <td>
                                    <span
                                            data-am-popover="{theme: 'success sm', content: '${resource.introduce}', trigger: 'hover focus'}">
                                        查看简介
                                    </span>
                                </td>
                                <td name="lastTime">${resource.time}</td>
                                <td><a href="javascript:download('${resource.id}')">下载</a></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4 text-center col-sm-offset-2">
            <nav>
                <ul class="pagination">
                    <li>
                        <a href="javascript:previousPage()" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="${sessionScope.startAndEnd.start}" end="${sessionScope.startAndEnd.end}"
                               varStatus="status">
                        <li<c:if test="${status.index==sessionScope.targetPage}"> class="active"</c:if>>
                            <a href="retriveResourceByPage?targetPage=${status.index}&key=${sessionScope.key}">${status.index}</a>
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
        <div class="col-sm-4 text-center">
            <div class="input-group" style="padding:3vh">
                <span class="input-group-addon" style="border-radius: 0">一共${sessionScope.pageNumber}页</span>
                <input id="page" type="text" class="form-control" placeholder="在这里输入要跳转页的号码：" aria-describedby="basic-addon2"
                       value="${sessionScope.targetPage}">
                <span class="input-group-addon btn" id="selectPageBtn" style="border-radius: 0">Go!</span>
            </div>
        </div>
    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="joinMsg">
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
<script>

    var time = $("[name='lastTime']").text();

    $("#searchBtn").click(function sayHello() {
        var key = $("#keyInput").val().trim();
        var url = "retriveResourceByPage?targetPage=1&key=" + key;
        window.location.href = url;
    });
    function download(resourceId) {
        if (${sessionScope.person == null}) {
            alert("没有登录的用户不能下载哦！");
            return;
        }
        else {
            $.ajax({
                type: "POST",  //提交方式
                url: "downloadResource",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "resourceId": resourceId
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.downloadStatus == 'ok') {
                        window.location.href = "<%=request.getContextPath()%>"+"/"+result.downloadUrl;
                    }
                    else{
                        alert("下载失败！");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>
<script>
    function previousPage() {
        if ((<s:property value="#session.targetPage"/>) <= 1) {
            window.location.href = "retriveResourceByPage?targetPage=1&key=${sessionScope.key}";
        }
        else {
            window.location.href = "retriveResourceByPage?targetPage=${sessionScope.targetPage-1}&key=${sessionScope.key}";
        }
    }
    function nextPage() {
        if ((<s:property value="#session.targetPage"/>) >=   (<s:property value="#session.pageNumber"/>)) {
            window.location.href = "retriveResourceByPage?targetPage=${sessionScope.pageNumber}&key=${sessionScope.key}";
        }
        else {
            window.location.href = "retriveResourceByPage?targetPage=${sessionScope.targetPage+1}&key=${sessionScope.key}";
        }
    }

    $("#selectPageBtn").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${sessionScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "retriveResourceByPage?targetPage=" + targetPage;
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

</script>
</body>
</html>
