<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>科协后台管理系统</title>
</head>
<link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
<script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<style type="text/css" rel="stylesheet">
    @font-face {
        font-family: title;
        src: url("font/title.TTF");
    }

    .loginArea {
        margin-left: auto;
        margin-right: auto;
        background: rgba(255, 255, 255, 0.1);
        width: 30%;
        height: auto;
        padding: 20px;
    }

    .bgImg {
        height: 100%;
        width: 100%;
        z-index: -1;
    }

    .midContent {
        position: absolute;
        top: 10%;
        text-align: center;
        width: 100%
    }
</style>

<script>

</script>

<body>

<div style="width: 100%;height: 100%">

    <img src="img/admin/mainBg.jpg" class="bgImg">

    <div class="midContent">
        <h1 style="text-align: center;font-family: title,serif;font-size: 50px;color: #aee9ff;margin-bottom: 5%">
            中南大学软件学院科协<br>后台管理系统</h1>

        <div class="loginArea">
            <form class="am-form">
                <div class="am-form-group am-form-success am-form-icon am-form-feedback">
                    <label style="color: white" class="am-form-label" for="username">用户名</label>
                    <input type="text" id="username" name="account" class="am-form-field">
                    <span class="am-icon-check"></span>
                </div>
                <div class="am-form-group am-form-success am-form-icon am-form-feedback">
                    <label style="color: white" class="am-form-label" for="password">密码</label>
                    <input type="password" id="password" name="password" class="am-form-field">
                    <span class="am-icon-check"></span>
                </div>
                <input type="button" class="am-btn am-btn-primary am-btn-block" onclick="adminLogin()" value="登录">
            </form>
        </div>
    </div>
</div>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="msg">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">消息提示
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            <span id="msgContent">
            </span>
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>
<script>

    function adminLogin() {
        $.ajax({
            type: "POST",  //提交方式
            url: "adminLogin",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "account": $("#username").val().trim(),
                "password": $("#password").val().trim()
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理
                if (result.status != "success") {
                    $("#msgContent").html("<span style='color: green'>用户名或密码错误</span>");
                    $("#msg").modal({backdrop: false});

                    $("#msgBtn").unbind('click');
                    $("#msgBtn").click(function () {
                        window.location.reload();
                    });
                }
                else{
                    window.location.href = "adminUser";
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

</script>

</body>
</html>
