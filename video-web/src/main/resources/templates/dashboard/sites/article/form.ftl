<#assign isEdit=article.articleId??>
<#assign subtitle="网站"/>
<#assign title="${isEdit?string('编辑文章', '添加新文章')}"/>

<@override name="breadcrumbs">
<li>
    <a href="${ctx}/dashboard/sites/article">文章管理</a>
</li>
</@override>

<@override name="main">
    <@ca.form action="${ctx}/dashboard/sites/article/${isEdit?string('update', 'save')}" token=true>
        <#if isEdit>
        <input type="hidden" name="articleId" value="${article.articleId}"/>
        </#if>
        <@ca.select name="categoryCode" label="所属栏目" empty=false>
            <#list categories as category>
            <option value="${category.categoryCode}" <#if article.categoryCode?? && category.categoryCode==article.categoryCode>selected</#if>>${category.categoryName}</option>
            </#list>
        </@ca.select>

        <@ca.input name="title" value="${article.title!''}" label="标题" required=true/>
        <@ca.input name="summary" value="${article.summary!''}" label="摘要"/>

        <@ca.textarea name="content" label="内容" type="kindeditor" required=true value="${article.content!''}"></@ca.textarea>

        <@ca.form_actions>
            <@ca.button name="提交" class="btn-success" icon="fa-check"/>
        </@ca.form_actions>
    </@ca.form>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/sites/article/form.js"></script>
</@override>

<@extends name="../../layout.ftl"/>