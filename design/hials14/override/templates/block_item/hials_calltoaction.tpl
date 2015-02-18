{def $ctoa_link = false()}
{def $ctoa_object = false()}
{*def $css_class=false()*}
{if $node.data_map.internal_link.has_content}
    {set $ctoa_object = $node.data_map.internal_link.content}
{elseif $node.data_map.external_link.has_content}
    {set $ctoa_link = $node.data_map.external_link.content}
{/if}
<div class="{concat($css_class,' textcenter')|wash}">
	<div class="class-hials_calltoaction">
<span class="call-to-action">{if $ctoa_object}{content_view_gui content_object=$ctoa_object view=text_linked object_name=$node.name}
{elseif $ctoa_link}<a href={$ctoa_link}>{$node.name|wash()}</a>
{else}{$node.name|wash()}{/if}</span>
	</div>
</div>	
{undef $ctoa_link $ctoa_object}