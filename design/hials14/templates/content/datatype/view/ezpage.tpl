{def $zone_layout = cond( $attribute.content.zone_layout, $attribute.content.zone_layout, '' )
     $zones = $attribute.content.zones}

{if is_set( $container_node )}<!-- Container node seen in ezpage.tpl -->{/if}

{if $zone_layout|ne( '' )}
    {def $template = ezini( $zone_layout, 'Template', 'zone.ini' )}
    {include uri=concat( 'design:zone/', $template ) zones=$zones zone_layout=$zone_layout attribute=$attribute container_node=$container_node}
{/if}

