<#assign isEdit=dict.dictId??>
<#assign modal_title="${isEdit?string('编辑字典', '添加新字典')}" />

<@override name="modal-body">
    <@ca.form id="modal-form" action="${ctx}/dashboard/content/dict/${isEdit?string('update', 'save')}" token=true>

        <@ca.select id="dictType" name="dictType" label="字典类型" enum_key="DictType" value="${dict.dictType!''}" empty=false show_code=true readonly=isEdit/>

        <#if isEdit>
        <input type="hidden" name="dictId" value="${dict.dictId}"/>
        </#if>

    <input type="hidden" id="old-dictCode" value="${dict.dictCode!''}"/>
        <@ca.input id="dictCode" name="dictCode" value="${dict.dictCode!''}" label="字典代码" required=true/>
        <@ca.input name="value" value="${dict.value!''}" label="值" required=true/>
        <@ca.input name="sort" value="${dict.sort!'0'}" label="排序" required=true placeholder="0排在最上面"/>
        <@ca.input name="remark" value="${dict.remark!''}" label="备注"/>
    </@ca.form>
</@override>

<@override name="modal-footer">
    <@ca.button name="取消" icon="fa-times" dismiss=true/>
    <@ca.button name="提交" type="submit" class="btn-success" icon="fa-check"/>
<script src="${ctx}/app/js/dashboard/content/dict/form-modal.js"></script>
</@override>

<@extends name="../../modal-layout.ftl"/>