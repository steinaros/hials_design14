{def $node = $block.valid_nodes[0]}
{def $color_selection = false()}
{def $color_class='bg-white'}

<div class="block-type-single-item row equal">
    <div class="container-sm-height wrapper">
        <div class="row-sm-height">
	        {set $color_selection = $node.data_map.boxcolor.content.0}
	        {switch match=$color_selection}
	        {case match=0}{set $color_class='bg-white'}{/case}
	        {case match=1}{set $color_class='bg-gray'}{/case}
	        {case match=2}{set $color_class='bg-red'}{/case}
	        {case match=3}{set $color_class='bg-yellow'}{/case}
	        {/switch}
	        <div class="col-sm-12 boks col-sm-height col-middle {$color_class}">
	        {node_view_gui view='block_item' content_node=$node}
	        </div>
	    </div>
	</div>
</div>

{undef $node $color_selection $color_class}
