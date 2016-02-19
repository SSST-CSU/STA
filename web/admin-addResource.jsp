<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 20:55
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
  <title>添加新资源</title>
</head>

<body style="margin-left: 30vw;width: 40vw;margin-top: 10vh">
<div style="width: 100%;text-align: center">
  <h1>添加新资源</h1>
</div>
<form class="am-form">
  <fieldset>

    <div class="am-form-group">
      <label for="name">资源名称</label>
      <input type="text" id="name">
    </div>

    <div class="am-form-group am-form-file">
      <label for="resource">上传资源</label><br>
      <div>
        <button type="button" class="am-btn am-btn-default am-btn-sm am-btn-block">
          <i class="am-icon-cloud-upload"></i> 选择要上传的资源
        </button>
      </div>
      <input type="file" id="resource" name="resource">
    </div>

    <div class="am-form-group">
      <label for="name">文件名称</label>
      <input type="text" disabled id="resourceName">
    </div>

    <div class="am-form-group">
      <label for="name">文件大小</label>
      <input type="text" disabled id="size">
    </div>


    <div class="am-form-group">
      <label for="introduce">资源简介</label>
      <textarea class="" rows="5" name="person.introduce" id="introduce"></textarea>
    </div>

    <div style="width: 100%;text-align: center">
      <p><button type="submit" class="am-btn am-btn-primary">上传</button>
        <button type="submit" class="am-btn am-btn-secondary">重置</button></p>
    </div>
  </fieldset>
</form>

</body>

</html>
