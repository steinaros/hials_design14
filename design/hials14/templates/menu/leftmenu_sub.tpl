{if is_unset($root_item)}{def $root_item = array()}{/if}
{if is_unset($selected_path)}{def $selected_path = array()}{/if}
{if is_unset($class_filter)}{def $class_filter = array()}{/if}
{if is_unset($current_node)}{def $current_node = array()}{/if}

{def $submenu = fetch( 'content', 'list', hash( 'parent_node_id', $root_item.node_id,
                                                'depth', 1,
                                                'class_filter_type', 'include',
                                                'class_filter_array', $class_filter,
                                                'sort_by', $root_item.sort_array ) ) }
                                                
{def $item_class = array()
     $item_url = ''
     $item_text = ''
     $subitem_count = 0}
<ul>
{foreach $submenu as $item}
    {set $item_class = array()}
    {set $item_class = $item_class|append( concat( "level_", $item.depth ) )}
    {* SHB: skip "nettvisning" systemmappe *}
    {if and(eq($item.class_identifier, "systemmappe"), eq($item.data_map.identifier.content, "nettvisning"))}{continue}{/if}
    {if eq( $item.class_name, "Link" )}
        {set $item_class = $item_class|append( 'extLink' ) }
        {* cond because we have different "Link" classes in WWW and SHB/KHB installations *}
        {set $item_url = cond(is_set($item.data_map.location.content), $item.data_map.location.content, $item.data_map.link.content)}
        {set $item_text = cond(is_set($item.data_map.name.content), $item.data_map.name.content, $item.data_map.title.content)}
    {else}
        {set $item_url = $item.url_alias|ezurl( 'no' )}
        {set $item_text = cond($item.data_map.title.has_content, $item.data_map.title.content, $item.name )}
    {/if}
    {if eq($item.node_id, $current_node.node_id)}{set $item_class = $item_class|append('active')}{/if}
    {if gt($item.children_count, 0)}
        {* Get filtered count - only children of correct contenttypes *}
        {set $subitem_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $item.node_id,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', $class_filter ) ) }
        {if gt($subitem_count, 0)}
            {set $item_class = $item_class|append('hasSubitems')}
            <li {if $item_class|count()}class="{$item_class|implode(' ')}{/if}"><a href="{$item_url}">{$item_text|wash()}</a>
            
            {if $selected_path|contains($item.node_id)}
                {include uri='design:menu/leftmenu_sub.tpl' name=concat('leftsubmenu', $item.depth) 
                                                            current_node=$current_node
                                                            root_item=$item
                                                            selected_path=$selected_path
                                                            class_filter=$class_filter}
            {/if}
            </li>
        {else}
            <li {if $item_class|count()}class="{$item_class|implode(' ')}{/if}"><a href="{$item_url}">{$item_text|wash()}</a></li>
        {/if}
    {elseif not($item.class_identifier|compare('hials_nyhetsmappe'))} {* Don't show empty nyhetsmappe *}
        <li {if $item_class|count()}class="{$item_class|implode(' ')}{/if}"><a href="{$item_url}">{$item_text|wash()}</a></li>
    {/if}
{/foreach}
</ul>