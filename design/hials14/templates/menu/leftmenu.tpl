{def $menu_root = $node.path_array[4]}
{def $leftmenu_class_filter = ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' )
     $menu_root_node = fetch( 'content', 'node', hash( 'node_id', $menu_root ) )}

{def $menu_tree=fetch( 'content', 'tree', hash( 'parent_node_id', $menu_root,
                                          'class_filter_type', 'include',
                                          'class_filter_array', $leftmenu_class_filter ) ) }
{foreach $menu_tree as $item}
    {if eq($item.node_id, $node.node_id)}
        {def $selected_node_path_array = $item.path_array}
        {break}
    {/if}
{/foreach}
{if is_unset($selected_node_path_array)}{def $selected_node_path_array = array()}{/if}
     
<div class="leftmenu">
<div class="leftmenu-heading"><a href="{$menu_root_node.url_alias|ezurl( 'no' )}">{$menu_root_node.data_map.title.content|wash()}</a></div>
<div class="leftmenu-body">
{include uri='design:menu/leftmenu_sub.tpl' name=concat('leftsubmenu', $menu_root_node.depth) 
                                            current_node=$node 
                                            root_item=$menu_root_node 
                                            selected_path=$selected_node_path_array 
                                            class_filter=$leftmenu_class_filter}
</div>
</div>
{undef $pagedata $menu_root $leftmenu_class_filter $tree_menu $menu_root_node $item_class $selected_node_path_array}
