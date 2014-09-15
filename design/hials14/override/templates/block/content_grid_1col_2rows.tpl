{def $valid_nodes = $block.valid_nodes}
{def $color_selection = false()}
{def $color_class='bg-white'}

<div class="block-type-content-grid block-view-{$block.view}">

    {foreach $valid_nodes as $valid_node max 2}
    <div class="row equal">
        {set $color_selection = $valid_node.data_map.boxcolor.content.0}
        {switch match=$color_selection}
	        {case match=0}{set $color_class='bg-white'}{/case}
	        {case match=1}{set $color_class='bg-gray'}{/case}
	        {case match=2}{set $color_class='bg-red'}{/case}
	        {case match=3}{set $color_class='bg-yellow'}{/case}
        {/switch}
        <div class="container-sm-height wrapper">
            <div class="row-sm-height">
		        <div class="col-sm-12 boks col-sm-height {$color_class}">
		        {node_view_gui view='block_item' image_class='contentgrid' content_node=$valid_node container_node=$container_node}
		        </div>
		    </div>
	    </div>
    </div>
    {delimiter}
    </div>
    <div class="row equal">
    {/delimiter}        
    {/foreach}
</div>

{undef $valid_nodes $color_selection $color_class}
