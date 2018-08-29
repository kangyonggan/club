<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="查询"/>
<#assign title="登录日志查询"/>
<#assign baseUrl="${ctx}/dashboard/query/login"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="userId" label="用户ID" inline=true/>
        <@ca.input name="mobileNo" label="手机号" inline=true/>
        <@ca.select name="appSource" label="应用来源" inline=true enum_key="AppSource"/>
        <@ca.input name="beginDate" label="登录开始时间" class="date-picker" inline=true/>
        <@ca.input name="endDate" label="登录结束时间" class="date-picker" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="loginId" title="登录ID" class="hidden-sm hidden-xs"/>
        <@ca.th field="userId" title="用户ID" sortable=true/>
        <@ca.th field="mobileNo" title="手机号" sortable=true/>
        <@ca.th field="ipAddr" title="IP地址" sortable=true/>
        <@ca.th field="appSource" title="应用来源" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="AppSource" show_code=true/>
        </@ca.th>
        <@ca.th field="createdTime" title="登录时间" render=true class="hidden-sm hidden-xs">
            <@ca.thFormat type="datetime"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/query/login/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>