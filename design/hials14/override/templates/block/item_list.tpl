{def $valid_nodes = $block.valid_nodes}
{def $box_width_class = "col-sm-12"}
{def $box_style_class = "bg-darkgray"}

<div class="block-type-itemlist container-sm-height {$box_style_class}">
    <div class="{$box_width_class}">
        <h3>{$block.name|wash()}</h3>
        {if $block.custom_attributes.desc|count()}<p>{$block.custom_attributes.desc|wash()}</p>{/if}
        <ul>
        {foreach $valid_nodes as $valid_node}
           <li>{node_view_gui view='listitem' content_node=$valid_node}</li>
        {/foreach}
        </ul>
    </div>
</div>
{undef $valid_nodes $box_width_class $box_style_class}
