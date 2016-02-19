<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 15:32
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
    <title>成员职位调动</title>
</head>
<body style="margin-left: 30vw;width: 40vw;margin-top: 10vh">
<div style="width: 100%;text-align: center">
  <h1>科协成员职位调动</h1>
</div>
<form class="am-form">
  <fieldset>

    <div class="am-form-group">
      <label for="name">姓名</label>
      <input disabled type="text" id="name">
    </div>

    <div class="am-form-group">
      <label for="class">班级</label>
      <input disabled type="text" id="class">
    </div>


    <div class="am-form-group">
      <label for="department">所在部门</label>
      <select id="department">
        <option value="option1">主席团</option>
        <option value="option2">综合事务部</option>
        <option value="option3">技术交流与推广部</option>
        <option value="option4">赛事部</option>
        <option value="option5">项目部</option>
        <option value="option6">公关部</option>
        <option value="option7">创新创业管理中心</option>
        <option value="option8">研发中心</option>
      </select>
      <span class="am-form-caret"></span>
    </div>

    <div class="am-form-group">
      <label for="job">职位</label>
      <select id="job">
        <option value="option1">部长</option>
        <option value="option2">副部长</option>
        <option value="option2">干事</option>
      </select>
      <span class="am-form-caret"></span>
    </div>

    <div style="width: 100%;text-align: center">
      <p><button type="submit" class="am-btn am-btn-primary">提交</button>
        <button type="submit" class="am-btn am-btn-secondary">重置</button></p>
    </div>
  </fieldset>
</form>

</body>
</html>
