<@ca.link_group>
    <@ca.link name="编辑" href="${baseUrl}/{{row.respRelId}}/edit" class="btn btn-xs btn-inverse" modal="myModal"/>
    <@ca.drop_group>
    {{if row.isDeleted==1}}
        <@ca.link name="物理删除" drop=true href="${baseUrl}/{{row.respRelId}}/remove" type="confirm" title="物理删除响应码"/>
    {{else}}
        <@ca.link name="物理删除" drop=true class="disabled"/>
    {{/if}}
    </@ca.drop_group>
</@ca.link_group>