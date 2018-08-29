<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="网站"/>
<#assign title="帖子管理"/>
<#assign baseUrl="${ctx}/dashboard/sites/topic"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.select name="forumId" label="版块" inline=true>
            <#list allForums as forum>
            <option value="${forum.forumId}"
                    <#if forum.childrenForums?size gt 0 || !(userForums?seq_contains(forum.forumId))>disabled="disabled"</#if>>
            ${forum.forumName}
            </option>
                <#if forum.childrenForums?size gt 0>
                    <#list forum.childrenForums as fm>
                    <option value="${fm.forumId}" <#if !(userForums?seq_contains(fm.forumId))>disabled="disabled"</#if>>
                        &nbsp;&nbsp;&nbsp;${fm.forumName}
                    </option>
                    </#list>
                </#if>
            </#list>
        </@ca.select>
        <@ca.input name="title" label="标题" inline=true/>
        <@ca.input name="nickName" label="发帖人" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
            <@ca.link name="添加新帖子" class="btn btn-sm btn-skin" href="${baseUrl}/create"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="title" title="标题" sortable=true render=true>
        {{if row.titleHighlight == 1}}
            <@ca.link name="{{value}}" href="${ctx}/bbs/topic/{{row.topicId}}" target="_blank" class="red"/>
        {{else}}
            <@ca.link name="{{value}}" href="${ctx}/bbs/topic/{{row.topicId}}" target="_blank"/>
        {{/if}}
        </@ca.th>
        <@ca.th field="forumName" title="所属版块" sortable=true/>
        <@ca.th field="isStick" title="是否置顶" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="YesNo"/>
        </@ca.th>
        <@ca.th field="stickExpireDate" title="置顶过期时间" sortable=true render=true>
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th field="upNum" title="顶/踩" sortable=true render=true>
        {{value}} / {{row.downNum}}
        </@ca.th>
        <@ca.th field="readNum" title="阅读/回复" sortable=true render=true>
        {{value}} / {{row.replyCount}}
        </@ca.th>
        <@ca.th field="nickName" title="发帖人" sortable=true/>
        <@ca.th field="isDeleted" title="逻辑删除" render=true>
            <#include "delete.ftl"/>
        </@ca.th>
        <@ca.th field="createdTime" title="发帖时间" render=true class="hidden-sm hidden-xs">
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th title="操作" render=true>
            <#include "operation.ftl"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/sites/topic/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>