<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 14:34
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
<%@include file="header.jsp" %>
<img src="img/competition/competitionTitle.png" style="margin-top: 50px;width: 100vw;height: auto"/>

<div style="text-align: center;margin-top: 20px;margin-left: 10vw;margin-right: 10vw">
  <form class="am-form-inline" role="form">
    <div class="am-form-group">
      <input type="text" class="am-form-field button-block" placeholder="比赛关键字……" id="searchKey">
    </div>
    <a class="button button-royal button-rounded">搜索比赛</a>
  </form>
  <table class="am-table am-table-striped am-table-hover">
    <thead>
    <tr>
      <th style="width: 40%">比赛名称</th>
      <th>比赛时间</th>
      <th>查看更多</th>
    </tr>
    </thead>

    <tbody>
    <tr style="vertical-align: middle">
      <td>软件创新大赛</td>
      <td>每年4月~12月</td>
      <td><a class="button button-caution button-tiny" target="_Blank" href="competitionInfo.jsp">查看更多</a></td>
    </tr>

    <tr style="vertical-align: middle">
      <td>服务外包大赛</td>
      <td>每年4月~12月</td>
      <td><a class="button button-caution button-tiny" target="_Blank">查看更多</a></td>
    </tr>

    </tbody>
  </table>

</div>
</body>
</html>
