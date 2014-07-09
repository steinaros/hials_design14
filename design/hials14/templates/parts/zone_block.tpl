{include uri='design:parts/zone_block_top.tpl'}

{if is_set( $container_node )}<!-- Container node seen in zone_block.tpl -->{/if}

{if or( $block.valid_nodes|count(), 
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ), 
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block container_node=$container_node}
    </div>
    <div class="block-separator"></div>
{/if}

{include uri='design:parts/zone_block_bottom.tpl'}