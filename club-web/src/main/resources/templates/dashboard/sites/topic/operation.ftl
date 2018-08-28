<@ca.link_group>
    <@ca.link name="详情" href="${ctx}/bbs/topic/{{row.topicId}}" target="_blank" class="btn btn-xs btn-inverse"/>
    <@ca.drop_group>
        <@ca.link name="编辑" drop=true href="${baseUrl}/{{row.topicId}}/edit"/>
        <@ca.link name="查看回复" drop=true href="${baseUrl}/{{row.topicId}}/reply"/>
    {{if row.isDeleted==1}}
        <@ca.link name="物理删除" drop=true href="${baseUrl}/{{row.topicId}}/remove" type="confirm" title="物理删除帖子"/>
    {{else}}
        <@ca.link name="物理删除" drop=true class="disabled"/>
    {{/if}}
    </@ca.drop_group>
</@ca.link_group>