<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="查询"/>
<#assign title="邮件查询"/>
<#assign baseUrl="${ctx}/dashboard/query/email"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="toEmail" label="接收方邮件" inline=true/>
        <@ca.select name="type" label="邮件类型" inline=true dict_type="SMS_TYPE"/>
        <@ca.select name="isDeleted" label="是否已验证" inline=true enum_key="YesNo"/>
        <@ca.input name="beginDate" label="发送开始时间" class="date-picker" inline=true/>
        <@ca.input name="endDate" label="发送结束时间" class="date-picker" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="emailId" title="邮件ID" class="hidden-sm hidden-xs"/>
        <@ca.th field="type" title="邮件类型" sortable=true render=true>
            <@ca.thFormat type="dict" dict_type="EMAIL_TYPE"/>
        </@ca.th>
        <@ca.th field="fromEmail" title="发送方邮箱" sortable=true/>
        <@ca.th field="toEmail" title="接收方邮箱" sortable=true/>
        <@ca.th field="name" title="接收方名称" sortable=true/>
        <@ca.th field="ipAddr" title="IP地址" sortable=true/>
        <@ca.th field="isDeleted" title="是否已验证" sortable=true render=true>
            <@ca.thFormat type="yesNo"/>
        </@ca.th>
        <@ca.th field="createdTime" title="发送时间" render=true class="hidden-sm hidden-xs">
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th title="操作" render=true>
            <@ca.link name="详情" href="${baseUrl}/{{row.emailId}}" class="btn btn-xs btn-inverse"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/query/email/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>