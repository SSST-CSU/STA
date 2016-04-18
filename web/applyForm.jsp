<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/18
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <style type="text/css" rel="stylesheet">

    </style>
    <title>加入我们</title>
    <script>

        var isPortraitleagel = true;
        /*选择图片*/
        function selectPortrait() {
            var docObj = document.getElementById("protrait");

            var imgObjPreview = document.getElementById("avatar");
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
<%@include file="header.jsp" %>
<div>
    <div style="width: 50%;height: auto;margin-right: auto;margin-left: auto">
        <form id="registerForm" class="am-form" enctype="multipart/form-data" method="post">
            <fieldset>
                <legend>个人信息(<span style="color: red">*</span>为必填)</legend>

                <div class="am-form-group">
                    <label for="name">姓名<span style="color: red">*</span>
                        <small id="usernameIsExist"></small>
                    </label><span id="usernameValidate" name="validate" class="am-icon-warning"></span>
                    <input type="text" class="" id="name" name="person.account" placeholder="必填!"
                            >
                </div>

                <div class="am-form-group">
                    <label>性别<span style="color: red">*</span>
                        <small id="passwordIsLegal"></small>
                    </label><span id="password1Validate"
                                  name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="sex" id="sex" placeholder="必填，只能填男或者女！"
                            >
                </div>

                <div class="am-form-group">
                    <label>政治面貌<span style="color: red">*</span>
                        <small id="password2IsLegal"></small>
                    </label>
                    <input type="text" class="" id="political" placeholder=""
                            >
                </div>

                <div class="am-form-group">
                    <label for="name">籍贯<span style="color: red">*</span>
                        <small id="nameValidator"></small>
                    </label><span id="nameValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.name" id="place" placeholder="必填"
                            >
                </div>
                <div class="am-form-group">
                    <label for="classes">班级<span style="color: red">*</span>
                        <small id="classesValidator"></small>
                    </label><span id="classesValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.classes" id="classes" placeholder="必填"
                            >
                </div>

                <div class="am-form-group">
                    <label for="tel">学号<span style="color: red">*</span>
                        <small id="telValidator"></small>
                    </label><span id="telValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.tel" id="studentId" placeholder="必填"
                            >
                </div>

                <div class="am-form-group">
                    <label>QQ<span style="color: red">*</span>
                        <small id="mailValidator"></small>
                    </label><span id="mailValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="email" class="" name="person.mail" id="qq" placeholder="必填"
                            >
                </div>

                <div class="am-form-group">

                    <label for="qq">联系方式<span style="color: red">*</span>
                        <small id="qqValidator"></small>
                    </label><span id="qqValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.qq" id="tel" placeholder="必填"
                            >
                </div>

                <div class="am-form-group">
                    <label>曾任职务</label>
                    <small id="wechatValidator"></small>
                    <input type="text" class="" name="person.wechat" id="oldJob" placeholder="">
                </div>

                <div class="am-form-group">
                    <label>是否服从调剂</label>
                    <span name="validate"
                          class="am-icon-warning"></span>
                    <input type="text" class="" name="person.hobby" id="swap" placeholder="必填,只能填是或否！">
                </div>

                <div class="am-form-group">
                    <label>拟报职位第一志愿</label>
                    <span name="validate"
                          class="am-icon-warning"></span>
                    <input type="text" class="" name="person.speciality" id="first" placeholder="必填，填写部门名称">
                </div>

                <div class="am-form-group">
                    <label>第二志愿</label>
                    <input type="text" class="" rows="5" name="person.introduce" id="second"/>
                </div>
                <div class="am-form-group">
                    <label>本人获奖情况及特长、技能</label>
                    <textarea class="" rows="5" name="person.introduce" id="award"></textarea>
                </div>
                <div class="am-form-group">
                    <label>学生干部工作的突出业绩</label>
                    <textarea class="" rows="5" name="person.introduce" id="achievement"></textarea>
                </div>
                <div class="am-form-group">
                    <label>对学院发展及对学生工作的建议</label>
                    <textarea class="" rows="5" name="person.introduce" id="advice"></textarea>
                </div>
                <div class="am-form-group">
                    <label>备注</label>
                    <textarea class="" rows="5" name="person.introduce" id="attach"></textarea>
                </div>

                <div class="am-form-group am-form-file">
                    <label for="protrait">上传头像（必须上传头像！）</label><br>

                    <div>
                        <button type="button" class="am-btn am-btn-default am-btn-sm am-btn-block">
                            <i class="am-icon-cloud-upload"></i> 选择要上传的图片
                        </button>
                    </div>
                    <input type="file" id="protrait" name="portrait" onchange="selectPortrait(this)">
                </div>
                <label>你的头像</label><br>

                <p style="text-align: center"><img id="avatar" src="img/avatar/avatar.png"
                                                   style="width: 200px;height: 200px;"/></p>

                <p style="text-align: center">
                    <input type="button" class="am-btn am-btn-default" id="confirmbtn" value="提交">
                </p>
            </fieldset>
        </form>
    </div>
</div>

</body>
<script>

    $("#confirmbtn").click(function () {

        var name = $("#name").val().trim();
        var sex = $("#sex").val().trim();
        var political = $("#political").val().trim();
        var place = $("#place").val().trim();
        var classes = $("#classes").val().trim();
        var studentId = $("#studentId").val().trim();
        var qq = $("#qq").val().trim();
        var tel = $("#tel").val().trim();
        var oldJob = $("#oldJob").val().trim();
        var swap = $("#swap").val().trim();
        var first = $("#first").val().trim();
        var second = $("#second").val().trim();
        var award = $("#award").val().trim();
        var achievement = $("#achievement").val().trim();
        var advice = $("#advice").val().trim();
        var attach = $("#attach").val().trim();

        var personId = ${sessionScope.person.id};
        if(personId ==null || personId ==""){
            alert("personId is null");
            return;
        }

//        alert(name + sex + political + place + classes + studentId + qq + tel + oldJob + swap + first + second + award + achievement + advice + attach + personId);

        var url = "applyToJoinSTA";
        url += "?applyForm.name=" + name;
        url += "&applyForm.sex=" + sex;
        url += "&applyForm.political=" + political;
        url += "&applyForm.place=" + place;
        url += "&applyForm.classes=" + classes;
        url += "&applyForm.studentId=" + studentId;
        url += "&applyForm.qq=" + qq;
        url += "&applyForm.tel=" + tel;
        url += "&applyForm.oldJob=" + oldJob;
        url += "&applyForm.swap=" + swap;
        url += "&applyForm.first=" + first;
        url += "&applyForm.second=" + second;
        url += "&applyForm.award=" + award;
        url += "&applyForm.achievement=" + achievement;
        url += "&applyForm.advice=" + advice;
        url += "&applyForm.attach=" + attach;
        url += "&applyForm.personId=" + personId;

        $.ajaxFileUpload({
            url: url,
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'protrait', // 上传文件的id、name属性名
            dataType: 'json', //返回值类型，一般设置为json、application/json
            data: {//传递参数到服务器
                "saveItem": "avatar"
            },
            success: function (data, status) {
                if (data.status == "success") {
                    alert("保存成功！");
                }
                else("保存失败！");
            },
            error: function (data, status, e) {
                alert(e);
            }
        });
    });

</script>
</html>
