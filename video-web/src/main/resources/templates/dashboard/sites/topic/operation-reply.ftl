<@ca.link_group>
    <@ca.link name="详情" href="${baseUrl}/{{row.replyId}}" class="btn btn-xs btn-inverse" modal="myModal"/>
    <@ca.drop_group>
    {{if row.isDeleted==1}}
        <@ca.link name="物理删除" drop=true href="${baseUrl}/{{row.replyId}}/remove" type="confirm" title="物理删除回复"/>
    {{else}}
        <@ca.link name="物理删除" drop=true class="disabled"/>
    {{/if}}
    </@ca.drop_group>
</@ca.link_group>