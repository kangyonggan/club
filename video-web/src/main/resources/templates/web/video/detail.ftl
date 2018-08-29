<#assign title="${video.title}"/>

<@override name="style">
<link rel="stylesheet" href="${ctx}/libs/Dvideo/css/Dvideo.css"/>
<link rel="stylesheet" href="${ctx}/libs/Dvideo/font-icon/style.css"/>
</@override>

<@override name="breadcrumbs">
<li><a href="${ctx}/${currDict.dictCode}">${currDict.value}</a></li>
<li>${title}</li>
</@override>

<@override name="main">
<div id="video"></div>
<div style="height: 20px;"></div>
</@override>

<@override name="script">
<script src="${ctx}/libs/Dvideo/js/Dvideo.js"></script>
<script>
    new Dvideo ({
        ele: '#video',
        title: '${title}',
        width: '1200px',
        height: '600px',
        src: '${ctx}/${video.src}',
        autoplay: true
    })
</script>
</@override>

<@extends name="../layout.ftl"/>