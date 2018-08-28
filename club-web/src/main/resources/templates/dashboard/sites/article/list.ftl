<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="网站"/>
<#assign title="文章管理"/>
<#assign baseUrl="${ctx}/dashboard/sites/article"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.select name="categoryCode" label="所属栏目" inline=true>
            <#list categories as category>
            <option value="${category.categoryCode}">${category.categoryName}</option>
            </#list>
        </@ca.select>
        <@ca.input name="title" label="标题" inline=true placeholder="支持模糊搜索"/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
            <@ca.link name="添加新文章" class="btn btn-sm btn-skin" href="${baseUrl}/create"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="title" title="标题" sortable=true render=true>
            <@ca.link name="{{value}}" href="${baseUrl}/{{row.articleId}}"/>
        </@ca.th>
        <@ca.th field="categoryName" title="所属栏目" sortable=true/>
        <@ca.th field="name" title="创建人" sortable=true/>
        <@ca.th field="hits" title="点击量" sortable=true/>
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
<script src="${ctx}/app/js/dashboard/sites/article/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>