{* Link - listitem view *}
{if ne( $node.data_map.location.content, '' )}
    <p><a href="{$node.data_map.location.content}" {if $open_in_new_window}target="_blank" {/if}title="{$node.data_map.location.data_text}">{attribute_view_gui attribute=$node.data_map.name}</a></p>
{else}
    <p>{attribute_view_gui attribute=$node.data_map.name}</p>
{/if}    
