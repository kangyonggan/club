<#assign title="上传视频"/>

<@override name="breadcrumbs">
<li>${title}</li>
</@override>

<@override name="main">
<form class="form" action="${ctx}/video/upload" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label class="required">标题</label>
        <input type="text" name="title" placeholder="请用一句话描述视频"/>
    </div>
    <div class="form-group">
        <label class="required">视频文件</label>
        <input type="file" name="file"/>
    </div>
    <div class="form-group">
        <label class="required">视频封面</label>
        <input type="file" name="coverFile"/>
    </div>
    <div class="form-group">
        <label>赛道</label>
        <select name="map">
            <option value=""></option>
            <option value="藏宝海湾">藏宝海湾</option>
            <option value="恐龙乐园">恐龙乐园</option>
            <option value="月亮城堡">月亮城堡</option>
            <option value="酋长部落">酋长部落</option>
            <option value="黄昏小镇">黄昏小镇</option>
            <option value="城堡的冬天">城堡的冬天</option>
            <option value="小赛车场">小赛车场</option>
            <option value="钟楼魅影">钟楼魅影</option>
            <option value="风车农场">风车农场</option>
            <option value="绿色山谷">绿色山谷</option>
            <option value="Xtorm乐园">Xtorm乐园</option>
            <option value="长城">长城</option>
            <option value="火山">火山</option>
            <option value="宇宙大帝">宇宙大帝</option>
            <option value="ZIC">ZIC</option>
        </select>
    </div>
    <div class="form-group">
        <label>上传者</label>
        <input type="text" name="author" placeholder="请输入上传者昵称"/>
    </div>

    <p style="color: red; font-size: 12px">
        视频文件大小最大20MB
    </p>

    <div>
        <button class="btn">提交</button>
    </div>
</form>
</@override>

<@override name="script">
<script>

</script>
</@override>

<@extends name="../layout.ftl"/>