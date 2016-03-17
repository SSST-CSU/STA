<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/22
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
<link rel="stylesheet" href="css/button.css">

<style>
  a{
    color: white;
  }
</style>

<footer class="amz-footer" style="background: #282828">
  <div class="am-g am-g-fixed">
    <div class="col-md-4 col-md-push-8 am-u-md-4 am-u-md-push-8">
      <ul class="amz-social" style="list-style: none;margin-top: 10px;color: white">
        <li><button class="button button-circle"><a title="科协QQ" onclick="alert('敬请期待')"><span class="am-icon-qq" style="color: black"></span></a></button></li>
        <li><button class="button button-circle"><a title="科协微博" target="_blank" href="http://weibo.com/u/5655525908?refer_flag=1001030101_&is_hot=1"><span class="am-icon-weibo" style="color: black"></span></a></button></li>
        <li><button class="button button-circle"><a title="科协微信" onclick="alert('敬请期待')"><span class="am-icon-wechat" style="color: black"></span></a></button></li>
        <li><button class="button button-circle"><a title="Bug 反馈" href="siteMember.jsp"><span class="am-icon-paper-plane" style="color: black"></span></a></button></li>
      </ul>
    </div>
    <div class="col-md-8 col-md-pull-4 am-u-md-8 am-u-md-pull-4" style="color: white !important;">
      <h2 style="margin-top: 20px"><a>中南大学软件学院</a></h2>
      <ul>
        <a class="am-icon-heart" href="http://www.csu.edu.cn/">&nbsp;中南大学</a> | <a href="http://software.csu.edu.cn/">软件学院</a> | <a href="http://www.jetbrains.com/idea/">技术支持</a > | <a href="javascript:void(0)" onClick="window.external.AddFavorite(location.href,document.title)">收藏本站</a>
      </ul>
      <p>© 2016 AllMobilize, Inc. Licensed under <a target="_blank">Some license</a>. Developed with <a href="http://www.jetbrains.com/idea/" target="_blank">IntelliJ</a>.</p><p class="amz-cp"></p>
    </div>
  </div>
</footer>