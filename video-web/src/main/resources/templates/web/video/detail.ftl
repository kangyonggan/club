<#assign title="无转超级起步简明教程"/>

<@override name="style">
<link rel="stylesheet" href="${ctx}/libs/Dvideo/css/Dvideo.css"/>
<link rel="stylesheet" href="${ctx}/libs/Dvideo/font-icon/style.css"/>
</@override>

<@override name="breadcrumbs">
<li><a href="${ctx}/teach">教学视频</a></li>
<li>${title}</li>
</@override>

<@override name="main">
<div id="video"></div>
</@override>

<@override name="script">
<script src="${ctx}/libs/Dvideo/js/Dvideo.js"></script>
<script>
    new Dvideo ({
        ele: '#video',
        title: '${title}',
        width: '1200px',
        height: '600px',
        src: '${ctx}/libs/Dvideo/evn4.mp4',
        autoplay: true
    })
</script>
</@override>

<@extends name="../layout.ftl"/>