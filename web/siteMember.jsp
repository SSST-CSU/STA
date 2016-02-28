<%@ page import="domain.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>科协成员</title>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <style type="text/css">
        #avatar {
            width: 8vw;
            height: 8vw;
            border-radius: 4vw;
        }

        .memberBtn {
            width: 32%;
        }

    </style>

    <script>

        $(document).ready(function () {
            $(".memberBtn").height($(".memberBtn").width());
        });

    </script>

</head>
<body>

<%@include file="header.jsp" %>
<img src="img/main/STA.png" style="margin-top: 50px;width: 100%;height: auto"/>

<div style=";margin-top: 5vh;margin-left: 10vw;margin-right: 10vw">

    <%@include file="siteNavigation.jsp" %>

    <div style="width: 60vw;float: left;margin-left: 5vw">
        <center>
            <h1><span class="am-icon-send am-icon-sm"></span>&nbsp;科协成员</h1>
            <hr style="width: 100%;border: black 2px groove">
            <s:if test="%{#session.person.isMenber==0}">
                <button class="am-btn am-btn-primary memberBtn" onclick="applyToJoinSTA()">加入科协</button>
                <button class="am-btn am-btn-primary memberBtn" onclick="sendMessage('2','反馈')">消息反馈</button>
                <button class="am-btn am-btn-primary memberBtn" onclick="sendMessage('1','问题')">发送问题</button>
            </s:if>
        </center>
    </div>
</div>

<div class="am-modal" tabindex="-1" id="semdADMessageModal">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">给科协发送<span id="sendType"></span>
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            <textarea style="width:100%;height: 100%" id="sendMessageContent">
            </textarea>
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" id="sendMessageBtn">确定</span>
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

    function applyToJoinSTA(){
        window.location.href = "applyForm.jsp";
    }

    function sendMessage(type,sendType){
        $("#sendMessageContent").val("");
        $("#sendType").html(sendType);
        $("#semdADMessageModal").modal();
        $("#sendMessageBtn").unbind("click");//吧上次绑定的click事件取消，要不然的话每次执行都会比上次多一次，比如第一次发送一条消息，第二次会发送两条相同的消息，第三次会发送三个相同的消息
        $("#sendMessageBtn").click(function () {
            if ($("#sendMessageContent").val().trim() == "") {
                $("#sendMessageContent").modal("hide");
                $("#msgContent").html("消息不能为空！");
                $("#msg").modal({});
                return;
            } else {
                $.ajax({
                    type: "POST",  //提交方式
                    url: "sendADMessage",//路径
                    dataType: "json",//返回的json格式的数据
                    data: {
                        "personId": ${sessionScope.person.id},
                        "type": type,
                        "content":$("#sendMessageContent").val().trim()
                    },//数据，这里使用的是Json格式进行传输
                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result.status == "success") {
                            $("#msgContent").html("<span style='color: green'>发送成功！</span>");
                            $("#msg").modal();
                            $("#sendMessageModal").modal("hide");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            }
        });
    }

</script>

</body>
</html>
