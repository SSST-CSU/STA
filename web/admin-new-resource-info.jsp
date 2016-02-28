<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 19:55
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
        <div class="col-xs-12 col-sm-12 col-md-12 clean text-center" style="padding-top: 10vh">
            <center>
                <form id="newResourceForm" action="uploadResourceFile" method="post">
                    <input type="text" class="form-control" id="name" placeholder="资源名称"
                           style="width: 30vw; margin-bottom: 5vh">
                    <input type="text" class="form-control" id="introduce" placeholder="简介"
                           style="width: 30vw; margin-bottom: 5vh">

                    <input id="resource" type="file" name="resource" style="display:none">

                    <div class="input-group" style="width: 30vw; margin-bottom: 5vh">
                        <input id="photoCover" type="text" class="form-control" placeholder="文件临时路径"
                               aria-describedby="basic-addon2">
                    <span class="input-group-addon btn btn-default" id="basic-addon2"
                          onclick="$('input[id=resource]').click();">选择文件</span>
                    </div>
                </form>
                <button type="submit" class="btn btn-success" style="width: 8vw" id="newResourceConfirmBtn">提交</button>
            </center>
        </div>
    </div>
</div>
<%--上传文件进度模态对话框--%>
<div class="modal fade" id="uploadFileProgressModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">正在上传文件</h4>
            </div>
            <div class="modal-body">
                <div class="progress">
                    <div id="uploadProgress" class="progress-bar progress-bar-success progress-bar-striped active"
                         role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                        <span class="sr-only">40% Complete (success)</span>
                    </div>
                </div>
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
<script src="js/ajaxfileupload.js"></script>
<script type="text/javascript">

    var options = {
        backdrop: false,
        keyboard: false
    };
    var uploadInterval;

    $("#newResourceConfirmBtn").click(function () {

//        alert($("#name").val().trim()+$("#introduce").val().trim());

        $.ajaxFileUpload({
            url: 'uploadResourceFile?name='+$("#name").val().trim()+"&"+"introduce="+$("#introduce").val().trim(),
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'resource', // 上传文件的id、name属性名
            dataType: 'json', //返回值类型，一般设置为json、application/json
            data: {//传递参数到服务器
                "name": $("#name").val().trim(),
                "introduce": $("#introduce").val().trim()
            },
            success: function (data, status) {
                if (data.saveStatus == "success") {
                    $("#msgContent").html("添加成功");
                    $("#msg").modal(options);
                    $("#msgBtn").unbind('click');
                    $("#msgBtn").click(function(){
                        window.location.reload();
                    });
                }
                else("保存失败！");
            },
            error: function (data, status, e) {
                alert(e);
            }
        });

        $("#uploadConfirmBtn").attr({"disabled": "disabled"});
        $("#uploadFileProgressModal").modal(options);

        uploadInterval = setInterval("showuploadProgress()", 1000);

    });

    //    var precent = 0;

    function showuploadProgress() {

        $.ajax({
            type: "POST",  //提交方式
            url: "getFileUploadProgress",//路径
            dataType: "json",//返回的json格式的数据
            success: function (result) {//返回数据根据结果进行相应的处理
                $("#uploadProgress").width(result.percent + '%');
                if(result.percent == 100){
                    clearInterval(uploadInterval);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

//        precent+=10;
//        $("#uploadProgress").width(precent+'%');
//        if(precent == 100){
//            $("#uploadConfirmBtn").removeAttr("disabled");
//            clearInterval(uploadInterval);
//        }
    }

    $('input[id=resource]').change(function () {
        $('#photoCover').val($(this).val());
    });
</script>
