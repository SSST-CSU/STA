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
    #page {
      border-top: medium none;
      border-left: medium none;
      border-right: medium none;
      width: 10vh;
      text-align: center;
      line-height: 5vh;
    }
  </style>
</head>
<body>
<%@include file="header.jsp" %>
<img src="img/competition/competitionTitle.png" style="margin-top: 50px;width: 100vw;height: auto"/>

<div style="text-align: center;margin-top: 20px;margin-left: 10vw;margin-right: 10vw">
  <form class="am-form-inline" role="form">
    <div class="am-form-group">
      <input type="text" class="am-form-field button-block" placeholder="比赛关键字……" id="searchKey" value="${sessionScope.key}">
    </div>
    <a class="button button-royal button-rounded" id="searchBtn">搜索比赛</a>
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
    <c:choose>
      <c:when test="${empty sessionScope.competitions}">
        <tr style="vertical-align: middle">
          <td>对不起，这里没有您想要的结果！</td>
        </tr>
      </c:when>
      <c:when test="${!empty sessionScope.competitions}">
        <c:forEach var="competition" items="${sessionScope.competitions}" varStatus="status">
          <tr style="vertical-align: middle">
            <td>${competition.name}</td>
            <td>${competition.time}</td>
            <td><a class="button button-caution button-tiny" target="_Blank" onclick="competitionDetail('${competition.introduce}','${competition.time}','${competition.link}')">查看更多</a></td>
          </tr>
        </c:forEach>
      </c:when>
    </c:choose>
    </tbody>
  </table>
  <ul class="am-pagination am-pagination-centered">
    <li><a href="javascript:previousPage()">&laquo;</a></li>

    <c:forEach begin="${sessionScope.startAndEnd.start}" end="${sessionScope.startAndEnd.end}" varStatus="status">
    <li
    <c:if test="${status.index==sessionScope.targetPage}">
            class="am-active"
    </c:if>
            ><a href="viewCompetition?targetPage=${status.index}&key=${sessionScope.key}">${status.index}
      </c:forEach>
      <li><a href="javascript:nextPage()">&raquo;</a></li>
      <li>共${sessionScope.pageNumber}页，跳转到<input id="page" type="text"
                                                 value="${sessionScope.targetPage}">页
        <button id="selectPageBtn" class="button button-tiny button-pill button-primary button-caution"
                style="margin-left: 1vh">确定
        </button>
      </li>
  </ul>
</div>
<%--消息提示模态对话框--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="msg">
  <div class="am-modal-dialog">
    <center>
      <h3>消息提示</h3>
      <h6 id="msgContent">
      </h6>
    </center>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>
<%--比赛详细信息模态对话框--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="msg2">
  <div class="am-modal-dialog">
    <center>
      <h3>比赛详细信息</h3>
      <h6 id="competition-info">1</h6>
      <h6 id="competition-time">2</h6>
      <a id="competition-link">点击查看比赛详细信息情况网页</a>
    </center>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>
<script>
  function previousPage() {
    if (${sessionScope.targetPage<=1}) {
      window.location.href = "viewCompetition?targetPage=1&key=${sessionScope.key}";
    }
    else {
      window.location.href = "viewCompetition?targetPage=${sessionScope.targetPage-1}&key=${sessionScope.key}";
    }
  }
  function nextPage() {
    if (${sessionScope.targetPage>=sessionScope.pageNumber}) {
      window.location.href = "viewCompetition?targetPage=${sessionScope.pageNumber}&key=${sessionScope.key}";
    }
    else {
      window.location.href = "viewCompetition?targetPage=${sessionScope.targetPage+1}&key=${sessionScope.key}";
    }
  }

  $("#searchBtn").click(function () {
    var url = "viewCompetition?targetPage=1";
    if ($("#searchKey").val().trim() == "") {
      window.location.href = url;
    }
    else {
      window.location.href = url + "&key=" + $("#searchKey").val().trim();
    }
  });

  $("#selectPageBtn").click(function () {
    var targetPage = $("#page").val().trim();
    var pageNumber = ${sessionScope.pageNumber};
    if (targetPage <= pageNumber && targetPage > 0) {
      var url = "viewCompetition?targetPage=" + targetPage;
      if (${sessionScope.key!=null}) {
        url += "&key=${sessionScope.key}";
      }
      window.location.href = url;
    }
    else {
      $("#msgContent").html("输入不合法！");
      $("#msg").modal({});
    }
  });

  function competitionDetail(introduce,time,link){

    $("#competition-info").html(introduce);
    $("#competition-time").html(time);
    $("#competition-link").unbind('click');
    $("#competition-link").click(function () {
      window.location.href = link;
    });
    $("#msg2").modal();
  }

</script>

</body>
</html>
