<div class="content-view-embed">
    <div class="class-imagemap">
    {if $object.data_map.imagemap.has_content}
        <div class="attribute-image">{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size usemap=concat( "#map-", $object.id ) border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}</div>
        <map name="map-{$object.id}" id="map-{$object.id}">
        {$object.data_map.imagemap.content}
        </map>
    {else}
        <div class="attribute-image">{attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}</div>
    {/if}    

    {if $object.data_map.caption.has_content}
        {if is_set( $object.data_map.image.content[$object_parameters.size].width )}
            {def $image_width = $object.data_map.image.content[$object_parameters.size].width}
            {if is_set($object_parameters.margin_size)}{set $image_width = $image_width|sum(  $object_parameters.margin_size|mul( 2 ) )}{/if}
            {if is_set($object_parameters.border_size)}{set $image_width = $image_width|sum(  $object_parameters.border_size|mul( 2 ) )}{/if}
        <div class="attribute-caption" style="width: {$image_width}px">
        {else}
        <div class="attribute-caption">
        {/if}
            {attribute_view_gui attribute=$object.data_map.caption}
        </div>
    {/if}
    </div>
</div>
