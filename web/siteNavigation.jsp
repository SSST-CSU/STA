<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/1/25
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="domain.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String site = (String) request.getParameter("site");
    System.out.println(site);
%>
<div style="width: 11vw;float: left">
    <div style="text-align: center">
        <img id="avatar"
             src="<%=request.getContextPath() +"/"+ ((Person)session.getAttribute("person")).getProtrait()%>">

        <h2 style="margin-top: 0px"><s:property value="#session.person.account"/></h2>
    </div>
    <ul class="am-nav">
        <li<c:if test='${param.site == "sitePersonInfo"}'>
            class="am-active"
        </c:if>><a href="sitePersonInfo.jsp?site=sitePersonInfo">个人信息&nbsp;<span class="am-icon-paw"></span></a></li>
        <li<c:if test='${param.site == "sitePassword"}'>
            class="am-active"
        </c:if>><a href="sitePassword.jsp?site=sitePassword">修改密码&nbsp;<span class="am-icon-suitcase"></span></a></li>
        <li<c:if test='${param.site == "siteAvatar"}'>
            class="am-active"
        </c:if>><a href="siteAvatar.jsp?site=siteAvatar">头像设置&nbsp;<span class="am-icon-picture-o"></span></a></li>
        <li<c:if test='${requestScope.site == "siteGroup"}'>
            class="am-active"
        </c:if>><a href="siteGroupMessage">组队信息&nbsp;<span class="am-icon-users"></span></a></li>
        <li<c:if test='${param.site == "siteMember"}'>
            class="am-active"
        </c:if>><a href="siteMember.jsp?site=siteMember">科协成员&nbsp;<span class="am-icon-send"></span></a></li>
        <li<c:if test='${requestScope.site == "siteMessage"}'>
            class="am-active"
        </c:if>><a href="siteMessage?targetPage=1">消息通知&nbsp;<span class="am-icon-envelope"></span></a></li>
    </ul>


</div>
