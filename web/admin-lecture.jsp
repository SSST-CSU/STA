<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/19
  Time: 20:53
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
            <span class="glyphicon glyphicon-signal" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;讲座管理
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
                            <input id="searchKey" type="text" class="form-control" placeholder="用输入要查找的讲座名称的关键字" value="${sessionScope.key}"
                                   aria-describedby="basic-addon">
                            <span class="input-group-addon btn btn-info" id="searchBtn">Go!</span>
                        </div>
                    </center>
                </caption>
                <thead>
                <tr>
                    <th>#</th>
                    <th>讲座名称</th>
                    <th>讲座时间</th>
                    <th>简介</th>
                    <th>自由参加？</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>

                <c:choose>
                    <c:when test="${empty sessionScope.lectures}">
                        <tr>
                            <th colspan="6">很抱歉，没有您想要的数据！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty sessionScope.lectures}">
                        <c:forEach var="lecture" items="${sessionScope.lectures}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1}</th>
                                <td>${lecture.name}</td>
                                <td>${lecture.time}</td>
                                <td><span data-toggle="tooltip" data-placement="right"
                                          title="${lecture.introduce}">简介</span></td>
                                <td>
                                    <c:if test="${lecture.accessable!=0}">
                                        是
                                    </c:if>
                                    <c:if test="${lecture.accessable==0}">
                                        否
                                    </c:if>
                                </td>
                                <td class="text-center">
                                    <a onclick="modifyLectureModal('${lecture.id}','${lecture.name}','${lecture.time}','${lecture.introduce}','${lecture.accessable}')"
                                       class="btn btn-success">
                                        编辑
                                    </a>
                                    <a onclick="deleteLectureModal()" class="btn btn-success">
                                        删除
                                    </a>
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
                            <a href="adminLecture?targetPage=${status.index}&key=${sessionScope.key}">${status.index}</a>
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
            <a class="btn btn-primary" onclick="newLectureModal()">发布新讲座</a>
        </div>
    </div>
</div>
<%--修改讲座信息的模态对话框--%>
<div class="modal fade" id="modifyLectureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改讲座信息</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="讲座名称" style="margin: 2px" id="modify-name">
                <input class="form-control" placeholder="讲座时间" style="margin: 2px" id="modify-time">
                <input class="form-control" placeholder="讲座简介" style="margin: 2px" id="modify-introduce">

                <div class="dropup">
                    <button id="modify-isFree" class="btn btn-default selectLabel" style="width: 100%" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        是否自由参加
                        &nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dLabel" style="width: 100%;padding: 2px">
                        <li>是</li>
                        <li>否</li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="modifyConfirmBtn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--添加讲座信息的模态对话框--%>
<div class="modal fade" id="newLectureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加讲座信息</h4>
            </div>
            <div class="modal-body">
                <input class="form-control" placeholder="讲座名称" style="margin: 2px" id="new-name">
                <input class="form-control" placeholder="讲座时间" style="margin: 2px" id="new-time">
                <input class="form-control" placeholder="讲座简介" style="margin: 2px" id="new-introduce">

                <div class="dropup">
                    <button id="new-isFree" class="btn btn-default selectLabel" style="width: 100%" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        是否自由参加
                        &nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dLabel" style="width: 100%;padding: 2px">
                        <li>是</li>
                        <li>否</li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>
<%--删除讲座信息的模态对话框--%>
<div class="modal fade" id="deleteLectureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">您确定要删除这条讲座信息么？</h4>
            </div>
            <div class="modal-body">
                <center>
                    <button class="btn btn-primary" style="width: 10vw" data-dismiss="modal">别，我开玩笑的</button>
                    <button class="btn btn-danger" style="width: 10vw">嗯，删吧</button>
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
    function modifyLectureModal(id, name, time, introduce, accessable) {

        $("#modify-name").val(name);
        $("#modify-time").val(time);
        $("#modify-introduce").val(introduce);
        var isFree = "否";
        if (accessable != "0") isFree = "是";
        $("#modify-isFree").html(isFree + '&nbsp;<span class="caret"></span>');
        $("#modifyLectureModal").modal();

        $("#modifyConfirmBtn").unbind('click');
        $("#modifyConfirmBtn").click(function () {
            if($("#modify-isFree").html() == "是"+ '&nbsp;<span class="caret"></span>') accessable = 1;
            else accessable = 0;
            $.ajax({
                type: "POST",  //提交方式
                url: "adminModifyLecture",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "id": id,
                    "name": $("#modify-name").val().trim(),
                    "time":$("#modify-time").val().trim(),
                    "introduce":$("#modify-introduce").val().trim(),
                    "accessable":accessable
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
    function newLectureModal() {
        $(".selectLabel").html("是否自由参加" + '&nbsp;<span class="caret"></span>');
        $("#newLectureModal").modal();
    }
    function deleteLectureModal() {
        $("#deleteLectureModal").modal();
    }


    $("ul.dropdown-menu li").click(function () {
        $(".selectLabel").html(this.innerHTML + '&nbsp;<span class="caret"></span>');
    });

    function previousPage() {
        if (${sessionScope.targetPage<=1}) {
            window.location.href = "adminLecture?targetPage=1&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminLecture?targetPage=${sessionScope.targetPage-1}&key=${sessionScope.key}";
        }
    }
    function nextPage() {
        if (${sessionScope.targetPage>=sessionScope.pageNumber}) {
            window.location.href = "adminLecture?targetPage=${sessionScope.pageNumber}&key=${sessionScope.key}";
        }
        else {
            window.location.href = "adminLecture?targetPage=${sessionScope.targetPage+1}&key=${sessionScope.key}";
        }
    }
    $("#selectPageBtn").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = ${sessionScope.pageNumber};
        if (targetPage <= pageNumber && targetPage > 0) {
            var url = "adminLecture?targetPage=" + targetPage;
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
        var url = "adminLecture?targetPage=1";
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