{def $node = $block.valid_nodes[0]}
{def $box_width_class = "col-sm-3"}
{def $box_style_class = "boks-white"}
{switch match=$block.custom_attributes.color}
    {case match='white'}{set $box_style_class = "boks-white"}{/case}
    {case match='gray'}{set $box_style_class = "boks-gray"}{/case}
{/switch}
{switch match=$block.view}
    {case match='2col'}{set $box_width_class = "col-sm-6"}{/case}
    {case match='default'}{set $box_width_class = "col-sm-3"}{/case}
{/switch}
<div class="block-type-single-item boks {$box_width_class}">
    <div class="{$box_style_class}">
    {node_view_gui view='block_item' content_node=$node}
    </div>
</div>
{undef $node}
