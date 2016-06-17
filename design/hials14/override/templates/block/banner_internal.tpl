{def $image_node = fetch( 'content', 'node', hash( 'node_id', $block.custom_attributes.image_node_id ) )
     $image = $image_node.data_map.image.content['banner']
     $has_url = and( is_set( $block.custom_attributes.url ), ne( $block.custom_attributes.url, '' ) )}
<!--
Image_node: {$image_node|attribute('show','text')}
Image: {$image|attribute('show','text')}
has_url: {$has_url}
-->
<div class="block-type-banner-internal">
    {if $has_url}<a href="{$block.custom_attributes.url}" title="{$image_node.name|wash}">{/if}{attribute_view_gui attribute=$node.data_map.image image_class='banner_full' css_class='img-responsive'}{if $has_url}</a>{/if}
</div>
{undef $image_node $image $has_url}
