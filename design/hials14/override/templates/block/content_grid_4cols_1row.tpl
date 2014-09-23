{def $valid_nodes = $block.valid_nodes
     $color_selection = false()
     $color_class='bg-white'
     $cell_class = false()
     $ant_bokser = 0
     $manglende_bokser = 0}

<div class="block-type-content-grid block-view-{$block.view}">
    <div class="row equal">
        <div class="container-sm-height height180 colspacing">
            <div class="row-sm-height">
		    {foreach $valid_nodes as $valid_node max 4}
		        {set $color_selection = $valid_node.data_map.boxcolor.content.0}
		        {switch match=$color_selection}
			        {case match=0}{set $color_class='bg-white'}{/case}
			        {case match=1}{set $color_class='bg-gray'}{/case}
			        {case match=2}{set $color_class='bg-red'}{/case}
			        {case match=3}{set $color_class='bg-yellow'}{/case}
		        {/switch}
		        {set $cell_class = concat('col-sm-3 boks col-sm-height ', $color_class)|trim}
		        {node_view_gui view='block_item' image_class='contentgrid' content_node=$valid_node container_node=$container_node css_class=$cell_class}
		    {/foreach}
		    {set $ant_bokser = $valid_nodes|count()}
		    {set $manglende_bokser = 4|sub($ant_bokser)}
		    {if lt($ant_bokser, 4)}
                {for 1 to $manglende_bokser as $counter}
                    <div class="col-sm-3 boks col-sm-height tom_boks">&nbsp;</div>
                {/for}
		    {/if}
		    </div>
		</div>
    </div>
</div>

{undef $valid_nodes $color_selection $color_class $cell_class $ant_bokser $manglende_bokser}
