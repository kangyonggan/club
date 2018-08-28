<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="内容"/>
<#assign title="字典管理"/>
<#assign baseUrl="${ctx}/dashboard/content/dict"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.select name="dictType" label="字典类型" inline=true enum_key="DictType" show_code=true/>
        <@ca.input name="dictCode" label="字典代码" inline=true/>
        <@ca.input name="value" label="值" inline=true/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
            <@ca.link name="添加新字典" class="btn btn-sm btn-skin" href="${baseUrl}/create" modal="myModal"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list">
        <@ca.th field="dictId" title="字典ID" class="hidden-sm hidden-xs"/>
        <@ca.th field="dictType" title="字典类型" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="DictType" show_code=true/>
        </@ca.th>
        <@ca.th field="dictCode" title="字典代码" sortable=true/>
        <@ca.th field="value" title="值" sortable=true/>
        <@ca.th field="sort" title="排序" sortable=true/>
        <@ca.th field="remark" title="备注" sortable=true/>
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
<script src="${ctx}/app/js/dashboard/content/dict/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>