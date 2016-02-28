<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/11
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>500</title>
  <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
  <link rel="stylesheet" href="css/button.css">
  <link rel="stylesheet" href="css/animate.css">
  <style type="text/css" rel="stylesheet">
    @font-face {
      font-family: title;
      src: url("font/title.TTF");
    }
  </style>
</head>
<body style="font-family: title;color: white;font-size: 20px;margin: 0px">
<img style="width: 100%;height: 100%;position: absolute;z-index: -1" src="img/error/bg.jpg"/>
<div style="position: absolute;text-align: center;width: 100%;top: 20vh">
  <img src="img/error/500.png" style="width: 20vw;height: auto">
  <br>
  <p style="margin-top: 5vh">哎呦，页面找不到了呢！好像是服务器出问题了呢~</p>
  <p>你可以去<a href="index.jsp" style="color: #cbd0de;text-decoration:none;font-size: 30px" >主页</a>或者点击下面的按钮</p>
  <button id="none" style="font-family: title" class="button button-3d">没什么用的按钮</button>
</div>
<img src="img/error/moe.png" id="moe" style="cursor:pointer;position: absolute;bottom: 5vh;right: 10vw;height: 50vh;width: auto;display: none"/>
</body>
<script>
  var count = 0;
  $("#none").click(function(){
    count++;
    if(count == 5){
      $("#moe").show().addClass('animated fadeInLeft');
    }
    if(count == 10){
      $("#moe").css('height','70vh');
      $("#moe").css('width','auto');
    }
    if(count == 15){
      $("#moe").css('height','90vh');
      $("#moe").css('width','auto');
    }
  })

  $("#moe").on("mouseenter",function(event){
    $('#moe').removeClass('fadeInLeft');
    $("#moe").addClass('animated jello');
    setTimeout(function(){
      $('#moe').removeClass('jello');
    }, 1000);
  })
</script>
</html>
