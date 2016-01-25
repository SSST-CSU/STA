<%@ page import="domain.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>头像设置</title>
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <style type="text/css">
    #avatar{
      width: 8vw;
      height: 8vw;
      border-radius: 4vw;
    }
  </style>
  <script>
    var isPortraitleagel = true;
    /*选择图片*/
    function selectPortrait() {
      var docObj = document.getElementById("protrait");

      var imgObjPreview = document.getElementById("newAvatar");
      if (docObj.files && docObj.files[0]) {
        if (!isImage(docObj.value)) {
          alert("请选择正确的图片格式！");
          isPortraitleagel = false;
          return;
        }
        isPortraitleagel = true;
        //火狐下，直接设img属性
        //imgObjPreview.src = docObj.files[0].getAsDataURL();
        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
      } else {
        //IE下，使用滤镜
        isPortraitleagel = true;
        docObj.select();
        var imgSrc = document.selection.createRange().text;
        var localImagId = document.getElementById("localImag");
        //必须设置初始大小
        //localImagId.style.width = "92";
        //localImagId.style.height = "112";
        //图片异常的捕捉，防止用户修改后缀来伪造图片
        try {
          localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
          localImagId.filters
                  .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
        } catch (e) {
          isPortraitleagel = false;
          alert("您上传的图片格式不正确，请重新选择!");
          return false;
        }
        imgObjPreview.style.display = 'none';
        document.selection.empty();
      }
      return true;
    }
    /*校验图片是否正确*/
    function isImage(str) {
      var b = /\w+([.jpg|.png|.gif|.swf|.bmp|.jpeg]){1}$/;
      var t_value = str.toLowerCase();
      var a = b.test(t_value);
      return a;
    }
  </script>
</head>
<body>
<%@include file="header.jsp"%>
<img src="img/main/STA.png" style="margin-top: 50px;width: 100%;height: auto"/>

<div style=";margin-top: 5vh;margin-left: 10vw;margin-right: 10vw">
  <div style="width: 10vw;float: left">
    <div style="text-align: center">
      <img id="avatar" src="<%=request.getContextPath() +"/"+ ((Person)session.getAttribute("person")).getProtrait()%>">
      <h2 style="margin-top: 0px"><s:property value="#session.person.account"/></h2>
    </div>
    <ul class="am-nav">
      <li><a href="sitePersonInfo.jsp">个人信息&nbsp;<span class="am-icon-paw"></span></a></li>
      <li><a href="sitePassword.jsp">修改密码&nbsp;<span class="am-icon-suitcase"></span></a></li>
      <li class="am-active"><a href="siteAvatar.jsp">头像设置&nbsp;<span class="am-icon-picture-o"></span></a></li>
      <li><a href="siteGroup.jsp">组队信息&nbsp;<span class="am-icon-users"></span></a></li>
      <li><a href="siteMember.jsp">科协成员&nbsp;<span class="am-icon-send"></span></a></li>
    </ul>
  </div>

  <div style="width: 60vw;float: left;margin-left: 5vw">

    <h1><span class="am-icon-picture-o am-icon-sm"></span>&nbsp;头像设置</h1>
    <hr style="width: 100%;border: black 2px groove">

    <div class="am-form-group am-form-file">
      <label for="protrait">上传头像</label><br>

      <div>
        <button type="button" class="am-btn am-btn-default am-btn-sm am-btn-block">
          <i class="am-icon-cloud-upload"></i> 选择要上传的图片
        </button>
      </div>
      <input type="file" id="protrait" name="portrait" onchange="selectPortrait(this)">
    </div>
    <label>你的头像</label><br>

    <p style="text-align: center">
      <img id="newAvatar" src="<%=request.getContextPath() +"/"+ ((Person)session.getAttribute("person")).getProtrait()%>"
                                       style="width: 200px;height: 200px"/></p>
    <p>

    <p style="text-align: center;width: 100%"><input type="button" class="am-btn am-btn-primary" value="保存"></p>

  </div>
</div>

</body>
</html>
