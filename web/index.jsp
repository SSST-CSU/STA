<!DOCTYPE html>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2015/10/15
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/app.css">
    <link rel="stylesheet" href="css/button.css">
    <title>软院科协-从这里，改变世界</title>
    <style type="text/css" rel="stylesheet">
      @font-face {
        font-family: title;
        src: url("font/title.TTF");
      }

      .title{
        font-family: title;
        color: white;
      }

      .midContent{
        position: absolute;
        top: 35vh;
        text-align: center;
        width: 100%
      }

      .bgImg{
        height: 100vh;
        width: 100%;
        z-index: -1;
      }

      .halfWindow{
        height: 100%;
        width: 50%;
        float: left;
      }

      .funcDes{
        text-align: center;
        font-family: title;
        font-size: 50px;
        margin: 0;
      }

      .activityImg{
        width: 200px;
        height: 200px;
        cursor: pointer;
        transition:width 1s, height 1s;
        -moz-transition:width 1s, height 1s;
        -webkit-transition:width 1s, height 1s;
        -o-transition:width 1s, height 1s;
      }

      .activityImg:hover{
        width:250px;
        height:250px;
      }

      .competitionDiv{
        width: 80%;
        height:15vh;
        font-size: 7vh;
        padding-left: 10%;
        line-height: 15vh;
        cursor: pointer;
        font-family: title;
      }

    </style>
  </head>

  <body>

  <%@include file="header.jsp"%>


  <div style="height: auto;width: 100%">
    <img src="img/main/mainBg.png" class="bgImg" id="bg"/>
    <div class="midContent">
      <h1 class="title" style="font-size: 50px;margin-top: 0px;margin-bottom: 0px" data-am-scrollspy="{animation:'scale-down'}">中南大学软件学院<br>科学技术协会</h1>
      <p><b class="title" style="font-size: 20px;color: #efefef" data-am-scrollspy="{animation:'scale-down',delay: 300}">为了正在进步的你</b></p>
      <a class="button button-primary button-pill" style="margin-right: 5%;font-family: title;" data-am-scrollspy="{animation:'scale-down',delay: 600}">了解我们</a>
      <a class="button button-pill button-border" style="font-family: title;color: white" id="joinUs" data-am-scrollspy="{animation:'scale-down',delay: 900}">加入我们</a>
    </div>

    <div style="width: 100%;height: 100vh;background: black">
      <div class="halfWindow">
        <h1 class="funcDes" style="margin-top: 35%;color: white" data-am-scrollspy="{animation:'scale-down'}">在这里你可以</h1>
        <h1 class="funcDes" style="color: white" data-am-scrollspy="{animation:'scale-down',delay: 300}">拓宽你的人脉，找到<span style="font-size: 60px">大牛</span></h1>
        <h1 style="text-align: center"><a href="groupList.jsp" class="button button-3d" style="font-family: title;" data-am-scrollspy="{animation:'scale-down',delay: 400}">去寻找</a></h1>
      </div>
      <div class="halfWindow" style="cursor: pointer">
        <div id="particles-js" style="width: 100%;height: 100vh">
        </div>
        <script src="plugin/particles/js/particles.js"></script>
        <script src="plugin/particles/js/app.js"></script>
      </div>
    </div>

    <div style="width: 100%;height: 100vh">
      <div class="halfWindow">
        <div style="margin-top: 20%;text-align: center">
          <img src="img/main/activity1.png" class="activityImg" data-am-popover="{content: '获奖信息', trigger: 'hover focus',theme: 'secondary'}" data-am-scrollspy="{animation:'slide-left',delay: 400}">
          <img src="img/main/activity2.png" class="activityImg" data-am-popover="{content: '最新讲座', trigger: 'hover focus',theme: 'primary'}"  data-am-scrollspy="{animation:'slide-top',delay: 500}">
          <img src="img/main/activity3.png" class="activityImg" data-am-popover="{content: '大牛招人', trigger: 'hover focus'}"  data-am-scrollspy="{animation:'slide-right',delay: 600}">
          <img src="img/main/activity4.png" class="activityImg" data-am-popover="{content: '其他活动', trigger: 'hover focus',theme: 'warning'}"  data-am-scrollspy="{animation:'slide-bottom',delay:700}">
        </div>
      </div>
      <div class="halfWindow">
        <h1 class="funcDes" style="margin-top: 35%" data-am-scrollspy="{animation:'scale-down'}">在这里你可以</h1>
        <h1 class="funcDes" data-am-scrollspy="{animation:'scale-down',delay: 300}"><span style="font-size: 60px">第一时间</span>了解院内动态</h1>
      </div>
    </div>

    <div style="width: 100%;height: 100vh;background: #3bb4f2;color: white">
      <div class="halfWindow">
        <h1 class="funcDes" style="margin-top: 35%" data-am-scrollspy="{animation:'scale-down'}">在这里你可以</h1>
        <h1 class="funcDes" data-am-scrollspy="{animation:'scale-down',delay: 300}"><span style="font-size: 60px">详细了解</span>所有软件竞赛信息</h1>
      </div>
      <div class="halfWindow">
        <div style="margin-top: 13vh;background: #07a62c" class="competitionDiv" data-am-scrollspy="{animation:'slide-left',delay: 400}">软件创新大赛</div>
        <div style="margin-left: 5%;margin-top:5vh;background: #ffa631" class="competitionDiv" data-am-scrollspy="{animation:'slide-right',delay: 500}">服务外包比赛</div>
        <div style="margin-left: 10%;margin-top:5vh;background: #dd0bff" class="competitionDiv" data-am-scrollspy="{animation:'slide-left',delay: 600}">花旗杯金融大赛</div>
        <div style="margin-left: 15%;margin-top:5vh;background: #000000" class="competitionDiv" data-am-scrollspy="{animation:'slide-right',delay: 700}">更多...</div>
      </div>
    </div>

    <div style="width: 100%;height: auto;background:  #d3d3d3;color: #000000">
      <div style="padding-top: 20vh;padding-bottom: 20vh">
        <h1 class="funcDes">从这里开始</h1>
        <h1 class="funcDes" style="font-size: 60px">提升自己，改变世界</h1>
        <p style="width: 60%;margin-left: auto;margin-right: auto;margin-bottom: 0px;font-family: title;font-size: 20px">
          中南大学软件学院大学生科学技术协会（以下简称“科协”）成立于2010年，是我院大学生自主创新的领导机构，是软件学院三大学生机构之一，以“自我管理、自我教育、自我创新”为协会的管理理念，从实际出发，激发大学生自主学习、自主创新是科协的宗旨，以发展与传承科协的文化为任务，实现我院科协繁荣昌盛。
          <span class="am-icon-graduation-cap" data-am-scrollspy="{animation:'scale-up'}"></span>
        </p>
      </div>
    </div>

  </div>

  <%@include file="footer.jsp"%>

  </body>

<script type="text/javascript">

  $("#joinUs").on("mouseenter",function(){
    $("#joinUs").css("color","#00a8e6")
  })
  $("#joinUs").on("mouseleave",function(){
    $("#joinUs").css("color","white")
  })

</script>

</html>
