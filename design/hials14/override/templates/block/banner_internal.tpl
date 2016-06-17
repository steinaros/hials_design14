{def $image_node = fetch( 'content', 'node', hash( 'node_id', $block.custom_attributes.image_node_id ) )
     $has_url = and( is_set( $block.custom_attributes.url ), ne( $block.custom_attributes.url, '' ) )}
<div class="block-type-banner-internal">
    {if $has_url}<a href="{$block.custom_attributes.url}" title="{$image_node.name|wash}">{/if}{attribute_view_gui attribute=$image_node.data_map.image image_class='banner_full' css_class='img-responsive'}{if $has_url}</a>{/if}
</div>
{undef $image_node $image $has_url}
