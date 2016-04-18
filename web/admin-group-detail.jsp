<%--
  Created by IntelliJ IDEA.
  User: martsforever
  Date: 2016/2/21
  Time: 19:12
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
            <span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;组队管理
        </div>
        <div class="col-xs-12 col-sm-2 col-md-2 clean text-center"
             style="height:8vh;background-color: #ddd;line-height: 8vh;font-size: 2rem;padding-left: 1rem">
        </div>
    </div>
    <div class="row clean">
        <div class="col-xs-12 col-sm-12 col-md-12 clean text-center">
            <center>
                <table class="table table-bordered" style="width: 60vw;margin-top: 10vh">
                    <%--<thead>
                    <tr>
                        <th>First</th>
                        <th>Last</th>
                    </tr>
                    </thead>--%>
                    <tbody>
                    <tr>
                        <td style="width: 20%">队伍名称</td>
                        <td style="width: 80%">${requestScope.team.name}</td>
                    </tr>
                    <tr>
                        <td>队伍发起人</td>
                        <td>${requestScope.minister.name}</td>
                    </tr>
                    <tr>
                        <td>队伍发布日期</td>
                        <td>${requestScope.team.publishTime}</td>
                    </tr>
                    <tr>
                        <td>队伍截止日期</td>
                        <td>${requestScope.team.expiryDate}</td>
                    </tr>
                    <tr>
                        <td>队伍目标人数</td>
                        <td>${requestScope.team.teamSize}</td>
                    </tr>
                    <tr>
                        <td>队伍目前人数</td>
                        <td>${requestScope.team.currentSize}</td>
                    </tr>
                    <tr>
                        <td>简介</td>
                        <td>${requestScope.team.introduce}</td>
                    </tr>
                    </tbody>
                </table>
            </center>
        </div>
    </div>
</div>
