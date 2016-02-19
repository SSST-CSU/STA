<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/13
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<script src="js/ajaxfileupload.js"></script>
<link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">

<div style="position: fixed;width: 100%;background:black;border-color: black;z-index: 200"
     class="am-topbar am-topbar-inverse am-animation-slide-top">
    <h1 class="am-topbar-brand">
        <a href="#">CSU软院科协</a>
    </h1>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse am-animation-slide-top" id="doc-topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="retriveTeamByPage?targetPage=1">来组团</a></li>
            <li><a href="retriveResourceByPage?targetPage=1">下资源</a></li>
            <li><a href="lectureList.jsp">听讲座</a></li>
            <li><a href="competitionList.jsp">找比赛</a></li>
            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    找我们 <span class="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="#">1. 主席团</a></li>
                    <li><a href="zong.jsp">2. 综合事务部</a></li>
                    <li><a href="#">3. 技术交流与推广部</a></li>
                    <li><a href="#">4. 赛事部</a></li>
                    <li><a href="#">5. 项目部</a></li>
                    <li><a href="#">6. 公共关系部</a></li>
                    <li><a href="#">7. 创新创业项目管理中心</a></li>
                    <li><a href="department.jsp">8. 研发中心</a></li>
                </ul>
            </li>
        </ul>

        <div class="am-topbar-right">
            <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
                <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle"
                        data-am-dropdown-toggle>其他 <span class="am-icon-caret-down"></span></button>
                <ul class="am-dropdown-content">
                    <s:if test="%{#session.person==null}">
                        <li><a href="register.jsp">注册</a></li>
                    </s:if>
                    <li><a href="#">随便看看</a></li>
                </ul>
            </div>
        </div>

        <s:if test="%{#session.person==null}">
            <div class="am-topbar-right">
                <a href="login.jsp">
                    <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm" id="login">登录</button>
                </a>
            </div>
        </s:if>
        <s:else>
            <div class="am-topbar-right">
                <a href="personInfo.jsp">
                    <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm" id="info">欢迎,<s:property
                            value="#session.person.name"/></button>
                </a>
            </div>
            <div class="am-topbar-right">
                <a href="logout">
                    <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm" id="logout">注销</button>
                </a>
            </div>
        </s:else>

    </div>

</div>
<script type="text/javascript">

    /*$("#logout").click(function(){
     $.ajax({
     url:"/testLogout",
     type:"post",
     success:function(data){
     alert('注销成功');
     window.location.href="index.jsp";
     }
     })
     })*/

</script>

