{* Link - listitem view *}
{if ne( $node.data_map.link.content, '' )}
    <a href="{$node.data_map.link.content}" {if $open_in_new_window}target="_blank" {/if}title="{$node.data_map.link.data_text}">{attribute_view_gui attribute=$node.data_map.title}</a>
{else}
    {attribute_view_gui attribute=$node.data_map.title}
{/if}    
