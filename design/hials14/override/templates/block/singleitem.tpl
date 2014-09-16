{def $node = $block.valid_nodes[0]}
{def $color_selection = false()}
{def $color_class='bg-white'}
{def $cell_class = false()}

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
	        {set $cell_class = concat('col-sm-12 boks col-sm-height', ' ', $color_class)} 
	        {node_view_gui view='block_item' content_node=$node container_node=$container_node css_class=$cell_class}      
	    </div>
	</div>
</div>

{undef $node $color_selection $color_class}
