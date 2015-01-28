{if ezini_hasvariable( 'HialsMenuSettings', 'RootIndex', 'hials.ini' )}
    {def $menu_root_index = ezini( 'HialsMenuSettings', 'RootIndex', 'hials.ini' )}
{else}
    {def $menu_root_index = 4} 
{/if}
{def $menu_root = 0}
{set $menu_root = $node.path_array[$menu_root_index]}
{def $leftmenu_class_filter = ezini( 'MenuContentSettings', 'LeftIdentifierList', 'hials.ini' )}
{def $menu_root_node = fetch( 'content', 'node', hash( 'node_id', $menu_root ) )}
{def $current_node=$node}
{def $selected_node_path_array = $node.path_array}
{if not($leftmenu_class_filter|contains( $node.class_identifier ) )}
    {set $current_node=$node.parent}
{/if}
<nav id="secondary_menu" class="leftmenu hidden-print" role="navigation">
<div class="leftmenu-heading"><a href="{$menu_root_node.url_alias|ezurl( 'no' )}">{$menu_root_node.name|wash()}</a></div>
<div class="leftmenu-body">
{include uri='design:menu/leftmenu_sub.tpl' name=concat('leftsubmenu', $menu_root_node.depth) 
                                            current_node=$current_node 
                                            root_item=$menu_root_node 
                                            selected_path=$selected_node_path_array 
                                            class_filter=$leftmenu_class_filter}
</div>
</nav>
{undef $menu_root $leftmenu_class_filter $menu_root_node $selected_node_path_array $current_node}
