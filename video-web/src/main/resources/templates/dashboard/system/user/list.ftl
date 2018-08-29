<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="系统"/>
<#assign title="用户管理"/>
<#assign baseUrl="${ctx}/dashboard/system/user"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="mobileNo" label="手机号" inline=true/>
        <@ca.input name="name" label="姓名" inline=true/>
        <@ca.input name="email" label="电子邮箱" inline=true/>
        <@ca.input name="idNo" label="证件号码" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
            <@ca.link name="添加新用户" class="btn btn-sm btn-skin" href="${baseUrl}/create" modal="myModal"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="userId" title="用户ID" class="hidden-sm hidden-xs"/>
        <@ca.th field="mobileNo" title="手机号" sortable=true/>
        <@ca.th field="name" title="姓名" sortable=true/>
        <@ca.th field="email" title="电子邮箱" sortable=true/>
        <@ca.th field="emailValid" title="邮件已验证" sortable=true render=true>
            <@ca.thFormat type="yesNo"/>
        </@ca.th>
        <@ca.th field="idType" title="证件类型" sortable=true render=true>
            <@ca.thFormat type="dict" dict_type="ID_TYPE"/>
        </@ca.th>
        <@ca.th field="idNo" title="证件号码" sortable=true/>
        <@ca.th field="ipAddr" title="注册IP" sortable=true/>
        <@ca.th field="isDeleted" title="逻辑删除" render=true>
            <#include "delete.ftl"/>
        </@ca.th>
        <@ca.th field="createdTime" title="创建时间" render=true class="hidden-sm hidden-xs">
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th title="操作" render=true>
            <#include "operation.ftl"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/system/user/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>