<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 20:59
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
            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;资源管理
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
                            <input id="searchKey" type="text" class="form-control" placeholder="用输入要查找的资源名称的关键字" value="${sessionScope.key}"
                                   aria-describedby="basic-addon">
                            <span class="input-group-addon btn btn-info" id="searchBtn">Go!</span>
                        </div>
                    </center>
                </caption>
                <thead>
                <tr>
                    <th>#</th>
                    <th>资源名称</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty sessionScope.resources}">
                        <tr>
                            <th colspan="6">很抱歉，没有您想要的数据！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty sessionScope.resources}">
                        <c:forEach var="resource" items="${sessionScope.resources}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1}</th>
                                <td>${resource.name}</td>
                                <td class="text-center">
                                    <button onclick="modifyResourceInfo('${resource.id}','${resource.name}','${resource.introduce}')" class="btn btn-success">
                                        编辑
                                    </button>
                                    <button onclick="deleteResourceInfo('${resource.id}','${resource.name}')" class="btn btn-success">
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
                    <c:forEach begin="${sessionScope.startAndEnd.start}" end="${sessionScope.startAndEnd.end}"
                               varStatus="status">
                        <li<c:if test="${status.index==sessionScope.targetPage}"> class="active"</c:if>>
                        <a href="adminResource?targetPage=${status.index}&key=${sessionScope.key}">${status.index}</a>
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
        <div class="col-xs-12 col-sm-3 col-md-3 clean text-center">
            <div class="input-group text-center" style="width: 20vw">
                <span class="input-group-addon" id="basic-addon1">一共${sessionScope.pageNumber}页</span>
                <input id="page" type="text" class="form-control" placeholder="页码" aria-describedby="basic-addon2"
                       value="${sessionScope.targetPage}">
                <span class="input-group-addon btn btn-info" id="selectPageBtn">Go!</span>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3 clean text-center">
            <a class="btn btn-primary" href="admin-navigation.jsp?admin=admin-new-resource-info">上传资源</a>
        </div>
    </div>
</div>
<%--修改比赛信息的模态对话框--%>
<div class="modal fade" id="modifyResourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改“<span id="modifyResourceName"></span>”资源的基本信息</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="资源名称" style="margin: 2px" id="modify-name">
                <input class="form-control" placeholder="资源简介" style="margin: 2px" id="modify-introduce">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="modifyConfirmBtn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--删除比赛信息的模态对话框--%>
<div class="modal fade" id="deleteResourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">您确定要删除“<span id="deleteResourceName"></span>”这条资源信息么？</h4>
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

    function modifyResourceInfo(id,name,introduce){
        $("#modifyResourceName").val(name);
        $("#modify-name").val(name);
        $("#modify-introduce").val(introduce);
        $("#modifyResourceModal").modal();

        $("#modifyConfirmBtn").unbind('click');
        $("#modifyConfirmBtn").click(function(){
            $.ajax({
                type: "POST",  //提交方式
                url: "adminModifyResource",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "id": id,
                    "name": $("#modify-name").val().trim(),
                    "introduce":$("#modify-introduce").val().trim()
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
        });

    }
    function deleteResourceInfo(id,name) {

        $("#deleteResourceName").html(name);
        $("#deleteResourceModal").modal();
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
                            $("#deleteResourceModal").modal("hide");
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

    $("ul.dropdown-menu li").click(function () {
        $(".selectLabel").html(this.innerHTML + '&nbsp;<span class="caret"></span>');
    });

    function previousPage() {
        if (${sessionScope.targetPage<=1}) {
            window.location.href = "adminResource?targetPage=1&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminResource?targetPage=${sessionScope.targetPage-1}&key=${sessionScope.key}";
        }
    }
    function nextPage() {
        if (${sessionScope.targetPage>=sessionScope.pageNumber}) {
            window.location.href = "adminResource?targetPage=${sessionScope.pageNumber}&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminResource?targetPage=${sessionScope.targetPage+1}&key=${sessionScope.key}";
        }
    }
    $("#selectPageBtn").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${sessionScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "adminResource?targetPage=" + targetPage;
            if (${sessionScope.key!=null}) {
                url += "&key=${sessionScope.key}";
            }
            window.location.href = url;
        }
        else {
            $("#msgContent").html("输入不合法！");
            $("#msg").modal({});
        }
    });
    $("#searchBtn").click(function () {
        var url = "adminResource?targetPage=1";
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
</script>