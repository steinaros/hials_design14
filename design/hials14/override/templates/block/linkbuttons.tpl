{def $valid_nodes = $block.valid_nodes}
{def $no_valid_nodes = $valid_nodes|count()}
{def $button_width_class = concat('col-sm-', div(12, $no_valid_nodes) )}

{if gt($no_valid_nodes, 0)}
<div class="hials-link-buttons">
    <ul class="nav nav-pills">
    {foreach $valid_nodes as $valid_node}
        <li role="presentation" class="{$button_width_class|wash} col-xs-12"><a href={$valid_node.url_alias|ezurl} title="{$valid_node.data_map.tagline.content|wash()}"><span class="text">{$valid_node.data_map.tagline.content|wash()}</span><span class="glyphicon glyphicon-chevron-right"></span></a></li>
    {/foreach}
    </ul>
</div>
{/if}
{undef $valid_nodes $button_width_class $no_valid_nodes}
