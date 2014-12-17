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
<!--
Root_item: {$root_item|attribute('show',2,'text')}
selected_path: {$selected_path|attribute('show',2,'text')}
class_filter: {$class_filter|attribute('show',2,'text')}
current_node: {$current_node|attribute('show',2,'text')}
submenu: {$submenu|attribute('show',2,'text')}
-->
{foreach $submenu as $item}
    {set $item_class = array()}
    {set $item_class = $item_class|append( concat( "level_", $item.depth ) )}
    {if eq( $item.class_name, "Link" )}
        {set $item_class = $item_class|append( 'extLink' ) }
        {set $item_url = $item.data_map.location.content}
        {set $item_text = $item.data_map.name.content}
    {else}
        {set $item_url = $item.url_alias|ezurl( 'no' )}
        {set $item_text = cond($item.data_map.title.has_content, $item.data_map.title.content, $item.name )}
    {/if}
    {if eq($item.node_id, $current_node.node_id)}{set $item_class = $item_class|append('active')}{/if}
    {if gt($item.children_count, 0)}
        {set $subitem_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $item.node_id,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', $class_filter ) ) }
        {if $subitem_count}
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
        {/if}
    {else}
        <li {if $item_class|count()}class="{$item_class|implode(' ')}{/if}"><a href="{$item_url}">{$item_text|wash()}</a></li>
    {/if}
{/foreach}
</ul>