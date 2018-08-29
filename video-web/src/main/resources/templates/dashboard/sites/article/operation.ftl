<@ca.link_group>
    <@ca.link name="详情" href="${baseUrl}/{{row.articleId}}" class="btn btn-xs btn-inverse"/>
    <@ca.drop_group>
        <@ca.link name="编辑" drop=true href="${baseUrl}/{{row.articleId}}/edit"/>
    {{if row.isDeleted==1}}
        <@ca.link name="物理删除" drop=true href="${baseUrl}/{{row.articleId}}/remove" type="confirm" title="物理删除文章"/>
    {{else}}
        <@ca.link name="物理删除" drop=true class="disabled"/>
    {{/if}}
    </@ca.drop_group>
</@ca.link_group>