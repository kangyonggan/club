<#assign ctx="${(rca.contextPath)!''}">
<#assign modal_title="响应列表" />
<#assign baseUrl="${ctx}/dashboard/trade/command"/>

<@override name="modal-body">
    <@ca.table id="modal-table" url="${baseUrl}/responds?serialNo=${serialNo}" pagination=false fixed_num=1 column_large=true>
        <@ca.th field="serialNo" title="流水号" sortable=true/>
        <@ca.th field="respondId" title="响应ID" sortable=true/>
        <@ca.th field="channelNo" title="通道编号" sortable=true/>
        <@ca.th field="respDate" title="响应日期" sortable=true/>
        <@ca.th field="respTime" title="响应时间" sortable=true/>
        <@ca.th field="tranCo" title="交易代码" sortable=true/>
        <@ca.th field="amount" title="交易金额" sortable=true/>
        <@ca.th field="successAmount" title="成功金额" sortable=true/>
        <@ca.th field="respCo" title="响应码" sortable=true/>
        <@ca.th field="respMsg" title="响应消息" sortable=true/>
        <@ca.th field="merRespCo" title="商户响应码" sortable=true/>
        <@ca.th field="merRespMsg" title="商户响应消息" sortable=true/>
        <@ca.th field="tranSt" title="交易状态" sortable=true/>
    </@ca.table>
</@override>

<@override name="modal-footer">
    <@ca.button name="关闭" icon="fa-times" dismiss=true/>
</@override>

<@extends name="../../modal-layout.ftl"/>