{def $valid_nodes = $block.valid_nodes}
{def $color_selection = false()}
{def $color_class='bg-white'}
{def $cell_class = false()}
{def $rowheight = 'height180'}
<div class="block-type-content-grid block-view-{$block.view}">
    {foreach $valid_nodes as $valid_node max 2}
    <div class="row">
        {set $color_selection = $valid_node.data_map.boxcolor.content.0}
        {switch match=$color_selection}
	        {case match=0}{set $color_class='bg-white'}{/case}
	        {case match=1}{set $color_class='bg-darkgray'}{/case}
	        {case match=2}{set $color_class='bg-red'}{/case}
	        {case match=3}{set $color_class='bg-yellow'}{/case}
        {/switch}
        {if eq($valid_node.class_identifier, 'hials_calltoaction')}{set $rowheight = 'height90'}{else}{set $rowheight = 'height180'}{/if}
        <div class="container-sm-height {$rowheight} wrapper">
            <div class="row-sm-height">
                {set $cell_class = concat('col-sm-12 boks col-sm-height', ' ', $color_class)}
		        {node_view_gui view='block_item' image_class='contentgrid' content_node=$valid_node container_node=$container_node css_class=$cell_class}
		    </div>
	    </div>
    </div>
    {set $cell_class = false()}
    {/foreach}
</div>
{undef $valid_nodes $color_selection $color_class $cell_class}
