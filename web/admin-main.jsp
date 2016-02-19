<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 15:12
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
  <title>科协后台管理系统</title>
  <style type="text/css" rel="stylesheet">
    @font-face {
      font-family: title;
      src: url("font/title.TTF");
    }
  </style>
</head>
<body style="margin-left: 10vw;width: 80vw;margin-top: 10vh">
<h1>科协后台管理系统</h1>
<div class="am-tabs" data-am-tabs>
  <ul class="am-tabs-nav am-nav am-nav-tabs">
    <li class="am-active"><a href="#tabMember">管理科协成员</a></li>
    <li><a href="#tabCompetition">管理比赛信息</a></li>
    <li><a href="#tabGroup">管理组队信息</a></li>
    <li><a href="#tabLecture">管理讲座信息</a></li>
    <li><a href="#tabResource">管理资源信息</a></li>
  </ul>

  <div class="am-tabs-bd">
    <div class="am-tab-panel am-fade am-in am-active" id="tabMember">

      <table class="am-table am-table-striped am-table-hover">
        <thead>
        <tr>
          <th>序号</th>
          <th>姓名</th>
          <th>班级</th>
          <th>所在部门</th>
          <th>职位</th>
          <th>操作<a class="button button-tiny button-pill button-primary" href="admin-addMember.jsp" target="_blank"
                   style="margin-left: 10%">添加新成员</a></th>
        </tr>
        </thead>

        <tbody>
        <tr style="vertical-align: middle">
          <td>1</td>
          <td>张然</td>
          <td>1304</td>
          <td>研发中心</td>
          <td>主任</td>
          <td><a class="button button-royal button-tiny" href="admin-member.jsp" target="_blank">职位调动</a>
            <a class="button button-caution button-tiny">删除</a></td>
        </tr>


        </tbody>
      </table>

    </div>



    <div class="am-tab-panel am-fade" id="tabCompetition">
      <table class="am-table am-table-striped am-table-hover">
        <thead>
        <tr>
          <th>序号</th>
          <th>比赛名称</th>
          <th>比赛时间</th>
          <th>操作<a class="button button-tiny button-pill button-primary" target="_blank" href="admin-addCompetition.jsp"
                   style="margin-left: 10%">添加新赛事</a></th>
        </tr>
        </thead>

        <tbody>
        <tr style="vertical-align: middle">
          <td>1</td>
          <td>软件创新大赛</td>
          <td>每年3月~12月</td>
          <td><a href="admin-com.jsp" class="button button-royal button-tiny" target="_blank">编辑资料</a>
            <a class="button button-caution button-tiny">删除</a></td>
        </tr>
        </tbody>
      </table>

    </div>

    <div class="am-tab-panel am-fade" id="tabGroup">
      <table class="am-table am-table-striped am-table-hover">
        <thead>
        <tr>
          <th>序号</th>
          <th>组队名称</th>
          <th>操作</th>
        </tr>
        </thead>

        <tbody>
        <tr style="vertical-align: middle">
          <td>1</td>
          <td>软创快来人</td>
          <td><a class="button button-royal button-tiny" target="_blank" href="admin-group.jsp">查看详细</a>
            <a class="button button-caution button-tiny">删除</a></td>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="am-tab-panel am-fade" id="tabLecture">
      <table class="am-table am-table-striped am-table-hover">
        <thead>
        <tr>
          <th>序号</th>
          <th>讲座名称</th>
          <th>操作<a class="button button-tiny button-pill button-primary" target="_blank"
                   href="admin-addLecture.jsp" style="margin-left: 10%">发布新讲座</a></th>
        </tr>
        </thead>

        <tbody>
        <tr style="vertical-align: middle">
          <td>1</td>
          <td>论持久战</td>
          <td><a class="button button-royal button-tiny" target="_blank" href="admin-lecture.jsp">编辑资料</a>
            <a class="button button-caution button-tiny">删除</a></td>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="am-tab-panel am-fade" id="tabResource">
      <table class="am-table am-table-striped am-table-hover">
        <thead>
        <tr>
          <th>序号</th>
          <th>资源名称</th>
          <th>资源分类</th>
          <th>资源大小</th>
          <th>操作<a class="button button-tiny button-pill button-primary" target="_blank"
                   style="margin-left: 10%" href="admin-addResource.jsp">上传新资源</a></th>
        </tr>
        </thead>

        <tbody>
        <tr style="vertical-align: middle">
          <td>1</td>
          <td>IntelliJ</td>
          <td>IDEA</td>
          <td>500MB</td>
          <td><a class="button button-royal button-tiny" target="_blank" href="admin-resource.jsp">编辑资料</a>
            <a class="button button-caution button-tiny">删除</a></td>
        </tr>
        </tbody>
      </table>
    </div>

  </div>
</div>

</body>
</html>
