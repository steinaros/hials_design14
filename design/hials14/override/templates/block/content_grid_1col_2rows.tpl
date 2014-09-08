{def $valid_nodes = $block.valid_nodes}
{def $color_selection = false()}
{def $color_class='hials-box-cell-white'}

<div class="block-type-content-grid block-view-{$block.view}">

    {if ne( $block.name, '' )}
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    {/if}

    {foreach $valid_nodes as $valid_node max 2}
    <div class="hials-box-wrapper">
        {set $color_selection = $valid_node.data_map.boxcolor.content.0}
        {switch match=$color_selection}
        {case match=0}{set $color_class='hials-box-cell-white'}{/case}
        {case match=1}{set $color_class='hials-box-cell-gray'}{/case}
        {case match=2}{set $color_class='hials-box-cell-yellow'}{/case}
        {case match=3}{set $color_class='hials-box-cell-red'}{/case}
        {/switch}
        <div class="hials-box-cell-12 {$color_class}">
        {node_view_gui view='block_item' image_class='contentgrid' content_node=$valid_node container_node=$container_node}
        </div>
    </div>
    {/foreach}
</div>

{undef $valid_nodes $color_selection $color_class}
