<#assign ctx="${(rca.contextPath)!''}">
<#assign subtitle="网站"/>
<#assign title="版块管理"/>
<#assign baseUrl="${ctx}/dashboard/sites/forum"/>

<@override name="style">
<link rel="stylesheet" href="${ctx}/libs/ztree/css/zTreeStyle.css"/>
</@override>

<@override name="main">
<div class="space-10"></div>
<div class="col-sm-8 col-sm-offset-2 col-xs-12">
    <div class="widget-box widget-color-green2">
        <div class="widget-header">
            <h4 class="widget-title lighter smaller">全部版块</h4>
        </div>

        <div class="widget-body">
            <div class="widget-main padding-8">
                <div id="forum-tree" class="ztree"></div>
            </div>
        </div>
    </div>
</div>

    <@ca.form action="${baseUrl}/delete">
    <input type="hidden" name="forumId" id="forumId"/>
    </@ca.form>
</@override>

<@override name="script">
<script>
    var zNodes = [
        {id:0, pId:-1, name: "根节点", open: true},
        <#list allForums as forum>
            {id:${forum.forumId}, pId:${forum.parentForumId}, name: "${forum.forumName}", open: true},
        </#list>];
</script>
<script src="${ctx}/libs/ztree/js/jquery.ztree.core-3.5.min.js"></script>
<script src="${ctx}/libs/ztree/js/jquery.ztree.exedit-3.5.min.js"></script>
<script src="${ctx}/app/js/dashboard/sites/forum/index.js"></script>
</@override>

<@extends name="../../layout.ftl"/>