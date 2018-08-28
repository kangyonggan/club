<#assign title="错误界面"/>

<@override name="main">
<h3 style="margin-top: 50px; text-align: center">
    发送了一些不好了事情，回到首页从头再来吧！
</h3>
<div class="text-center">
    <a class="btn btn-primary" href="${ctx}/">
        <i class="fa fa-home"></i>
        返回首页
    </a>
</div>
</@override>

<@extends name="web/layout.ftl"/>