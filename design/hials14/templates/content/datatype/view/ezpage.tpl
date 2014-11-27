{if is_unset($container_node)}{def $container_node = array()}{/if}
{def $zone_layout = cond( $attribute.content.zone_layout, $attribute.content.zone_layout, '' )
     $zones = $attribute.content.zones
     $cn = $container_node
     $vp = $view_parameters}

{if $zone_layout|ne( '' )}
    {def $template = ezini( $zone_layout, 'Template', 'zone.ini' )}
    {include uri=concat( 'design:zone/', $template ) zones=$zones zone_layout=$zone_layout attribute=$attribute container_node=$cn view_parameters=$vp}
{/if}

