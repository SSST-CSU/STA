<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 20:49
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
  <title>组队详细资料</title>
</head>
<body style="margin-left: 30vw;width: 40vw;margin-top: 10vh">
<div style="width: 100%;text-align: center">
  <h1>组队详细资料</h1>
</div>
<form class="am-form">
  <fieldset>

    <div class="am-form-group">
      <label for="name">组队名称</label>
      <input disabled type="text" id="name">
    </div>

    <div class="am-form-group">
      <label for="teamSize">组队人数</label>
      <input disabled type="text" id="teamSize">
    </div>

    <div class="am-form-group">
      <label for="currentSize">现有人数</label>
      <input disabled type="text" id="currentSize">
    </div>

    <div class="am-form-group">
      <label for="publishTime">发布时间</label>
      <input disabled type="text" id="publishTime">
    </div>

    <div class="am-form-group">
      <label for="introduce">队伍简介</label>
      <textarea disabled class="" rows="5" name="person.introduce" id="introduce"></textarea>
    </div>

    <div style="width: 100%;text-align: center">
      <p><button type="submit" class="am-btn am-btn-primary">删除这条信息</button></p>
    </div>
  </fieldset>
</form>

</body>
</html>
