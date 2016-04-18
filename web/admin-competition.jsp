<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 13:52
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
            <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;比赛管理
        </div>
        <div class="col-xs-12 col-sm-2 col-md-2 clean text-center"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean">
            <table class="table table-hover">
                <caption>
                    <center>
                        <div class="input-group" style="width: 50vw;">
                            <input id="searchKey" type="text" class="form-control" placeholder="用输入要查找的比赛的关键字" value="${requestScope.key}"
                                   aria-describedby="basic-addon">
                            <span class="input-group-addon btn btn-info" id="searchBtn">Go!</span>
                        </div>
                    </center>
                </caption>
                <thead>
                <tr>
                    <th>#</th>
                    <th>比赛名称</th>
                    <th>比赛时间</th>
                    <th>简介</th>
                    <th>详细链接</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>

                <c:choose>
                    <c:when test="${empty requestScope.competitions}">
                        <tr>
                            <th colspan="6">很抱歉，没有您想要的数据！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty requestScope.competitions}">
                        <c:forEach var="competition" items="${requestScope.competitions}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1}</th>
                                <td>${competition.name}</td>
                                <td>${competition.time}</td>
                                <td><span data-toggle="tooltip" data-placement="right" title="${competition.introduce}">简介</span></td>
                                <td><a href="${competition.link}">链接</a></td>
                                <td class="text-center">
                                    <button onclick="modifyConpetitionModal('${competition.id}','${competition.name}','${competition.time}','${competition.introduce}','${competition.link}')" class="btn btn-success">
                                        编辑
                                    </button>
                                    <button onclick="deleteConpetitionModal('${competition.id}','${competition.name}')" class="btn btn-success">
                                        删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
                </tbody>
            </table>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 clean text-right">
            <nav>
                <ul class="pagination clean">
                    <li>
                        <a href="javascript:previousPage()" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="${requestScope.startAndEnd.start}" end="${requestScope.startAndEnd.end}"
                               varStatus="status">
                        <li<c:if test="${status.index==requestScope.targetPage}"> class="active"</c:if>>
                        <a href="adminCompetition?targetPage=${status.index}&key=${requestScope.key}">${status.index}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <a href="javascript:nextPage()" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3 clean">
            <div class="input-group text-center" style="width: 20vw">
                <span class="input-group-addon" id="basic-addon1">一共${requestScope.pageNumber}页</span>
                <input id="page" type="text" class="form-control" placeholder="页码" aria-describedby="basic-addon2"
                       value="${requestScope.targetPage}">
                <span class="input-group-addon btn btn-info" id="selectPageBtn">Go!</span>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3 clean">
            <button class="btn btn-primary" onclick="newConpetitionModal()">发布新赛事</button>
        </div>
    </div>
</div>
<%--修改比赛信息的模态对话框--%>
<div class="modal fade" id="modifyConpetitionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加部门职责</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="比赛名称" style="margin: 2px" id="modify-name">
                <input class="form-control" placeholder="比赛时间" style="margin: 2px" id="modify-time">
                <input class="form-control" placeholder="比赛简介" style="margin: 2px" id="modify-introduce">
                <input class="form-control" placeholder="比赛链接" style="margin: 2px" id="modify-link">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="modifyConfirmBtn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--添加比赛信息的模态对话框--%>
<div class="modal fade" id="newConpetitionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加部门职责</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="比赛名称" style="margin: 2px" id="new-name">
                <input class="form-control" placeholder="比赛时间" style="margin: 2px" id="new-time">
                <input class="form-control" placeholder="比赛简介" style="margin: 2px" id="new-introduce">
                <input class="form-control" placeholder="比赛链接" style="margin: 2px" id="new-link">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="newConfirmBtn">提交</button>
            </div>
        </div>
    </div>
</div>
<%--删除比赛信息的模态对话框--%>
<div class="modal fade" id="deleteConpetitionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">您确定要删除“<span id="deleteCompetitionName"></span>”这条比赛信息么？</h4>
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
<script>
    function modifyConpetitionModal(id,name,time,introduce,link) {
        $("#modify-name").val(name);
        $("#modify-time").val(time);
        $("#modify-introduce").val(introduce);
        $("#modify-link").val(link);

        $("#modifyConpetitionModal").modal();

        $("#modifyConfirmBtn").unbind('click');
        $("#modifyConfirmBtn").click(function(){
            if(checkCompetitionName("#modify-name")&&checkCompetitionTime("#modify-time")&&checkCompetitionIntroduce("#modify-introduce")){
                $.ajax({
                    type: "POST",  //提交方式
                    url: "modifyCompetition",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "id": id,
                        "name": $("#modify-name").val().trim(),
                        "time":$("#modify-time").val().trim(),
                        "introduce":$("#modify-introduce").val().trim(),
                        "link":$("#modify-link").val().trim()
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.status == "success") {
                            $("#msgContent").html("<span style='color: green'>修改成功！</span>");
                            $("#msg").modal({backdrop: false});

                            $("#msgBtn").unbind('click');
                            $("#msgBtn").click(function(){
                                window.location.reload();
                            });
                            $("#modifyConpetitionModal").modal("hide");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            }
        });
    }
    function newConpetitionModal() {

        $("#newConpetitionModal").modal();

        $("#newConfirmBtn").unbind('click');
        $("#newConfirmBtn").click(function(){
            if(checkCompetitionName("#new-name")&&checkCompetitionTime("#new-time")&&checkCompetitionIntroduce("#new-introduce")){
                $.ajax({
                    type: "POST",  //提交方式
                    url: "adminNewCompetition",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "name": $("#new-name").val().trim(),
                        "time":$("#new-time").val().trim(),
                        "introduce":$("#new-introduce").val().trim(),
                        "link":$("#new-link").val().trim()
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.status == "success") {
                            $("#msgContent").html("<span style='color: green'>添加成功！</span>");
                            $("#msg").modal({backdrop: false});

                            $("#msgBtn").unbind('click');
                            $("#msgBtn").click(function(){
                                $("#newConpetitionModal").modal("hide");
                                window.location.reload();
                            });
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            }
        });
    }
    function deleteConpetitionModal(id,name) {

        $("#deleteCompetitionName").html(name);
        $("#deleteConpetitionModal").modal();
        $("#deleteConfirmBtn").unbind('click');
        $("#deleteConfirmBtn").click(function(){
            $.ajax({
                type: "POST",  //提交方式
                url: "adminDeleteResource",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "id": id
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.status == "success") {
                        $("#msgContent").html("<span style='color: green'>删除成功！</span>");
                        $("#msg").modal({backdrop: false});

                        $("#msgBtn").unbind('click');
                        $("#msgBtn").click(function(){
                            $("#deleteConpetitionModal").modal("hide");
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
    function previousPage() {
        if (${requestScope.targetPage<=1}) {
            window.location.href = "adminCompetition?targetPage=1&key=${requestScope.key}";
        }
        else {
            window.location.href = "adminCompetition?targetPage=${requestScope.targetPage-1}&key=${requestScope.key}";
        }
    }
    function nextPage() {
        if (${requestScope.targetPage>=requestScope.pageNumber}) {
            window.location.href = "adminCompetition?targetPage=${requestScope.pageNumber}&key=${requestScope.key}";
        }
        else {
            window.location.href = "adminCompetition?targetPage=${requestScope.targetPage+1}&key=${requestScope.key}";
        }
    }
    $("#selectPageBtn").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${requestScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "adminCompetition?targetPage=" + targetPage;
            if (${requestScope.key!=null}) {
                url += "&key=${requestScope.key}";
            }
            window.location.href = url;
        }
        else {
            $("#msgContent").html("输入不合法！");
            $("#msg").modal({});
        }
    });
    $("#searchBtn").click(function () {
        var url = "adminCompetition?targetPage=1";
        if ($("#searchKey").val().trim() == "") {
            window.location.href = url;
        }
        else {
            window.location.href = url + "&key=" + $("#searchKey").val().trim();
        }
    });
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });

    function checkCompetitionName(name){
        if($(name).val().trim().length<=0){
            $("#msgContent").html("比赛名称不能为空！");
            $("#msg").modal({});
            return false;
        }else return true;
    }
    function checkCompetitionTime(time){
        if($(time).val().trim().length<=0){
            $("#msgContent").html("比赛时间不能为空！");
            $("#msg").modal({});
            return false;
        }else return true;
    }
    function checkCompetitionIntroduce(introduce){
        if($(introduce).val().trim().length<=0){
            $("#msgContent").html("比赛简介不能为空！");
            $("#msg").modal({});
            return false;
        }else return true;
    }

</script>