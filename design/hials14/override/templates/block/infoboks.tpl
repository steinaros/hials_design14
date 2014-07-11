{def $box_width_class = "col-sm-3"}
{def $box_style_class = "box-white"}
{switch match=$block.custom_attributes.width}
    {case match='1_col'}{set $box_width_class = "col-sm-3"}{/case}
    {case match='2_col'}{set $box_width_class = "col-sm-6"}{/case}
{/switch}
{switch match=$block.custom_attributes.color}
    {case match='white'}{set $box_style_class = "box-white"}{/case}
    {case match='gray'}{set $box_style_class = "box-gray"}{/case}
{/switch}

<div class="block-type-infoboks {$box_width_class} {$box_style_class}">
    <h3>{$block.name|wash()}</h3>
    <dl>
        <dt>Opptakskrav:</dt><dd>{attribute_view_gui attribute=$container_node.data_map.opptakskrav }</dd>
        <dt>S&oslash;knadsfrist:</dt><dd>{$container_node.data_map.soknadsfrist.content|wash()}</dd>
        <dt>Studiepoeng:</dt><dd>{$container_node.data_map.cdm_studiepoeng.content|wash()}</dd>
    </dl>
</div>