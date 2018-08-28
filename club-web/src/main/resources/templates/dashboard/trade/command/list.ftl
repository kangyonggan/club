<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="交易"/>
<#assign title="交易查询"/>
<#assign baseUrl="${ctx}/dashboard/trade/command"/>

<@override name="main">
    <@ca.form class="col-xs-12 fa-border radius-base">
        <@ca.input name="serialNo" label="流水号" inline=true/>
        <@ca.select name="channelNo" label="通道名称" inline=true>
            <#list channels as channel>
                <option value="${channel.channelNo}">${channel.channelName}</option>
            </#list>
        </@ca.select>
        <@ca.select name="acceptMode" label="请求方式" inline=true enum_key="AcceptMode"/>
        <@ca.input name="name" label="客户姓名" inline=true/>
        <@ca.input name="mobileNo" label="手机号" inline=true/>
        <@ca.input name="tranDate" class="date-picker" label="交易日期" date_format="yyyymmdd" inline=true/>
        <@ca.select name="productCo" label="产品名称" inline=true dict_type="PRODUCT_CO"/>
        <@ca.select name="appSource" label="应用来源" inline=true enum_key="AppSource"/>
        <@ca.select name="tranSt" label="交易状态" inline=true enum_key="TranSt"/>
        <@ca.select name="reverseSt" label="冲正状态" inline=true enum_key="YorN"/>

        <@ca.form_actions background=false>
            <@ca.link name="查询" class="btn btn-sm btn-purple" icon="fa-search" type="submit" table_id="table"/>
            <@ca.link name="清除" class="btn btn-sm btn-warning" icon="fa-undo" type="reset"/>
        </@ca.form_actions>
    </@ca.form>

    <@ca.table url="${baseUrl}/list" fixed_num=1 column_large=true>
        <@ca.th field="serialNo" title="流水号" sortable=true/>
        <@ca.th field="channelName" title="通道名称" sortable=true/>
        <@ca.th field="acceptMode" title="请求方式" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="AcceptMode"/>
        </@ca.th>
        <@ca.th field="name" title="客户姓名" sortable=true/>
        <@ca.th field="mobileNo" title="手机号" sortable=true/>
        <@ca.th field="tranDate" title="交易日期" sortable=true/>
        <@ca.th field="tranTime" title="交易时间" sortable=true/>
        <@ca.th field="tranName" title="交易名称" sortable=true/>
        <@ca.th field="productCo" title="产品名称" sortable=true render=true>
            <@ca.thFormat type="dict" dict_type="PRODUCT_CO" show_code=true/>
        </@ca.th>
        <@ca.th field="clientIp" title="IP地址" sortable=true/>
        <@ca.th field="curCo" title="币种" sortable=true render=true>
            <@ca.thFormat type="dict" dict_type="CUR_CO"/>
        </@ca.th>
        <@ca.th field="amount" title="交易金额" sortable=true/>
        <@ca.th field="tranRemark" title="交易附言" sortable=true/>
        <@ca.th field="appSource" title="应用来源" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="AppSource" show_code=true/>
        </@ca.th>
        <@ca.th field="qryCount" title="查询次数" sortable=true/>
        <@ca.th field="lockSt" title="锁状态" sortable=true/>
        <@ca.th field="tranSt" title="交易状态" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="TranSt" show_code=true/>
        </@ca.th>
        <@ca.th field="reverseSt" title="冲正状态" sortable=true render=true>
            <@ca.thFormat type="enum" enum_key="YorN"/>
        </@ca.th>

        <@ca.th field="createdTime" title="创建时间" render=true>
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th field="updatedTime" title="更新时间" render=true>
            <@ca.thFormat type="datetime"/>
        </@ca.th>
        <@ca.th title="操作" render=true>
            <@ca.link name="响应列表" href="${baseUrl}/{{row.serialNo}}" class="btn btn-xs btn-inverse" modal="myLargeModal"/>
        </@ca.th>
    </@ca.table>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/trade/command/list.js"></script>
</@override>

<@extends name="../../layout.ftl"/>