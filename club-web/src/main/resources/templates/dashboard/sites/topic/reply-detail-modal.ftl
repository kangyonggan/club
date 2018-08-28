<#assign modal_title="回复详情" />

<@override name="modal-body">
<div class="col-xs-12" style="min-height: 160px;">
    ${reply.content}
</div>
<div class="clearfix"></div>
</@override>

<@override name="modal-footer">
    <@ca.button name="取消" icon="fa-times" dismiss=true/>
</@override>

<@extends name="../../modal-layout.ftl"/>