<@ca.link_group>
    <@ca.link name="编辑" href="${baseUrl}/{{row.userId}}/edit" class="btn btn-xs btn-inverse" modal="myModal"/>
    <@ca.drop_group>
        <@ca.link name="帮他签到" drop=true href="${baseUrl}/{{row.userId}}/sign" type="confirm" title="帮他签到"/>
        <@ca.link name="重置头像" drop=true href="${baseUrl}/{{row.userId}}/resetAvatar" type="confirm" title="重置头像"/>
    </@ca.drop_group>
</@ca.link_group>