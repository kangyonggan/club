{{if value==1}}
<@ca.link name="<span class='label label-danger arrowed-in'>已删除</span>"
href="${baseUrl}/{{row.dictId}}/delete/0" type="confirm" title="恢复字典"/>
{{else}}
<@ca.link name="<span class='label label-success arrowed-in'>未删除</span>"
href="${baseUrl}/{{row.dictId}}/delete/1" type="confirm" title="删除字典"/>
{{/if}}