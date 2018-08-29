<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="我的"/>
<#assign title="个人资料"/>
<#assign baseUrl="${ctx}/dashboard/user/profile"/>

<@override name="main">
    <@ca.tab_panel>
        <@ca.tabs>
            <@ca.tab ref="user-profile" name="基础信息" icon="fa-info-circle" active=true/>
            <@ca.tab ref="edit-password" name="修改密码" icon="fa-key"/>
        </@ca.tabs>

        <@ca.tab_contents>
            <@ca.tab_content id="user-profile" active=true>
                <@ca.form id="temp">
                    <@ca.input name="" value="${userDto.mobileNo}" label="手机号" readonly=true>
                        <#include "mobile.ftl"/>
                    </@ca.input>
                    <@ca.input name="" value="${userDto.name}" label="姓名" readonly=true/>
                    <@ca.input id="email" name="email" value="${userDto.email}" label="电子邮箱" readonly=true>
                        <#include "valid.ftl"/>
                    </@ca.input>
                    <@ca.select name="" value="${userDto.idType}" label="证件类型" dict_type="ID_TYPE" readonly=true/>
                    <@ca.input name="" value="${userDto.idNo}" label="证件号码" readonly=true/>
                </@ca.form>
            </@ca.tab_content>
            <@ca.tab_content id="edit-password">
                <@ca.form action="${baseUrl}">
                    <@ca.input id="password" name="password" type="password" label="新密码" required=true/>
                    <@ca.input name="rePassword" type="password" label="确认密码" required=true/>

                    <@ca.form_actions>
                        <@ca.button name="提交" class="btn-success" icon="fa-check"/>
                    </@ca.form_actions>
                </@ca.form>
            </@ca.tab_content>
        </@ca.tab_contents>
    </@ca.tab_panel>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/user/profile/index.js"></script>
</@override>

<@extends name="../../layout.ftl"/>