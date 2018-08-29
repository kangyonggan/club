<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>${title!'未知'} · ${appName}</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="stylesheet" href="${ctx}/app/css/app.css"/>
    <script src="${ctx}/libs/jquery/jquery-1.8.3.min.js"></script>
    <script>var ctx = '${ctx}';</script>
<@block name="style"/>
</head>

<body>

<div class="layout-container">
<#include "navbar.ftl"/>
    <div id="main" class="content">
        <ul class="breadcrumbs">
            <span>您当前的位置：</span>
            <li>
                <a href="${ctx}/">${appName}</a>
            </li>
        <@block name="breadcrumbs"/>
        </ul>
        <div class="main-container">
        <@block name="main"/>
        </div>
    </div>
    <div class="empty"></div>
</div>
<#include "footer.ftl"/>

<script src="${ctx}/libs/jquery/jquery.form.min.js"></script>
<script src="${ctx}/libs/jquery/jquery.validate.min.js"></script>
<script src="${ctx}/libs/jquery/jquery.validate.extends.js"></script>
<script src="${ctx}/app/js/app.js"></script>
<@block name="script"/>
</body>
</html>
