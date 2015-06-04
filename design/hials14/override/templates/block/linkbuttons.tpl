{def $valid_nodes = $block.valid_nodes}
{def $no_valid_nodes = $valid_nodes|count()}
{def $button_width_class = concat('col-sm-', div(12, $no_valid_nodes) )}
{def $text = ''
     $url = ''
     $item_class = ''}

{if gt($no_valid_nodes, 0)}
<div class="hials-link-buttons">
    <ul class="nav nav-pills">
    {foreach $valid_nodes as $valid_node}
        {set $text = cond( $valid_node.data_map.tagheading.has_content, $valid_node.data_map.tagheading.content, $valid_node.name )}
        {if eq( $valid_node.class_name, "Link" )}
            {set $url = cond(is_set($valid_node.data_map.location.content), $valid_node.data_map.location.content, $valid_node.data_map.link.content)}
            {set $item_class = 'extLink'}
        {else}
            {set $url = $valid_node.url_alias|ezurl( 'no' )}
            {set $item_class = ''}
        {/if}
        <li role="presentation" class="{$button_width_class|wash} col-xs-12{if $item_class} {$item_class}{/if}"><a href="{$url}" title="{$text|wash()}"><span class="text">{$text|wash()}</span><span class="glyphicon glyphicon-chevron-right"></span></a></li>
    {/foreach}
    </ul>
</div>
{/if}
{undef $valid_nodes $button_width_class $no_valid_nodes $text $url $item_class}
