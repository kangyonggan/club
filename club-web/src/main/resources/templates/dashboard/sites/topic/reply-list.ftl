<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="网站"/>
<#assign title="查看回复"/>
<#assign baseUrl="${ctx}/dashboard/sites/topic/${topicId}/reply"/>

<@override name="breadcrumbs">
<li>
    <a href="${ctx}/dashboard/sites/topic">帖子管理</a>
</li>
</@override>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="nickName" label="回复人" inline=true/>
        <@ca.select name="parentReplyId" label="回复类型" inline=true>
            <option value="">全部</option>
            <option value="0">直接回复</option>
        </@ca.select>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="topicId" title="帖子ID" sortable=true/>
        <@ca.th field="nickName" title="回复人" sortable=true/>
        <@ca.th field="replyId" title="回复ID" sortable=true/>
        <@ca.th field="parentReplyId" title="父回复ID" sortable=true/>
        <@ca.th field="upNum" title="顶/踩" sortable=true render=true>
        {{value}} / {{row.downNum}}
        </@ca.th>
        <@ca.th field="isDeleted" title="逻辑删除" render=true>
            <#include "delete-reply.ftl"/>
        </@ca.th>
        <@ca.th field="createdTime" title="回复时间" render=true class="hidden-sm hidden-xs">
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th title="操作" render=true>
            <#include "operation-reply.ftl"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/sites/topic/reply-list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>