<#assign modal_title="编辑论坛用户" />

<@override name="modal-body">
    <@ca.form id="modal-form" action="${ctx}/dashboard/sites/user/update" token=true>
    <input type="hidden" name="userId" value="${userInfo.userId}"/>

        <@ca.input name="nickName" value="${userInfo.nickName!''}" label="用户昵称" required=true/>
        <@ca.select name="gender" label="性别" enum_key="Gender" value="${userInfo.gender!''}" required=true/>
        <@ca.input name="coin" value="${userInfo.coin!''}" label="金币" required=true/>
        <@ca.input name="exp" value="${userInfo.exp!''}" label="经验" required=true/>
        <@ca.input name="level" value="${userInfo.level!''}" label="等级" required=true/>
        <@ca.input name="signDays" value="${userInfo.signDays!''}" label="累计签到天数" required=true/>
        <@ca.input name="lastSignDate" class="date-picker" date_format="yyyymmdd" value="${userInfo.lastSignDate!''}" label="最后签到日期"/>
    </@ca.form>
</@override>

<@override name="modal-footer">
    <@ca.button name="取消" icon="fa-times" dismiss=true/>
    <@ca.button name="提交" type="submit" class="btn-success" icon="fa-check"/>
<script src="${ctx}/app/js/dashboard/sites/user/form-modal.js"></script>
</@override>

<@extends name="../../modal-layout.ftl"/>