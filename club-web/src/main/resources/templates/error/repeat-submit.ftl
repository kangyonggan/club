<#assign title="重复提交"/>

<@override name="main">
<h1>token失效或重复提交，请刷新界面重试</h1>

<a href="javascript:history.back();">返回</a>
<a href="${ctx}/">首页</a>
</@override>

<@extends name="../web/layout.ftl"/>