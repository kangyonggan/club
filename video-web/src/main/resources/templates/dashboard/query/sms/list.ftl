<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="查询"/>
<#assign title="短信查询"/>
<#assign baseUrl="${ctx}/dashboard/query/sms"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="mobileNo" label="手机号" inline=true/>
        <@ca.select name="type" label="短信类型" inline=true dict_type="SMS_TYPE"/>
        <@ca.select name="isDeleted" label="是否已验证" inline=true enum_key="YesNo"/>
        <@ca.input name="requestId" label="平台流水" inline=true/>
        <@ca.select name="isDebug" label="是否调试模式" inline=true enum_key="YesNo"/>
        <@ca.select name="sendSt" label="发送状态" inline=true enum_key="SendSt"/>
        <@ca.input name="beginDate" label="发送开始时间" class="date-picker" inline=true/>
        <@ca.input name="endDate" label="发送结束时间" class="date-picker" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list" fixed_num=1 column_large=true>
        <@ca.th field="mobileNo" title="手机号" sortable=true/>
        <@ca.th field="code" title="验证码" sortable=true/>
        <@ca.th field="type" title="短信类型" sortable=true render=true>
            <@ca.thFormat type="dict" dict_type="SMS_TYPE"/>
        </@ca.th>
        <@ca.th field="ipAddr" title="IP地址" sortable=true/>
        <@ca.th field="requestId" title="平台流水" sortable=true/>
        <@ca.th field="respCo" title="响应码" sortable=true/>
        <@ca.th field="respMsg" title="响应消息" sortable=true render=true>
        <span title="{{value}}">{{value | limit:10}}</span>
        </@ca.th>
        <@ca.th field="merRespCo" title="商户响应码" sortable=true/>
        <@ca.th field="merRespMsg" title="商户响应消息" sortable=true/>
        <@ca.th field="sendSt" title="发送状态" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="SendSt" show_code=true/>
        </@ca.th>
        <@ca.th field="isDebug" title="是否调试模式" sortable=true render=true>
            <@ca.thFormat type="yesNo"/>
        </@ca.th>
        <@ca.th field="isDeleted" title="是否已验证" sortable=true render=true>
            <@ca.thFormat type="yesNo"/>
        </@ca.th>
        <@ca.th field="createdTime" title="发送时间" render=true class="hidden-sm hidden-xs">
            <@ca.thFormat type="datetime"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/query/sms/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>