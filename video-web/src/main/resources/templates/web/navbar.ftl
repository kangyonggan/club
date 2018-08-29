<div id="navbar">
    <div class="content">
        <a class="appName" href="${ctx}/">${appName}</a>
    <#assign videoTypes=dict('list', 'VIDEO_TYPE')/>
        <ul>
            <li>
                <a href="${ctx}/">首页</a>
            </li>
        <#list videoTypes as videoType>
            <li <#if currDict?? && currDict.dictCode==videoType.dictCode>class="active"</#if>>
                <a href="${ctx}/video/type/${videoType.dictCode}">${videoType.value}</a>
            </li>
        </#list>
            <li>
                <a href="${ctx}/video/upload">上传视频</a>
            </li>
            <li>
                <a href="${ctx}/advice">意见建议</a>
            </li>
        </ul>
    </div>
</div>