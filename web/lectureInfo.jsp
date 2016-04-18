<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/14
  Time: 16:24
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
  </style>
</head>
<body>
<div style="text-align: center;width: 100%;margin-top: 50px;height: auto">
<h1>"${requestScope.lecture.name}讲座"讲座参加者名单</h1>

  <table class="am-table am-table-striped am-table-hover" style="margin-left: 20vw;width: 60vw;text-align: center">
    <thead>
    <tr>
      <th style="text-align: center">序号</th>
      <th style="text-align: center">姓名</th>
      <th style="text-align: center">年级</th>
    </tr>
    </thead>

    <tbody>

    <c:choose>
      <c:when test="${empty requestScope.participants}">
        <span style="font-size: 2em">还没有人申请参加该讲座...</span>
      </c:when>
      <c:otherwise>
        <c:forEach var="participant" items="${requestScope.participants}" varStatus="status">
          <tr>
            <td>${status.index+1}</td>
            <td>${participant.name}</td>
            <td>${participant.classes}</td>
          </tr>
        </c:forEach>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>

  <a href="exportParticipants?id=${requestScope.lecture.id}" class="button button-caution">下载名单</a>
  <button class="button button-caution" onclick="javascript:window.print();">打印名单</button>

</div>
</body>
</html>
