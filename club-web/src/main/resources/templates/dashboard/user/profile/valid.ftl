<#if userDto.emailValid==1>
<div style="line-height: 34px;">
    <a href="javascript:" class="green">已绑定</a>
    <a href="javascript:Message.warning('开发中')">更换</a>
</div>
<#else>
<div style="line-height: 34px;">
    <@ca.link name="重发" href="${baseUrl}/sendEmail" type="confirm" title="重新发送绑定邮件"/>
    <a href="javascript:Message.warning('开发中')">更换</a>
</div>
</#if>
