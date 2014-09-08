{def $node = $block.valid_nodes[0]}
{def $color_selection = false()}
{def $color_class='hials-box-cell-white'}

    <div class="block-type-single-item hials-box-wrapper">
        {set $color_selection = $node.data_map.boxcolor.content.0}
        {switch match=$color_selection}
        {case match=0}{set $color_class='hials-box-cell-white'}{/case}
        {case match=1}{set $color_class='hials-box-cell-gray'}{/case}
        {case match=2}{set $color_class='hials-box-cell-yellow'}{/case}
        {case match=3}{set $color_class='hials-box-cell-red'}{/case}
        {/switch}
        <div class="hials-box-cell-12 {$color_class}">
        {node_view_gui view='block_item' content_node=$node}
        </div>
    </div>

{undef $node $color_selection $color_class}
