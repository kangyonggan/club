<#assign isEdit=respRel.respRelId??>
<#assign modal_title="${isEdit?string('编辑响应码', '添加新响应码')}" />

<@override name="modal-body">
    <@ca.form id="modal-form" action="${ctx}/dashboard/trade/respRel/${isEdit?string('update', 'save')}" token=true>

        <@ca.select id="channelNo" name="channelNo" label="通道名称" empty=false>
            <#list channels as channel>
            <option value="${channel.channelNo}">${channel.channelName}</option>
            </#list>
        </@ca.select>

        <#if isEdit>
        <input type="hidden" name="respRelId" value="${respRel.respRelId}"/>
        </#if>

    <input type="hidden" id="old-respCo" value="${respRel.respCo!''}"/>
        <@ca.input id="respCo" name="respCo" value="${respRel.respCo!''}" label="响应码" required=true/>
        <@ca.input name="respMsg" value="${respRel.respMsg!''}" label="响应消息" required=true/>
        <@ca.input name="merRespCo" value="${respRel.merRespCo!''}" label="商户响应码" required=true/>
        <@ca.input name="merRespMsg" value="${respRel.merRespMsg!''}" label="商户响应消息" required=true/>
        <@ca.select name="tranSt" enum_key="TranSt" value="${respRel.tranSt!''}" label="交易状态" empty=false/>
    </@ca.form>
</@override>

<@override name="modal-footer">
    <@ca.button name="取消" icon="fa-times" dismiss=true/>
    <@ca.button name="提交" type="submit" class="btn-success" icon="fa-check"/>
<script src="${ctx}/app/js/dashboard/trade/respRel/form-modal.js"></script>
</@override>

<@extends name="../../modal-layout.ftl"/>