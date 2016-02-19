<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 20:48
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
  <title>添加新讲座</title>
</head>
<body style="margin-left: 30vw;width: 40vw;margin-top: 10vh">
<div style="width: 100%;text-align: center">
  <h1>添加新讲座</h1>
</div>
<form class="am-form">
  <fieldset>

    <div class="am-form-group">
      <label for="name">讲座名称</label>
      <input type="text" id="name">
    </div>

    <div class="am-form-group">
      <label for="time">讲座时间</label>
      <input type="text" id="time">
    </div>

    <div class="am-form-group">
      <label for="link">讲座链接</label>
      <input type="text" id="link">
    </div>


    <div class="am-form-group">
      <label for="introduce">讲座简介</label>
      <textarea class="" rows="5" name="person.introduce" id="introduce"></textarea>
    </div>

    <div class="am-checkbox">
      <label>
        <input type="checkbox">允许自由报名
      </label>
    </div>

    <div style="width: 100%;text-align: center">
      <p><button type="submit" class="am-btn am-btn-primary">提交</button>
        <button type="submit" class="am-btn am-btn-secondary">重置</button></p>
    </div>
  </fieldset>
</form>

</body>
</html>
