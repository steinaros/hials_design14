{def $valid_nodes = $block.valid_nodes}
{def $box_width_class = "col-sm-6"}
{def $box_style_class = "boks-gray"}

<div class="block-type-itemlist boks {$box_width_class}">
    <div class="{$box_style_class}">
        <h3>{$block.name|wash()}</h3>
        {if $block.custom_attributes.desc|count()}<p>{$block.custom_attributes.desc|wash()}</p>{/if}
        <ul>
        {foreach $valid_nodes as $valid_node}
           <li><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name|wash()}</a></li>
        {/foreach}
        </ul>
    </div>
</div>
{undef $valid_nodes $box_width_class $box_style_class}
