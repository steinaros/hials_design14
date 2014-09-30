<!-- Top menu content: START -->
{def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )
     $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
     $top_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
                                                       'sort_by', $root_node.sort_array,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', $top_menu_class_filter ) )
     $top_menu_items_count = $top_menu_items|count()
     $item_class = array()
     $sub_items = 0
     $sub_items_count = 0
     $current_node_in_path = first_set($pagedata.path_array[1].node_id, 0  )
     $current_node_in_path_2 = first_set($pagedata.path_array[2].node_id, 0  )
     $UTDANNING_node_id = 65} {* Utdanning submenu needs special treatment *}
<div class="col-sm-8">
    {if $top_menu_items_count}
        <nav id="mainmenu" class="navbar-collapse collapse yamm">
            <ul class="nav navbar-nav">
            {foreach $top_menu_items as $key => $item}
				{set $item_class = array()
					 $sub_items = fetch( 'content', 'tree', hash( 'parent_node_id', $item.node_id,
					                                              'sort_by', $item.sort_array,
					                                              'depth', 1,
					                                              'class_filter_type', 'include',
					                                              'class_filter_array', $top_menu_class_filter ) )
					 $sub_items_count = $sub_items|count()}
                {if $sub_items_count|ne(0)}
                    {set $item_class = $item_class|append("dropdown yamm-fw")}
                {/if}					 
				{if $key|eq(0)}
                    {set $item_class = $item_class|append("firstli")}
				{/if}
				{if $top_menu_items_count|eq( $key|inc )}
                    {set $item_class = $item_class|append("lastli")}
				{/if}
				{if $item.node_id|eq( $current_node_id )}
    				{set $item_class = $item_class|append("current")}
				{/if}
				{if eq( $item.class_identifier, 'link')}
				<li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}" class="menu-item-link" rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a></li>
				{else}
				<li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}{if $sub_items_count} data-target="#" data-toggle="dropdown" class="dropdown-toggle"{/if}>{$item.name|wash()}</a>
				    {if and($sub_items_count,ne($item.node_id, $UTDANNING_node_id))}
				        <ul class="dropdown-menu">
				            <li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}>{'Directly to'|i18n('hials/design/menu')} {$item.name|wash()}</a></li>
				            <li><div class="row">{foreach $sub_items as $subkey => $subitem}
				                <div class="{if $subkey|eq(0)}col-sm-offset-2 col-sm-2{else}col-sm-2{/if}">
				                    <ul>
				                        <li class="submenuhead"><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $subitem.node_id)|ezurl}{else}{$subitem.url_alias|ezurl}{/if}>{$subitem.name|wash()}</a></li>
                                    {if $subitem.children|count()}
                                        {foreach $subitem.children as $sub2key => $sub2item}
                                            <li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $sub2item.node_id)|ezurl}{else}{$sub2item.url_alias|ezurl}{/if}>{$sub2item.name|wash()}</a></li>
                                        {/foreach}
                                    {/if}
                                    </ul>
                                </div>
				            {/foreach}</div></li>
				        </ul>
				    {elseif ne($item.node_id, $UTDANNING_node_id)}
                        <ul class="dropdown-menu">
                            <li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}>{'Directly to'|i18n('hials/design/menu')} {$item.name|wash()}</a></li>
                        </ul>
				    {/if}
				</li>
				{/if}
			{/foreach}
	    </ul>
	</nav>
	{/if}
</div>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainmenu">
    <span class="sr-only">Toggle</span><i class="fa fa-bars fa-2x"></i>
</button>
{undef $sub_items $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path $current_node_in_path_2 $UTDANNING_node_id $sub_items_count}
<!-- Top menu content: END -->
