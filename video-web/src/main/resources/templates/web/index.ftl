<#assign title="首页"/>
<#assign breadcrumbs="false"/>

<@override name="style">
<link rel="stylesheet" href="${ctx}/libs/jquery3dlb/css/public.css"/>
<link rel="stylesheet" href="${ctx}/libs/jquery3dlb/css/index.css"/>
</@override>

<@override name="main">
    <#if hotVideos?size gt 0>
        <#assign videos=hotVideos/>
        <#assign videosId='hot-videos'/>
        <#assign videoType='热门视频'/>
        <#include "video/videos.ftl"/>
    </#if>
    <#if newVideos?size gt 0>
        <#assign videos=newVideos/>
        <#assign videosId='new-videos'/>
        <#assign videoType='最新视频'/>
        <#include "video/videos.ftl"/>
    </#if>
    <#if topVideos?size gt 0>
        <#assign videos=newVideos/>
        <#assign videosId='top-videos'/>
        <#assign videoType='站长推荐'/>
        <#include "video/videos.ftl"/>
    </#if>
</@override>

<@override name="script">
<script src="${ctx}/libs/jquery3dlb/js/zturn.js"></script>
<script>
    $(function () {
        play("hot-videos");
        play("new-videos");
        play("top-videos");
    });

    function play(id) {
        new zturn({
            id: id,
            opacity: 0.9,
            width: 382,
            Awidth: 1024,
            scale: 0.9,
            auto: true,
            turning: 2000
        });
    }
</script>
</@override>

<@extends name="layout.ftl"/>