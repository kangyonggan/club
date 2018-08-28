<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="网站"/>
<#assign title="栏目管理"/>
<#assign baseUrl="${ctx}/dashboard/sites/category"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="categoryCode" label="栏目代码" inline=true/>
        <@ca.input name="categoryName" label="栏目名称" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
            <@ca.link name="添加新栏目" class="btn btn-sm btn-skin" href="${baseUrl}/create" modal="myModal"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="categoryId" title="栏目ID" class="hidden-sm hidden-xs"/>
        <@ca.th field="categoryCode" title="栏目代码" sortable=true/>
        <@ca.th field="categoryName" title="栏目名称" sortable=true/>
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
<script src="${ctx}/app/js/dashboard/sites/category/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>