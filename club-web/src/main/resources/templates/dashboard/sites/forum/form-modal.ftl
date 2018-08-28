<#assign ctx="${(rca.contextPath)!''}">
<#assign isEdit=forum.forumId??>
<#assign modal_title="${isEdit?string('修改版块', '添加版块')}" />

<@override name="modal-body">
    <@ca.form id="modal-form" action="${ctx}/dashboard/sites/forum/${isEdit?string('update', 'save')}" token=true>
        <#if isEdit>
        <input type="hidden" name="forumId" value="${forum.forumId!''}"/>
        </#if>
        <#if parentForum??>
        <input type="hidden" name="parentForumId" value="${(parentForum.forumId)!''}">
            <@ca.input name="" value="${parentForum.forumName!''}" label="上级版块" readonly=true/>
        </#if>

        <@ca.input name="forumName" value="${forum.forumName!''}" label="版块名称" required=true/>
        <@ca.input name="sort" value="${forum.sort!'0'}" label="排序" required=true placeholder="0排在最上面"/>
        <@ca.select name="isDeleted" value="${forum.isDeleted!'0'}" label="逻辑删除" enum_key="YesNo" required=true/>
    </div>
    </@ca.form>
</@override>

<@override name="modal-footer">
    <@ca.button name="取消" icon="fa-times" dismiss=true/>
    <@ca.button name="提交" type="submit" class="btn-success" icon="fa-check"/>
<script src="${ctx}/app/js/dashboard/sites/forum/form-modal.js"></script>
</@override>

<@extends name="../../modal-layout.ftl"/>