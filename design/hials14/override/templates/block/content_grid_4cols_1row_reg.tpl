{def $valid_nodes = $block.valid_nodes}
{def $cell_class = 'col-sm-3 boks col-sm-height'}
{def $ant_bokser = 0}
{def $manglende_bokser = 0}

<div class="block-type-content-grid block-view-{$block.view}">
    <div class="row">
        <div class="container-sm-height colspacing">
            <div class="row-sm-height">
		    {foreach $valid_nodes as $valid_node max 4}
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
