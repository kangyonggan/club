<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="查询"/>
<#assign title="${email.subject}"/>

<@override name="breadcrumbs">
<li>
    <a href="${ctx}/dashboard/query/email">邮件查询</a>
</li>
</@override>

<@override name="main">
<div class="space-14"></div>
    ${email.content}
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/query/email/detail.js"></script>
</@override>

<@extends name="../../layout.ftl"/>