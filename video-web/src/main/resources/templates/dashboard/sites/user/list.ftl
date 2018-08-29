<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="网站"/>
<#assign title="论坛用户"/>
<#assign baseUrl="${ctx}/dashboard/sites/user"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="nickName" label="用户昵称" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="userId" title="用户ID" class="hidden-sm hidden-xs"/>
        <@ca.th field="nickName" title="昵称" sortable=true/>
        <@ca.th field="avatar" title="头像" sortable=true render=true>
        {{if value != ''}}
        <a href="${ctx}/{{value}}" target="_blank">查看</a>
        {{/if}}
        </@ca.th>
        <@ca.th field="gender" title="性别" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="Gender"/>
        </@ca.th>
        <@ca.th field="coin" title="金币" sortable=true/>
        <@ca.th field="exp" title="经验" sortable=true/>
        <@ca.th field="level" title="等级" sortable=true/>
        <@ca.th field="signDays" title="累计签到天数" sortable=true/>
        <@ca.th field="lastSignDate" title="最后签到日期" sortable=true/>
        <@ca.th field="createdTime" title="创建时间" render=true class="hidden-sm hidden-xs">
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th title="操作" render=true>
            <#include "operation.ftl"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/sites/user/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>