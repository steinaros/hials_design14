{def $valid_nodes = $block.valid_nodes}
{def $item1_image = array()}
{def $item2_image = array()}
{def $banner = array()}
{if $valid_nodes.1.data_map.image.has_content}
    {set $item1_image = $valid_nodes.1.data_map.image}
{elseif $valid_nodes.1.data_map.banner.has_content}
    {set $banner = fetch( 'content', 'object', hash( 'object_id', $valid_nodes.1.data_map.banner.content.relation_list.0.contentobject_id ) )}
    {set $item1_image = $banner.data_map.image}
{/if}
{if $valid_nodes.2.data_map.image.has_content}
    {set $item2_image = $valid_nodes.2.data_map.image}
{elseif $valid_nodes.2.data_map.banner.has_content}
    {set $banner = fetch( 'content', 'object', hash( 'object_id', $valid_nodes.2.data_map.banner.content.relation_list.0.contentobject_id ) )}
    {set $item2_image = $banner.data_map.image}
{/if}
<div class="block-type-content-grid block-view-{$block.view}">
	<div class="container-sm-height hv-borderspacing">
	    <div class="row-sm-height">
            {node_view_gui view='block_item_simple' content_node=$valid_nodes[0] css_class="col-sm-6 col-sm-height bg-red height180-responsive col-middle text-center h3 block_item_simple"}
	        <div class="col-sm-3 col-sm-height nopadding bg-white">{attribute_view_gui attribute=$item1_image image_class=boximage css_class=img-responsive}</div>
	        <div class="col-sm-3 col-sm-height nopadding bg-white">{attribute_view_gui attribute=$item2_image image_class=boximage css_class=img-responsive}</div>
	    </div>
	    <div class="row-sm-height">
            <div class="col-sm-6 col-sm-height hidden-xs"></div>
            {node_view_gui view='block_item_simple' content_node=$valid_nodes[1] css_class="col-sm-3 col-sm-height col-middle text-center bg-white height180-responsive h3 block_item_simple"}
	        {node_view_gui view='block_item_simple' content_node=$valid_nodes[2] css_class="col-sm-3 col-sm-height col-middle text-center bg-white h3 block_item_simple"}
	    </div>
	</div>
</div>
{undef $valid_nodes}