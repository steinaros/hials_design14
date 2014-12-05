{def $menu_root = $node.path_array[4]}
{def $leftmenu_class_filter = ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' )
     $menu_root_node = fetch( 'content', 'node', hash( 'node_id', $menu_root ) )}

{def $menu_tree=fetch( 'content', 'tree', hash( 'parent_node_id', $menu_root,
                                          'class_filter_type', 'include',
                                          'class_filter_array', $leftmenu_class_filter ) ) }
{def $item_class = array()
     $selected_node_path_array = array()
     $prev_node_depth = 10000
     $item_url = ''}
{foreach $menu_tree as $item}
    {if eq($item.node_id, $node.node_id)}
        {set $selected_node_path_array = $selected_node_path_array|merge($item.path_array())}
        {break}
    {/if}
{/foreach}

{def $menu_level1 = fetch( 'content', 'list', hash( 'parent_node_id', $menu_root,
                                                    'depth', 1,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', $leftmenu_class_filter,
                                                    'sort_by', $menu_root_node.sort_array ) ) }
     
<div class="leftmenu">
<!--
Sort: {$menu_root_node.sort_array|attribute('show',2,'text')}
Selected_path: {$selected_node_path_array|attribute('show',2,'text')}
Menuroot: {$menu_root} 
Node_path: {$node.path_array|attribute('show',2,'text')}
{$menu_tree|attribute('show',2,'text')} 
-->
<div class="leftmenu-heading"><a href="{$menu_root_node.url_alias|ezurl( 'no' )}">{$menu_root_node.data_map.title.content|wash()}</a></div>
<div class="leftmenu-body">
<ul>
{foreach $menu_level1 as $item}
    {set $item_class = array()}
    {set $item_class = $item_class|append( concat( "level_", $item.depth ) )}
    {if eq( $item.class_name, "Link" )}
        {set $item_class = $item_class|append( 'extLink' ) )}
        {set $item_url = $item.data_map.link.content}
    {else}
        {set $item_url = $item.url_alias}
    {/if}
    {if eq($item.node_id, $node.node_id)}{set $item_class = $item_class|append('active')}{/if}
    {if gt($item.children_count, 0)}
        {set $item_class = $item_class|append('hasSubitems')}
        <li {if $item_class|count()}class="{$item_class|implode(' ')}{/if}"><a href={$item_url|ezurl}>{$item.data_map.title.content|wash()}</a>
        {if $selected_node_path_array|contains($item.node_id)}
            <!-- SUBMENU HERE -->
        {/if}
        </li>
    {else}
        <li {if $item_class|count()}class="{$item_class|implode(' ')}{/if}"><a href={$item_url|ezurl}>{$item.data_map.title.content|wash()}</a>
    {/if}
{/foreach}
{/if}
</ul>
</div>
</div>
{undef $pagedata $menu_root $leftmenu_class_filter $tree_menu $menu_root_node $item_class $selected_node_path_array $prev_node_depth $menu_level1}


{* 
    {if $prev_node_depth|eq($item.depth)}
    </li>
    {elseif $prev_node_depth|lt($item.depth)}
    <ul>
    {elseif and($prev_node_depth|gt($item.depth), $prev_node_depth|lt(10))}
    </li>
        {while $prev_node_depth|gt($item.depth)}
        </ul></li>
            {set $prev_node_depth=dec($prev_node_depth)}
        {/while}
    {/if}
    {set $prev_node_depth=$item.depth}
    
    </li>
{if and($prev_node_depth|gt($menu_root_node.depth), $prev_node_depth|lt(10))}
{while $prev_node_depth|gt($menu_root_node.depth)}
    </ul></li>
    {set $prev_node_depth=dec($prev_node_depth)}
{/while}
    
*}