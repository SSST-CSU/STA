<%@ page import="domain.Person" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/18
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更多信息</title>
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <style type="text/css">
        #avatar {
            width: 8vw;
            height: 8vw;
            border-radius: 4vw;
        }

        .wrongInput {
            border: 1px solid red;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<img src="img/main/STA.png" style="margin-top: 50px;width: 100%;height: auto"/>

<div style=";margin-top: 5vh;margin-left: 10vw;margin-right: 10vw">

    <%@include file="siteNavigation.jsp" %>

    <div style="width: 60vw;float: left;margin-left: 5vw;">
        <h1><span class="am-icon-paw am-icon-sm"></span>&nbsp;个人信息</h1>
        <hr style="width: 100%;border: black 2px groove">
        <form class="am-form am-form-horizontal">

            <div class="am-form-group">
                <label for="account" class="am-u-sm-2 am-form-label">用户名</label>

                <div class="am-u-sm-10">
                    <input type="text" id="account" disabled value=<s:property value="#session.person.account"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="name" class="am-u-sm-2 am-form-label">姓名</label>

                <div class="am-u-sm-10">
                    <input type="text" id="name" disabled value=<s:property value="#session.person.name"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="classes" class="am-u-sm-2 am-form-label">班级</label>

                <div class="am-u-sm-10">
                    <input type="text" id="classes" value=<s:property value="#session.person.classes"/>><span
                        class="glyphicon glyphicon-ok"></span>
                </div>
            </div>

            <div class="am-form-group">
                <label for="qq" class="am-u-sm-2 am-form-label">QQ</label>

                <div class="am-u-sm-10">
                    <input type="text" id="qq" value=<s:property value="#session.person.qq"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="tel" class="am-u-sm-2 am-form-label">电话号码</label>

                <div class="am-u-sm-10">
                    <input type="text" id="tel" value=<s:property value="#session.person.tel"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="mail" class="am-u-sm-2 am-form-label">邮件</label>

                <div class="am-u-sm-10">
                    <input type="text" id="mail" value=<s:property value="#session.person.mail"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="wechat" class="am-u-sm-2 am-form-label">微信</label>

                <div class="am-u-sm-10">
                    <input type="text" id="wechat" value=<s:property value="#session.person.wechat"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="hobby" class="am-u-sm-2 am-form-label">兴趣爱好</label>

                <div class="am-u-sm-10">
                    <input type="text" id="hobby" value=<s:property value="#session.person.hobby"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="speciality" class="am-u-sm-2 am-form-label">特长</label>

                <div class="am-u-sm-10">
                    <input type="text" id="speciality" value=<s:property value="#session.person.speciality"/>>
                </div>
            </div>


            <div class="am-form-group">
                <label for="introduce" class="am-u-sm-2 am-form-label">个人简介</label>

                <div class="am-u-sm-10">
                    <textarea rows="5" type="text" id="introduce"><s:property
                            value="#session.person.introduce"/></textarea>
                </div>
            </div>

            <p style="text-align: center;width: 100%"><input id="saveChangeBtn" type="button"
                                                             class="am-btn am-btn-primary" value="保存"></p>

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

</body>

<script type="text/javascript">
    /*保存更改信息*/
    $("#saveChangeBtn").click(function () {
        if (!checkClassesIsCorrect()) {
            $("#msgContent").html("班级信息填写不正确，请检查！");
            $("#joinMsg").modal({});
            return;
        }
        if (!checkQqIsCorrect()) {
            $("#msgContent").html("qq信息填写不正确，请检查！");
            $("#joinMsg").modal({});
            return;
        }
        if (!checkTelIsLegal()) {
            $("#msgContent").html("电话号码填写不正确，请检查！");
            $("#joinMsg").modal({});
            return;
        }
        if (!checkMailIsLegal()) {
            $("#msgContent").html("邮件信息填写不正确，请检查！");
            $("#joinMsg").modal({});
            return;
        }

        $.ajax({
            type: "POST",  //提交方式
            url: "savePersonInfo",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "person.account": $("#account").val().trim(),
                "person.classes": $("#classes").val().trim(),
                "person.qq": $("#qq").val().trim(),
                "person.tel": $("#tel").val().trim(),
                "person.mail": $("#mail").val().trim(),
                "person.wechat": $("#wechat").val().trim(),
                "person.hobby": $("#hobby").val().trim(),
                "person.speciality": $("#speciality").val().trim(),
                "person.introduce": $("#introduce").val().trim(),
                "saveItem":"personInfo"
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理

                if (result.saveStatus == "success") {
                    $("#msgContent").html("保存成功！");
                    $("#joinMsg").modal({});
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
    /*校验班级是否正确*/
    function checkClassesIsCorrect() {
        var classes = $("#classes").val().trim();
        if (classes.length > 0) {
            return true;
        }
        else {
            return false;
        }
    }
    /*校验电话号码是否正确*/
    function checkTelIsLegal() {
        var tel = $("#tel").val().trim();
        var telValidator = /^1\d{10}$/;
        if (telValidator.test(tel)) {
            return true;
        }
        else {
            return false;
        }

    }
    /*校验邮件地址是否正确*/
    function checkMailIsLegal() {
        var mail = $("#mail").val().trim();
        var mailValidator = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (mailValidator.test(mail)) {
            return true;
        }
        else {
            return false;
        }
    }
    /*校验qq是否正确*/
    function checkQqIsCorrect() {
        var qq = $("#qq").val().trim();
        var qqValidator = /^[1-9][0-9]{4,11}$/;
        if (qqValidator.test(qq)) {
            return true;
        }
        else {
            return false;
        }
    }


</script>
</html>