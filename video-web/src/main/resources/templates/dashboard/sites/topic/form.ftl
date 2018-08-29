<#assign isEdit=topic.topicId??>
<#assign subtitle="网站"/>
<#assign title="${isEdit?string('编辑帖子', '添加新帖子')}"/>

<@override name="breadcrumbs">
<li>
    <a href="${ctx}/dashboard/sites/topic">帖子管理</a>
</li>
</@override>

<@override name="main">
    <@ca.form action="${ctx}/dashboard/sites/topic/${isEdit?string('update', 'save')}" token=true>
        <#if isEdit>
        <input type="hidden" name="topicId" value="${topic.topicId}"/>
        </#if>
        <@ca.select name="forumId" label="所属版块" empty=false>
            <#list allForums as forum>
            <option value="${forum.forumId}"
                    <#if forum.childrenForums?size gt 0 || !(userForums?seq_contains(forum.forumId))>disabled="disabled"</#if>>
            ${forum.forumName}
            </option>
                <#if forum.childrenForums?size gt 0>
                    <#list forum.childrenForums as fm>
                    <option value="${fm.forumId}" <#if !(userForums?seq_contains(fm.forumId))>disabled="disabled"</#if>>
                        &nbsp;&nbsp;&nbsp;${fm.forumName}
                    </option>
                    </#list>
                </#if>
            </#list>
        </@ca.select>

        <@ca.input name="title" value="${topic.title!''}" label="标题" required=true/>

        <@ca.textarea name="content" label="内容" type="kindeditor" required=true value="${topic.content!''}"></@ca.textarea>

        <#if !isEdit>
        <div class="form-group">
            <div class="col-xs-2 col-xs-offset-2">
                <label>
                    <input name="titleHighlight" value="1" class="ace ace-switch ace-switch-6" type="checkbox">
                    <span class="lbl"> 标题高亮</span>
                </label>
                <div class="red">需要消耗30金币!</div>
            </div>
            <div class="col-xs-2">
                <label>
                    <input name="isStick" value="1" class="ace ace-switch ace-switch-6" type="checkbox">
                    <span class="lbl"> 置顶此贴</span>
                </label>
                <div class="red">需要消耗50金币!</div>
            </div>
            <div class="col-xs-2">
                <label>
                    <#assign userInfo=bbs('userInfo')/>
                    我的金币：<span class="red"> ${userInfo.coin}</span>
                </label>
            </div>
        </div>
        </#if>

        <@ca.form_actions>
            <@ca.button name="提交" class="btn-success" icon="fa-check"/>
        </@ca.form_actions>
    </@ca.form>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/sites/topic/form.js"></script>
</@override>

<@extends name="../../layout.ftl"/>