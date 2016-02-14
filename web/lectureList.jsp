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
<img src="img/lecture/lectureTitle.png" style="margin-top: 50px;width: 100vw;height: auto"/>

<div style="text-align: center;margin-top: 20px;margin-left: 10vw;margin-right: 10vw">
  <form class="am-form-inline" role="form">
    <div class="am-form-group">
      <input type="text" class="am-form-field button-block" placeholder="讲座关键字……" id="searchKey">
    </div>
    <a class="button button-royal button-rounded">搜索讲座</a>
  </form>
  <table class="am-table am-table-striped am-table-hover">
    <thead>
    <tr>
      <th style="width: 40%">讲座名称</th>
      <th>时间</th>
      <th>介绍</th>
      <th>操作</th>
    </tr>
    </thead>

    <tbody>
        <tr style="vertical-align: middle">
          <td>这里是讲座名称</td>
          <td>这里是时间</td>
          <td><span
                  data-am-popover="{theme: 'success sm', content: '这里是介绍内容', trigger: 'hover focus'}">
                                        查看介绍
                                    </span></td>
          <td><a name="join" class="button button-caution button-tiny">申请加入</a><a href="lectureInfo.jsp" class="button button-royal button-tiny" target="_Blank">查看参加者名单</a></td>
        </tr>

        <tr style="vertical-align: middle">
          <td>这里是讲座名称2</td>
          <td>这里是时间2</td>
          <td><span
                  data-am-popover="{theme: 'success sm', content: '这里是介绍内容2', trigger: 'hover focus'}">
                                        查看介绍
                                    </span></td>
          <td><a class="button button-caution button-tiny disabled">不可申请</a><a href="lectureInfo.jsp" class="button button-royal button-tiny" target="_Blank">查看参加者名单</a></td>
        </tr>

        <td>这里是讲座名称3</td>
        <td>这里是时间3</td>
        <td><span
                data-am-popover="{theme: 'success sm', content: '这里是介绍内容3', trigger: 'hover focus'}">
                                        查看介绍
                                    </span></td>
        <td><a name="join" class="button button-caution button-tiny">申请加入</a><a href="lectureInfo.jsp" class="button button-royal button-tiny" target="_Blank">查看参加者名单</a></td>
        </tr>

    </tbody>
  </table>

</div>
</body>
<script>

  $(document).ready(function(){
    $("[name=join]").click(function(){
      if($(this).text()=='申请加入'){

        //在此处加入申请加入讲座的后台代码

        $(this).removeClass('button-caution');
        $(this).addClass('button-action');
        $(this).text('取消申请');
      }
      else{

        //在此处加入取消申请加入讲座的后台代码

        $(this).removeClass('button-action');
        $(this).addClass('button-caution');
        $(this).text('申请加入');
      }
    })

  })


</script>
</html>
