<%@ page import="java.util.List" %>
<%@ page import="domain.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-xs-12 col-sm-10 col-md-10 clean">
    <div class="row clean">
        <div class="col-xs-12 col-sm-2 col-md-2 clean"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
            <a href="javascript:history.back(-1)" style="text-decoration: none;font-family: 'Microsoft YaHei'">返回上一页</a>
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 clean text-center"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
            <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;科协管理
        </div>
        <div class="col-xs-12 col-sm-2 col-md-2 clean text-center"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
        </div>
    </div>
    <div class="row clean">
        <a href="adminStaDepartment?targetDepartment=主席团"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">主席团</div></a>
        <a href="adminStaDepartment?targetDepartment=综合事务部"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">综合事务部</div></a>
        <a href="adminStaDepartment?targetDepartment=技术交流与推广部"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">技术交流与推广部</div></a>
        <a href="adminStaDepartment?targetDepartment=赛事部"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">赛事部</div></a>
        <a href="adminStaDepartment?targetDepartment=项目部"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">项目部</div></a>
        <a href="adminStaDepartment?targetDepartment=公共关系部"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">公共关系部</div></a>
        <a href="adminStaDepartment?targetDepartment=创新创业项目管理中心"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">创新创业项目管理中心</div></a>
        <a href="adminStaDepartment?targetDepartment=研发中心"><div class="col-xs-12 col-sm-1 col-md-1 clean text-center sta-navigation-item">研发中心</div></a>
        <div class="col-xs-12 col-sm-4 col-md-4 clean text-center sta-navigation-item"></div></a>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean"
             style="font-size: 2rem;height: 8vh;line-height: 8vh;padding-left: 2vh">
            <strong>${requestScope.department.name}</strong>
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-6 col-sm-6 col-md-6 clean" style="padding-left: 4vh">
            <div class="input-group" style="width: 100%; margin-bottom: 5vh">
                <input id="dIntroduce" type="text" class="form-control" placeholder="头像文件临时路径"
                       aria-describedby="basic-addon2" value="${requestScope.department.introduce}">
                                <span class="input-group-addon btn btn-default"
                                      onclick="modifyDepartmentTitle('${requestScope.department.id}','#dIntroduce','introduce')">修改部门简介</span>
            </div>
            <div class="input-group" style="width: 100%; margin-bottom: 5vh">
                <input id="dDestination" type="text" class="form-control" placeholder="头像文件临时路径"
                       aria-describedby="basic-addon2" value="${requestScope.department.destination}">
                                <span class="input-group-addon btn btn-default"
                                      onclick="modifyDepartmentTitle('${requestScope.department.id}','#dDestination','destination')">修改部门目标</span>
            </div>
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean"
             style="font-size: 1.5rem;height: 8vh;line-height: 8vh;padding-left: 2vh"><strong>部门成员</strong>
        </div>
    </div>
    <div class="row clean" style="padding: 1vw">

        <c:choose>
            <c:when test="${empty requestScope.members}">
                <tr>
                    <th colspan="6">还没有部员加入！</th>
                </tr>
            </c:when>
            <c:when test="${!empty requestScope.members}">
                <c:forEach var="member" items="${requestScope.members}" varStatus="status">
                    <div class="col-xs-12 col-sm-2 col-md-2 clean text-center" style="margin: 1vw">
                        <div style="width: 10vw;height: 15vw;background-color: #ddd">
                            <div>
                                <img src="${requestScope.path}${member.protrait}"
                                     style="width: 10vw;height: 10vw;border: solid 1px #ddd">
                            </div>
                            <div style="height: 5vw; padding-top: 1px">
                                <div style="height: 2vw">${member.job}：${member.name}</div>
                                <div style="height: 3vw;line-height: 3vw;padding: 5px">
                                    <button class="btn btn-default btn-xs" style="width:100%;"
                                            onclick="deleteMember('${member.id}','${member.name}')">删除
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>

        <div class="col-xs-12 col-sm-2 col-md-2 clean text-center" style="margin: 1vw">
            <div style="width: 10vw;height: 15vw;background-color: #ddd" onclick="newMenber()">
                <div style="background-color: #fff;">
                    <img src="img/admin/add.png" style="width: 10vw;height: 10vw;border: solid 1px #ddd;padding: 5px">
                </div>
                <div style="height: 5vw; padding-top: 1px">
                    <div style="height: 5vw;line-height: 5vw">
                        <span>添加新成员</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean"
             style="font-size: 1.5rem;height: 8vh;line-height: 8vh;padding-left: 2vh"><strong>部门职责</strong>
        </div>
    </div>
    <div class="row clean" style="padding: 10px">
        <div class="col-xs-12 col-sm-12 col-md-12 clean" style="font-size: 1.5rem;padding-left: 2vh">

            <c:choose>
                <c:when test="${empty requestScope.attaches}">
                    <tr>
                        <th colspan="6">还没有添加部门职责！</th>
                    </tr>
                </c:when>
                <c:when test="${!empty requestScope.attaches}">
                    <c:forEach var="attach" items="${requestScope.attaches}" varStatus="status">
                        <c:if test="${attach.type == 'responsibility'}">
                            <div><span class="glyphicon glyphicon-minus"
                                       aria-hidden="true"
                                       onclick="deleteAttach('${attach.id}','${attach.content}')"></span>&nbsp;${attach.content}
                            </div>
                        </c:if>
                    </c:forEach>
                </c:when>
            </c:choose>
            <div>
                <button class="btn btn-default" style="width: 30vw"
                        onclick="newResponsibility('${requestScope.department.name}')">添加
                </button>
            </div>
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean"
             style="font-size: 1.5rem;height: 8vh;line-height: 8vh;padding-left: 2vh"><strong>部门成果展示</strong>
        </div>
    </div>
    <div class="row clean" style="padding: 10px">
        <div class="col-xs-12 col-sm-12 col-md-12 clean" style="font-size: 1.5rem;padding-left: 2vh">
            <c:choose>
                <c:when test="${empty requestScope.attaches}">
                    <tr>
                        <th colspan="6">还没有添加部门成果！</th>
                    </tr>
                </c:when>
                <c:when test="${!empty requestScope.attaches}">
                    <c:forEach var="attach" items="${requestScope.attaches}" varStatus="status">
                        <c:if test="${attach.type == 'achievement'}">
                            <div><span class="glyphicon glyphicon-minus"
                                       aria-hidden="true"
                                       onclick="deleteAttach('${attach.id}','${attach.content}')"></span>&nbsp;${attach.content}
                            </div>
                        </c:if>
                    </c:forEach>
                </c:when>
            </c:choose>
            <div>
                <button class="btn btn-default" style="width: 30vw"
                        onclick="newAchievement('${requestScope.department.name}')">添加
                </button>
            </div>
        </div>
    </div>
    <div class="row clean" style="padding: 10px;height: 20vh">

    </div>
</div>
<%-------------------------添加科协成员模态对话框------------------------------------------------------------------%>

<div class="modal fade" id="newSTAMemberModal" tabindex="-1" role="dialog" aria-labelledby="newSTAMemberModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">添加科协成员信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row clean">
                        <div class="col-xs-12 col-sm-12 col-md-12 clean">
                            <input type="text" class="form-control" id="newMemberName" placeholder="姓名"
                                   style="width: 100%; margin-bottom: 5vh">
                            <input type="text" class="form-control" id="newMemberClasses" placeholder="班级"
                                   style="width: 100%; margin-bottom: 5vh">
                            <ul class="nav navbar-nav" style="width: 100%; margin-bottom: 5vh;">
                                <li class="dropdown" style="width: 100%">
                                    <a href="#" id="navbarDrop3" class="dropdown-toggle" data-toggle="dropdown"
                                       role="button" aria-haspopup="true" aria-expanded="false"><span
                                            id="newMenberDepartment">部门</span><span
                                            class="caret"></span></a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDrop1">
                                        <li><a onclick="select3('主席团')">主席团</a></li>
                                        <li><a onclick="select3('综合事务部')">综合事务部</a></li>
                                        <li><a onclick="select3('技术交流与推广部')">技术交流与推广部</a></li>
                                        <li><a onclick="select3('赛事部')">赛事部</a></li>
                                        <li><a onclick="select3('项目部')">项目部</a></li>
                                        <li><a onclick="select3('公共关系部')">公共关系部</a></li>
                                        <li><a onclick="select3('创新创业项目管理中心')">创新创业项目管理中心</a></li>
                                        <li><a onclick="select3('研发中心')">研发中心</a></li>
                                    </ul>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav" style="width: 100%; margin-bottom: 5vh;">
                                <li class="dropdown" style="width: 100%">
                                    <a href="#" id="navbarDrop4" class="dropdown-toggle" data-toggle="dropdown"
                                       role="button" aria-haspopup="true" aria-expanded="false"><span id="newMenberJob">职位</span><span
                                            class="caret"></span></a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDrop1">
                                        <li><a onclick="select4('部长')">部长</a></li>
                                        <li><a onclick="select4('副部长')">副部长</a></li>
                                        <li><a onclick="select4('干事')">干事</a></li>
                                    </ul>
                                </li>
                            </ul>

                            <input id="newMenberPortrait" name="newMenberPortrait" type="file" style="display:none">
                            <%--<div class="input-append" style="width: 30vw">
                                <input id="photoCover" class="input-large form-control disabled" type="text" style="height:30px;">
                                <a class="btn btn-default form-control" onclick="$('input[id=lefile]').click();" >Browse</a>
                            </div>--%>
                            <div class="input-group" style="width: 100%; margin-bottom: 5vh">
                                <input id="photoCover1" type="text" class="form-control" placeholder="头像文件临时路径"
                                       aria-describedby="basic-addon2">
                                <span class="input-group-addon btn btn-default" id="basic-addon3"
                                      onclick="$('input[id=newMenberPortrait]').click();">选择文件</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="newSTAMemberModalBtn">提交</button>
            </div>
        </div>
    </div>
</div>

<%--模态对话框3--------------------------------------------------------------------------------------------%>
<!-- Modal -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加部门职责</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="部门职责" id="newResponsibilityContent">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="addResponsibilityBtn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--模态对话框4--------------------------------------------------------------------------------------------%>
<!-- Modal -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加部门成果</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="部门成果" id="newachievementContent">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="addAchievementBtn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--删除科协成员的模态对话框--%>
<div class="modal fade" id="deleteMemberModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">您确定要删除科协成员“<span id="deleteMemberName"></span>”么？</h4>
            </div>
            <div class="modal-body">
                <center>
                    <button class="btn btn-primary" style="width: 10vw" data-dismiss="modal">别，我开玩笑的</button>
                    <button class="btn btn-danger" style="width: 10vw" id="deleteConfirmBtn">嗯，删吧</button>
                </center>
            </div>
        </div>
    </div>
</div>
<%--删除科协成员的模态对话框--%>
<div class="modal fade" id="deleteAttachModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">您确定要删除附加信息“<span id="deleteAttachName"></span>”么？</h4>
            </div>
            <div class="modal-body">
                <center>
                    <button class="btn btn-primary" style="width: 10vw" data-dismiss="modal">别，我开玩笑的</button>
                    <button class="btn btn-danger" style="width: 10vw" id="deleteAttachConfirmBtn">嗯，删吧</button>
                </center>
            </div>
        </div>
    </div>
</div>
<%--消息提示模态对话框--%>
<div class="modal fade" id="msg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">消息提示</h4>
            </div>
            <div class="modal-body">
                <span id="msgContent"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="msgBtn">确定</button>
            </div>
        </div>
    </div>
</div>
<%---------------------------------script脚本-------------------------------------------------------------------------%>
<script src="js/ajaxfileupload.js"></script>
<script>
    function newMenber() {
        $('#newSTAMemberModal').modal();
        $("#newSTAMemberModalBtn").unbind('click');
        $("#newSTAMemberModalBtn").click(function () {
            var name = $("#newMemberName").val().trim();
            var classes = $("#newMemberClasses").val().trim();
            var department = $("#newMenberDepartment").html().trim();
            var job = $("#newMenberJob").html().trim();
//            alert(name+classes+department+job);
            $.ajaxFileUpload({
                url: 'addNewMember?name=' + name + "&classes=" + classes + "&department=" + department + "&job=" + job,
                type: 'post',
                secureuri: false, //一般设置为false
                fileElementId: 'newMenberPortrait', // 上传文件的id、name属性名(id和name都得是这个)
                dataType: 'json', //返回值类型，一般设置为json、application/json
                data: {//传递参数到服务器
                    "xxx": "xxx"
                },
                success: function (data, status) {
                    if (data.saveStatus == "success") {
                        $("#msgContent").html("<span style='color: green'>添加成功！</span>");
                    } else {
                        $("#msgContent").html("<span style='color: green'>添加失败！</span>");
                    }
                    $("#msg").modal({backdrop: false});
                    $("#msgBtn").unbind('click');
                    $("#msgBtn").click(function () {
                        window.location.reload();
                    });
                    $("#newSTAMemberModal").modal("hide");
                },
                error: function (data, status, e) {
                    alert(e);
                }
            });
        });
    }

    function deleteMember(id, name) {
        $("#deleteMemberName").html(name);
        $("#deleteMemberModal").modal();
        $("#deleteConfirmBtn").unbind('click');
        $("#deleteConfirmBtn").click(function () {
//            alert(id);
            $.ajax({
                type: "POST",  //提交方式
                url: "adminDeleteMember",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "id": id
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#msgContent").html("<span style='color: green'>删除成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function () {
                            $("#deleteMemberModal").modal("hide");
                            window.location.reload();
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        });
    }

    function newResponsibility(mark) {
        $('#myModal3').modal();
        $("#addResponsibilityBtn").unbind('click');
        $("#addResponsibilityBtn").click(function () {

            $.ajax({
                type: "POST",  //提交方式
                url: "newResponsibility",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "responsibility": $("#newResponsibilityContent").val().trim(),
                    "mark": mark
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#msgContent").html("<span style='color: green'>添加成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function () {
                            $("#myModal3").modal("hide");
                            window.location.reload();
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        });
    }

    function newAchievement(mark) {
        $('#myModal4').modal();
        $("#addAchievementBtn").unbind('click');
        $("#addAchievementBtn").click(function () {

            $.ajax({
                type: "POST",  //提交方式
                url: "newAchievement",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "achievement": $("#newachievementContent").val().trim(),
                    "mark": mark
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#msgContent").html("<span style='color: green'>添加成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function () {
                            $("#myModal4").modal("hide");
                            window.location.reload();
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        });
    }
    function deleteAttach(id, content) {
        $("#deleteAttachName").html(content);
        $("#deleteAttachModal").modal();
        $("#deleteAttachConfirmBtn").unbind('click');
        $("#deleteAttachConfirmBtn").click(function () {
            $.ajax({
                type: "POST",  //提交方式
                url: "deleteAttach",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "id": id
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#msgContent").html("<span style='color: green'>删除成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function () {
                            $("#deleteAttachModal").modal("hide");
                            window.location.reload();
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        });
    }

    function modifyDepartmentTitle(departmentId, inputId, type) {
        $.ajax({
            type: "POST",  //提交方式
            url: "modifyDepartmentTitle",//路径
            dataType: "json",//返回的json格式的数据
            data: {
                "departmentId": departmentId,
                "content": $(inputId).val().trim(),
                "type": type
            },//数据，这里使用的是Json格式进行传输
            success: function (result) {//返回数据根据结果进行相应的处理
                if (result.status == "success") {
                    $("#msgContent").html("<span style='color: green'>修改成功！</span>");
                    $("#msg").modal({backdrop: false});

                    $("#msgBtn").unbind('click');
                    $("#msgBtn").click(function () {
                        window.location.reload();
                    });
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

    function select3(item) {
        $("#newMenberDepartment").html(item);
    }
    function select4(item) {
        $("#newMenberJob").html(item);
    }

    $('input[id=newMenberPortrait]').change(function () {
        $('#photoCover1').val($(this).val());
        var file = this.files[0];
        var result = document.getElementById("newMenberImg");
        if (!/image\/\w+/.test(file.type)) {
            alert("文件必须为图片！");
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (e) {
            result.innerHTML = '<img style="width: 100%;height: auto" src="' + this.result + '" alt=""/>'
        }
    });
    $('input[id=lefile]').change(function () {
        $('#photoCover').val($(this).val());

    });
</script>