{def $menu_root = $node.path_array[4]}
{def $leftmenu_class_filter = ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' )
     $menu_root_node = fetch( content, node, hash( 'node_id', $menu_root ) )
     $menu_tree=fetch( content, tree, hash( parent_node_id, $menu_root,
                                          class_filter_type, 'include',
                                          class_filter_array, $leftmenu_class_filter,
                                          sort_by, $menu_root_node.sort_array ) )
     $item_class = array()
     $selected_node_path_array = array()
     $prev_node_depth = 10000}
{foreach $menu_tree as $item}
    {if eq($item.node_id, $node.node_id)}
        {$selected_node_path_array = $item.path_array()}
        {break}
    {/if}
{/foreach}     
     
<div class="leftmenu">
<!--
Selected_path: {$selected_node_path_array|attribute('show',2,'text')}
Menuroot: {$menu_root} 
Node_path: {$node.path_array|attribute('show',2,'text')}
{$menu_tree|attribute('show',2,'text')} 
-->
<div class="leftmenu-heading"><a href="{$menu_root_node.url_alias|ezurl( 'no' )}">{$menu_root_node.data_map.title.content|wash()}</a></div>
<div class="leftmenu-body">
<ul>
	{foreach $menu_tree as $item}
	   {set $item_class = array()}
	   {if eq($item.node_id, $node.node_id)}{set $item_class = $item_class|append('active')}{/if}
	   {if gt($item.children_count, 0)}{set $item_class = $item_class|append('hasSubitems')}{/if}
	   {set $item_class = $item_class|append( concat( "level_", $item.depth ) )}
	<li {if $item_class|count()}class="{$item_class|implode(' ')}{/if}"><a href={$item.url_alias|ezurl}>{$item.name|wash()}</a>
	   {* if $selected_node_path_array|contains( $item.node_id )}
	       <ul>
	   {else *}
	       </li>
	   {*/if*}
	{/foreach}
</ul>
</div>
</div>
{undef $pagedata $menu_root $leftmenu_class_filter $tree_menu $menu_root_node $item_class}