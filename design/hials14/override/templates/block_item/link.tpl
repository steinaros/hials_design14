{* Link - block_item view *}
{def $css_class=false()}

<div class="{concat($css_class,' textcenter')|wash}">
	<div class="class-link">
	{if ne( $node.data_map.location.content, '' )}
	    <p><a href="{$node.data_map.location.content}" target="_blank" title="{$node.data_map.location.data_text}">{attribute_view_gui attribute=$node.data_map.name}</a></p>
	{else}
	    <p>{attribute_view_gui attribute=$node.data_map.name}</p>
	{/if}    
	</div>
</div>
{undef $css_class}