<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>科协后台管理系统</title>
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="frame/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="frame/bootstrap-3.3.4-dist/css/bootstrap.min.css">
    <style>
        * {
            font-family: "Microsoft YaHei";
        }

        a {
            text-decoration: none;
        }

        .clean {
            margin: 0;
            padding: 0;
        }

        .top-module {
            background-color: #009cda;
            height: 10vh;
            line-height: 10vh;
            font-family: "Microsoft YaHei";
        }

        .admin-navigation {
            height: 100%;
            background: -webkit-linear-gradient(top, #000, #fff); /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(top, #000, #fff); /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(top, #000, #fff); /* Firefox 3.6 - 15 */
            background: linear-gradient(to bottom, #000, #fff); /* 标准的语法 */
        }

        .navigation-item {
            height: 8vh;
            width: 100%;
            transition: background 0.5s;
            -moz-transition: background 0.5s; /* Firefox 4 */
            -webkit-transition: background 0.5s; /* Safari 和 Chrome */
            -o-transition: background 0.5s; /* Opera */
            margin: 0;
        }

        .navigation-item-active {
            background-color: #1f1d1e;
        }

        .navigation-item:hover {
            background-color: #1f1d1e;
            transition: background 0.5s;
            -moz-transition: background 0.5s; /* Firefox 4 */
            -webkit-transition: background 0.5s; /* Safari 和 Chrome */
            -o-transition: background 0.5s; /* Opera */
        }

        .navigation-item div {
            color: #fff;
            width: 100%;
            font-family: "Microsoft YaHei";
            text-align: center;
            font-size: 1.5rem;
            line-height: 8vh;
        }

        .sta-navigation-item {
            color: #fff;
            font-size: 1rem;
            line-height: 6vh;
            background-color: #464445;
            height: 6vh;
            transition: background 0.5s;
            -moz-transition: background 0.5s; /* Firefox 4 */
            -webkit-transition: background 0.5s; /* Safari 和 Chrome */
            -o-transition: background 0.5s; /* Opera */
            margin: 0;
        }

        .sta-navigation-item:hover {
            background-color: #1f1d1e;
            transition: background 0.5s;
            -moz-transition: background 0.5s; /* Firefox 4 */
            -webkit-transition: background 0.5s; /* Safari 和 Chrome */
            -o-transition: background 0.5s; /* Opera */
            margin: 0;
        }

        .dropdown-menu li {
            padding: 2px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .dropdown-menu li:hover {
            background-color: #ddd;
        }

    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-9 col-sm-9 col-md-9 top-module" style="color: #fff;font-size: 2rem">
            中南大学软件学院科协后台管理系统
        </div>
        <div class="col-xs-3 col-sm-3 col-md-3 top-module text-center">
            管理员：${sessionScope.currentAdmin.name}
            &nbsp;
            &nbsp;
            &nbsp;
            <a href="adminlogout" style="color: #fff">注销</a>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2 col-md-2 admin-navigation" style="padding: 0">
            <a href="adminUser?targetPage=1">
                <div class="row navigation-item 
                <c:if test='${requestScope.admin=="admin-user" || param.admin=="admin-user"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;用户
                    </div>
                </div>
            </a>
            <a href="adminCompetition?targetPage=1">
                <div class="row navigation-item
                <c:if test='${requestScope.admin=="admin-competition" ||param.admin=="admin-competition"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;比赛
                    </div>
                </div>
            </a>
            <a href="adminGroup?targetPage=1">
                <div class="row navigation-item
                <c:if test='${requestScope.admin=="admin-group" ||param.admin=="admin-group"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;组队
                    </div>
                </div>
            </a>
            <a href="adminLecture?targetPage=1">
                <div class="row navigation-item
                <c:if test='${requestScope.admin=="admin-lecture" || param.admin=="admin-lecture"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-signal" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;讲座
                    </div>
                </div>
            </a>
            <a href="adminResource?targetPage=1">
                <div class="row navigation-item
                <c:if test='${requestScope.admin=="admin-resource" || param.admin=="admin-resource"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;资源
                    </div>
                </div>
            </a>
            <a href="adminStaDepartment">
                <div class="row navigation-item
                <c:if test='${requestScope.admin=="admin-sta" || param.admin=="admin-sta"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;科协
                    </div>
                </div>
            </a>
            <a href="adminMessage">
                <div class="row navigation-item
                <c:if test='${requestScope.admin=="admin-message" || param.admin=="admin-message"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;消息
                    </div>
                </div>
            </a>
            <a href="allAdmin">
                <div class="row navigation-item
                <c:if test='${requestScope.admin=="admin-administrator" || param.admin=="admin-administrator"}'>
                    navigation-item-active
                </c:if>">
                    <div class="col-xs-12 col-md-12 col-md-12">
                        <span class="glyphicon glyphicon-tower" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;管理员
                    </div>
                </div>
            </a>
        </div>
        <c:choose>
            <c:when test='${requestScope.admin=="admin-user" || param.admin=="admin-user"}'>
                <jsp:include page="admin-user.jsp"/>
            </c:when>
            <c:when test='${requestScope.admin=="admin-competition" || param.admin=="admin-competition"}'>
                <jsp:include page="admin-competition.jsp"/>
            </c:when>
            <c:when test='${requestScope.admin=="admin-group" || param.admin=="admin-group"}'>
                <jsp:include page="admin-group.jsp"/>
            </c:when>
            <c:when test='${requestScope.admin=="admin-lecture" || param.admin=="admin-lecture"}'>
                <jsp:include page="admin-lecture.jsp"/>
            </c:when>
            <c:when test='${ requestScope.admin=="admin-resource" || param.admin=="admin-resource"}'>
                <jsp:include page="admin-resource.jsp"/>
            </c:when>
            <c:when test='${ requestScope.admin=="admin-sta" || param.admin=="admin-sta"}'>
                <jsp:include page="admin-sta.jsp"/>
            </c:when>
            <c:when test='${requestScope.admin=="admin-message" || param.admin=="admin-message"}'>
                <jsp:include page="admin-message.jsp"/>
            </c:when>

            <c:when test='${requestScope.admin=="admin-group-detail" || param.admin=="admin-group-detail"}'>
                <jsp:include page="admin-group-detail.jsp"/>
            </c:when>
            <c:when test='${requestScope.admin=="admin-modify-resource-info" || param.admin=="admin-modify-resource-info"}'>
                <jsp:include page="admin-modify-resource-info.jsp"/>
            </c:when>
            <c:when test='${requestScope.admin=="admin-new-resource-info" || param.admin=="admin-new-resource-info"}'>
                <jsp:include page="admin-new-resource-info.jsp"/>
            </c:when>
            <c:when test='${requestScope.admin=="admin-administrator" || param.admin=="admin-administrator"}'>
                <jsp:include page="admin-administrator.jsp"/>
            </c:when>
        </c:choose>
    </div>
</div>
</body>
</html>
