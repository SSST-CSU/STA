<%@ page import="domain.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <style type="text/css">
        #avatar {
            width: 8vw;
            height: 8vw;
            border-radius: 4vw;
        }
    </style>
</head>
<body>

<%@include file="header.jsp" %>
<img src="img/main/STA.png" style="margin-top: 50px;width: 100%;height: auto"/>

<div style=";margin-top: 5vh;margin-left: 10vw;margin-right: 10vw">

    <%@include file="siteNavigation.jsp" %>

    <div style="width: 60vw;float: left;margin-left: 5vw">

        <h1><span class="am-icon-suitcase am-icon-sm"></span>&nbsp;修改密码</h1>
        <hr style="width: 100%;border: black 2px groove">

        <form class="am-form am-form-horizontal">

            <div class="am-form-group">
                <label for="oldPassword" class="am-u-sm-2 am-form-label">旧密码</label>

                <div class="am-u-sm-10">
                    <input type="password" id="oldPassword" placeholder="需要确认一下您以前的密码哦">
                </div>
            </div>

            <div class="am-form-group">
                <label for="newPassword1" class="am-u-sm-2 am-form-label">新密码</label>

                <div class="am-u-sm-10">
                    <input type="password" id="newPassword1" placeholder="悄悄输入您的新密码">
                </div>
            </div>

            <div class="am-form-group">
                <label for="newPassword2" class="am-u-sm-2 am-form-label">确认下新密码</label>

                <div class="am-u-sm-10">
                    <input type="password" id="newPassword2" placeholder="再来一次">
                </div>
            </div>

            <p style="text-align: center;width: 100%"><input id="savePasswordBtn" type="button" class="am-btn am-btn-primary" value="保存"></p>
        </form>

    </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="joinMsg">
    <div class="am-modal-dialog">
        <center>
            <h3>消息提示</h3>
            <h6 id="msgContent">
            </h6>
        </center>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-confirm id="confirmBtn">确定</span>
        </div>
    </div>
</div>

<script>

    $("#savePasswordBtn").click(function(){
        checkPreviousPasswordRight();
        if(!isOldPasswordRight){
            $("#msgContent").html("旧密码不正确！");
            $("#joinMsg").modal({});
            return;
        }
        if(!checkPasswordIsLeagal()){
            $("#msgContent").html("新密码不正确！必须6位以上！");
            $("#joinMsg").modal({});
            return;
        }
        if(!checkPassword2IsCorrect()){
            $("#msgContent").html("确认密码不正确！");
            $("#joinMsg").modal({});
            return;
        }

        $.ajax({
            type: "POST",  //提交方式
            url: "savePersonInfo",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "person.password": $("#newPassword1").val().trim(),
                "saveItem":"password"
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理

                if (result.saveStatus == "success") {
                    $("#msgContent").html("保存成功！");
                    $("#joinMsg").modal({});
                    $("#oldPassword").val("");
                    $("#newPassword1").val("");
                    $("#newPassword2").val("");
                }
                else {
                    alert("保存失败！");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    });
    var isOldPasswordRight = false;
    /*判断旧密码是否正确*/
    function checkPreviousPasswordRight() {

        $.ajax({
            type: "POST",  //提交方式
            url: "isOldPasswordRight",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "person.password": $("#oldPassword").val().trim(),
                "saveItem":"password"
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理

                if (result.isOldPasswordRight == "yes") {
                    isOldPasswordRight = true;
                }
                else {
                    isOldPasswordRight = false;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

        if ($("#oldPassword").val().trim() != '${sessionScope.person.password}') {
            return false;
        }
        else return true;
    }

    /*检测新密码是否合法，最少为6位*/
    function checkPasswordIsLeagal() {
        if ($("#newPassword1").val().trim().length >= 6) {
            return true;
        }
        else {
            return false;
        }
    }
    /*检测确认密码是否正确*/
    function checkPassword2IsCorrect() {
        var password1 = $("#newPassword1").val().trim();
        var password2 = $("#newPassword2").val().trim();
        if (password1 != password2) {
            return false;
        }
        else {
            return true;
        }
    }
</script>

</body>
</html>
