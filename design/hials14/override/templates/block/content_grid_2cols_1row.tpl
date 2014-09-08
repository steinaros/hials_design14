{def $valid_nodes = $block.valid_nodes}

<div class="block-type-content-grid block-view-{$block.view}">

    {if ne( $block.name, '' )}
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    {/if}

    <div class="hials-box-wrapper">
    {foreach $valid_nodes as $valid_node max 2}
        {set $color_selection = $valid_node.data_map.boxcolor.content.0}
        <!-- {$valid_node|attribute('show', 3, 'text')} -->
        {switch match=$color_selection}
        {case match=0}{set $color_class='hials-box-cell-white'}{/case}
        {case match=1}{set $color_class='hials-box-cell-gray'}{/case}
        {case match=2}{set $color_class='hials-box-cell-yellow'}{/case}
        {case match=3}{set $color_class='hials-box-cell-red'}{/case}
        {/switch}
        <div class="hials-box-cell-6 {$color_class}">
        {node_view_gui view='block_item' image_class='contentgrid' content_node=$valid_node}
        </div>
    {/foreach}
    </div>

</div>

{undef $valid_nodes $color_selection $color_class}
