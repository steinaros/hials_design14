{* main_menu_item DEFAULT view *}
{if is_unset($css_class)}{def $css_class=false()}{/if}
{if is_unset($title)}{def $title=false()}{/if}
{def $tmpTitle = ''
     $tmpURL = ''
     $tmpClass = false()}
{if eq( $node.class_identifier, 'link')}
    {set $tmpURL = cond(is_set($node.data_map.location.content), $node.data_map.location.content, $node.data_map.link.content)}
    {if $css_class}{set $tmpClass = $css_class|append('extLink')}{else}{set $tmpClass = array('extLink')}{/if}
{else}
    {set $tmpURL = $node.url_alias|ezurl( 'no' )}
    {set $tmpClass = $css_class}
{/if}
{if $title}
    {set $tmpTitle = $title}
{else}
    {set $tmpTitle = cond($node.data_map.menutitle.has_content, $node.data_map.menutitle.content, $node.name)}
{/if}
<li{if $tmpClass} class="{$tmpClass|implode(" ")}"{/if}><a href="{if eq( $ui_context, 'browse' )}{concat("content/browse/", $node.node_id)|ezurl('no')}{else}{$tmpURL}{/if}" title="{$tmpTitle|wash()}">{$tmpTitle|wash()}</a></li>
{undef $tmpTitle $tmpURL}