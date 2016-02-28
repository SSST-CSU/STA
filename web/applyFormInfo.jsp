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
                    <input type="text" class="" id="name" name="person.account" placeholder="必填!" disabled="disabled"
                           value="${sessionScope.applyForm.name}">
                </div>

                <div class="am-form-group">
                    <label>性别<span style="color: red">*</span>
                        <small id="passwordIsLegal"></small>
                    </label><span id="password1Validate"
                                  name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="sex" id="sex" placeholder="必填，只能填男或者女！" disabled="disabled"
                           value="${sessionScope.applyForm.sex}"
                            >
                </div>

                <div class="am-form-group">
                    <label>政治面貌<span style="color: red">*</span>
                        <small id="password2IsLegal"></small>
                    </label>
                    <input type="text" class="" id="political" placeholder="" disabled="disabled"
                           value="${sessionScope.applyForm.political}"
                            >
                </div>

                <div class="am-form-group">
                    <label for="name">籍贯<span style="color: red">*</span>
                        <small id="nameValidator"></small>
                    </label><span id="nameValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.name" id="place" placeholder="必填" disabled="disabled"
                           value="${sessionScope.applyForm.place}"
                            >
                </div>
                <div class="am-form-group">
                    <label for="classes">班级<span style="color: red">*</span>
                        <small id="classesValidator"></small>
                    </label><span id="classesValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.classes" id="classes" placeholder="必填" disabled="disabled"
                           value="${sessionScope.applyForm.classes}"
                            >
                </div>

                <div class="am-form-group">
                    <label for="tel">学号<span style="color: red">*</span>
                        <small id="telValidator"></small>
                    </label><span id="telValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.tel" id="studentId" placeholder="必填" disabled="disabled"
                           value="${sessionScope.applyForm.studentId}"
                            >
                </div>

                <div class="am-form-group">
                    <label>QQ<span style="color: red">*</span>
                        <small id="mailValidator"></small>
                    </label><span id="mailValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="email" class="" name="person.mail" id="qq" placeholder="必填" disabled="disabled"
                           value="${sessionScope.applyForm.qq}"
                            >
                </div>

                <div class="am-form-group">

                    <label for="qq">联系方式<span style="color: red">*</span>
                        <small id="qqValidator"></small>
                    </label><span id="qqValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.qq" id="tel" placeholder="必填" disabled="disabled"
                           value="${sessionScope.applyForm.tel}"
                            >
                </div>

                <div class="am-form-group">
                    <label>曾任职务</label>
                    <small id="wechatValidator"></small>
                    <input type="text" class="" name="person.wechat" id="oldJob" placeholder="" disabled="disabled"
                           value="${sessionScope.applyForm.oldJob}">
                </div>

                <div class="am-form-group">
                    <label>是否服从调剂</label>
                    <span name="validate"
                          class="am-icon-warning"></span>
                    <input type="text" class="" name="person.hobby" id="swap" placeholder="必填,只能填是或否！"
                           disabled="disabled" value="${sessionScope.applyForm.swap}">
                </div>

                <div class="am-form-group">
                    <label>拟报职位第一志愿</label>
                    <span name="validate"
                          class="am-icon-warning"></span>
                    <input type="text" class="" name="person.speciality" id="first" placeholder="必填，填写部门名称"
                           disabled="disabled" value="${sessionScope.applyForm.first}">
                </div>

                <div class="am-form-group">
                    <label>第二志愿</label>
                    <input type="text" class="" rows="5" name="person.introduce" id="second" disabled="disabled"
                           value="${sessionScope.applyForm.second}"/>
                </div>
                <div class="am-form-group">
                    <label>本人获奖情况及特长、技能</label>
                    <textarea class="" rows="5" name="person.introduce" id="award" disabled="disabled"
                              >${sessionScope.applyForm.award}</textarea>
                </div>
                <div class="am-form-group">
                    <label>学生干部工作的突出业绩</label>
                    <textarea class="" rows="5" name="person.introduce" id="achievement" disabled="disabled"
                              >${sessionScope.applyForm.achievement}</textarea>
                </div>
                <div class="am-form-group">
                    <label>对学院发展及对学生工作的建议</label>
                    <textarea class="" rows="5" name="person.introduce" id="advice" disabled="disabled"
                              >${sessionScope.applyForm.advice}</textarea>
                </div>
                <div class="am-form-group">
                    <label>备注</label>
                    <textarea class="" rows="5" name="person.introduce" id="attach" disabled="disabled"
                              >${sessionScope.applyForm.attach}</textarea>
                </div>

                <div class="am-form-group am-form-file">
                    <label>头像</label><br>

                    <p style="text-align: center"><img id="avatar" src="${sessionScope.path}${sessionScope.applyForm.portrait}"
                                                       style="width: 200px;height: 200px;"/></p>

                    <p style="text-align: center">
                        <input type="button" class="am-btn am-btn-default" id="confirmbtn" value="点击下载电子版申请表">
                    </p>
                    <p style="text-align: center">
                        头像请右击上方图片进行保存，然后自行粘贴到word文档中
                    </p>
                </div>
            </fieldset>
        </form>
    </div>
</div>

</body>
<script>
    $("#confirmbtn").click(function(){
        window.location.href = "exportApplyForm?id=${sessionScope.applyForm.id}";
    });

</script>
</html>
