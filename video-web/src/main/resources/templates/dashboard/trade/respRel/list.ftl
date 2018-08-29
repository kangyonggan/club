<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="交易"/>
<#assign title="响应码管理"/>
<#assign baseUrl="${ctx}/dashboard/trade/respRel"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.select name="channelNo" label="通道名称" inline=true>
        <option value="sms">短信平台</option>
            <#list channels as channel>
            <option value="${channel.channelNo}">${channel.channelName}</option>
            </#list>
        </@ca.select>
        <@ca.input name="respCo" label="响应码" inline=true/>
        <@ca.input name="merRespCo" label="商户响应码" inline=true/>
        <@ca.select name="tranSt" label="交易状态" inline=true enum_key="TranSt"/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
            <@ca.link name="添加新响应码" class="btn btn-sm btn-skin" href="${baseUrl}/create" modal="myModal"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="respRelId" title="响应码ID" class="hidden-sm hidden-xs"/>
        <@ca.th field="channelNo" title="通道代码" sortable=true/>
        <@ca.th field="channelName" title="通道名称" sortable=true/>
        <@ca.th field="respCo" title="响应码" sortable=true/>
        <@ca.th field="respMsg" title="响应消息" sortable=true/>
        <@ca.th field="merRespCo" title="商户响应码" sortable=true/>
        <@ca.th field="merRespMsg" title="商户响应消息" sortable=true/>
        <@ca.th field="tranSt" title="交易状态" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="TranSt" show_code=true/>
        </@ca.th>
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
<script src="${ctx}/app/js/dashboard/trade/respRel/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>