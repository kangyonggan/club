<#assign isEdit=category.categoryId??>
<#assign modal_title="${isEdit?string('编辑栏目', '添加新栏目')}" />

<@override name="modal-body">
    <@ca.form id="modal-form" action="${ctx}/dashboard/sites/category/${isEdit?string('update', 'save')}" token=true>

        <#if isEdit>
        <input type="hidden" name="categoryId" value="${category.categoryId}"/>
        </#if>

    <input type="hidden" id="old-categoryCode" value="${category.categoryCode!''}"/>
        <@ca.input id="categoryCode" name="categoryCode" value="${category.categoryCode!''}" label="栏目代码" required=true/>
        <@ca.input name="categoryName" value="${category.categoryName!''}" label="栏目名称" required=true/>
    </@ca.form>
</@override>

<@override name="modal-footer">
    <@ca.button name="取消" icon="fa-times" dismiss=true/>
    <@ca.button name="提交" type="submit" class="btn-success" icon="fa-check"/>
<script src="${ctx}/app/js/dashboard/sites/category/form-modal.js"></script>
</@override>

<@extends name="../../modal-layout.ftl"/>