{* Link - block_item view *}
{*def $css_class=false()*}

<div class="{concat($css_class,' textcenter')|wash}">
	<div class="class-link">
	{if ne( $node.data_map.location.content, '' )}
	    <span><a href="{$node.data_map.location.content}" {if $open_in_new_window}target="_blank" {/if}title="{$node.data_map.location.data_text}">{attribute_view_gui attribute=$node.data_map.name}</a></span>
	{else}
	    <span>{attribute_view_gui attribute=$node.data_map.name}</span>
	{/if}    
	</div>
</div>
{*undef $css_class*}