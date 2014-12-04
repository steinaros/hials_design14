{def $pagedata = ezpagedata()}
{def $menu_root = $pagedata.path_id_array[3]}
{def $leftmenu_class_filter = ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' )
     $menu_tree=fetch( content, tree, hash( parent_node_id, $menu_root,
                                          class_filter_type, 'include',
                                          class_filter_array, $leftmenu_class_filter,
                                          sort_by, $node.sort_array ) )
     $menu_root_node = fetch( content, node, hash( 'node_id', $menu_root ) )
     $item_class = array()}
<div class="leftmenu">
<!--
Menuroot: {$menu_root} {$pagedata.path_id_array.3}
{$menu_tree|attribute('show',2,'text')} 
-->
<div class="leftmenu-heading"><a href="{$menu_root_node.url_alias|ezurl( 'no' )}">{$menu_root_node.data_map.title.content|wash()}</a></div>
<div class="leftmenu-body">
<ul>
	{foreach $menu_tree as $item}
	   {set $item_class = array()}
	   {if eq($item.node_id, $pagedata.node_id)}{$item_class|append('active')}{/if}
	   {$item_class|append( concat( "level_", $item.depth ) )}
	<li class="{$item_class|implode(' ')}"><a href={$item.url_alias|ezurl}>{$item.name|wash()}</a></li>
	{/foreach}
</ul>
</div>
</div>
{undef $pagedata $menu_root $leftmenu_class_filter $tree_menu $menu_root_node $item_class}