<#assign subtitle="网站"/>
<#assign title="${article.title}"/>

<@override name="breadcrumbs">
<li>
    <a href="${ctx}/dashboard/sites/article">文章管理</a>
</li>
</@override>

<@override name="main">
<div class="space-10"></div>
<div class="row">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="widget-box transparent">
            <div class="widget-header widget-header-large">
                <h3 class="widget-title grey lighter">
                    <i class="ace-icon fa fa-leaf green"></i>
                    ${article.title}
                </h3>

                <div class="widget-toolbar no-border invoice-info">
                    <span class="invoice-info-label">点击量:</span>
                    <span class="red">${article.hits}</span>

                    <br/>
                    <span class="invoice-info-label">创建时间:</span>
                    <span class="blue">${article.createdTime?date}</span>
                </div>

                <div class="widget-toolbar hidden-480">&nbsp;</div>
            </div>

            <div class="widget-body">
                <div class="widget-main padding-24">
                    <div class="row">
                        ${article.content}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</@override>

<@override name="script">
<script src="${ctx}/app/js/dashboard/sites/article/detail.js"></script>
</@override>

<@extends name="../../layout.ftl"/>