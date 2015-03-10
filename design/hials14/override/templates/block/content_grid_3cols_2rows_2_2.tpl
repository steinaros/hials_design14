{def $valid_nodes = $block.valid_nodes}
{def $cell_class = false()}
{def $item1_image = array()}
{if $valid_nodes.1.data_map.image.has_content}
    {set $item1_image = $valid_nodes.1.data_map.image}
{elseif $valid_nodes.1.data_map.banner.has_content}
    {def $banner = fetch( 'content', 'object', hash( 'object_id', $valid_nodes.1.data_map.banner.content.relation_list.0.contentobject_id ) )}
    {set $item1_image = $banner.data_map.image}
{/if}
<div class="block-type-content-grid block-view-{$block.view}">
	<div class="container-sm-height hv-borderspacing">
	    <div class="row-sm-height">
            {node_view_gui view='block_item_simple' image_class='contentgrid' content_node=$valid_nodes[0] css_class="col-sm-6 col-sm-height bg-red height180-responsive col-middle text-center h3 block_item_simple"}
	        <div class="col-sm-3 col-sm-height bg-white nopadding height180-responsive">{attribute_view_gui attribute=$item1_image image_class=boximage css_class=img-responsive}</div>
	        {node_view_gui view='block_item_simple' content_node=$valid_nodes[1] css_class="col-sm-3 col-sm-height col-middle text-center bg-white h3 block_item_simple"}
	    </div>
	    {if gt($valid_nodes|count(), 2)}
	    <div class="row-sm-height">
            <div class="col-sm-6 col-sm-height hidden-xs"></div>
            {node_view_gui view='block_item_simple' content_node=$valid_nodes[2] css_class="col-sm-3 col-sm-height col-middle text-center bg-darkgray height180-responsive h3 block_item_simple"}
            {if gt($valid_nodes|count(), 3)}{node_view_gui view='block_item_simple' content_node=$valid_nodes[3] css_class="col-sm-3 col-sm-height col-middle text-center bg-darkgray h3 block_item_simple"}{/if}
	    </div>
	    {/if}
	</div>
</div>
{undef $valid_nodes $cell_class}