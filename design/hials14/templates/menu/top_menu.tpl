<!-- Top menu content: START -->
{def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )
     $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
     $top_menu_utdanning_class_filter = ezini( 'MenuContentSettings', 'UtdanningSubMenuIdentifierList', 'menu.ini' )
     $top_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
                                                       'sort_by', $root_node.sort_array,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', $top_menu_class_filter ) )
     $top_menu_items_count = $top_menu_items|count()
     $item_class = array()
     $level2_items = 0
     $level2_items_count = 0
     $level3_items = 0
     $level3_items_count = 0
     $UTDANNING_node_id = ezini( 'HialsContentNodeIDs', 'UtdanningRoot', 'hials.ini' )
     $FORSKNING_node_id = ezini( 'HialsContentNodeIDs', 'ForskningRoot', 'hials.ini' )
     $temp_items = array()
     $tmp_itemTitle = ''} {* Utdanning/Forskning submenu needs special treatment *}
 
{if $top_menu_items_count}
<div id="navbar-collapse-grid" class="navbar-collapse collapse">     
    <ul class="nav navbar-nav">
    {foreach $top_menu_items as $key => $item}
		{set $item_class = array()}
		{if eq($item.node_id, $UTDANNING_node_id)}
            {set $level2_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                          'sort_by', $item.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $top_menu_utdanning_class_filter ) )}
		{else}
            {set $level2_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
			                                              'sort_by', $item.sort_array,
			                                              'class_filter_type', 'include',
			                                              'class_filter_array', $top_menu_class_filter ) )}
        {/if}
		{set $level2_items_count = $level2_items|count()}
        {if $level2_items_count|ne(0)}
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
		<li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}" class="menu-item-link" rel={$item.url_alias|ezurl}><span class="topmenuitem-wrapper">{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</span></a></li>
		{else}
		<li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} data-target="#" data-toggle="dropdown" class="dropdown-toggle"><span class="topmenuitem-wrapper">{$item.name|wash()}</span></a>
		    {if $level2_items_count}
                {switch match=$item.node_id}
                    {case match=$FORSKNING_node_id}
                        {set $temp_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                                           'sort_by', $item.sort_array,
                                                                           'class_filter_type', 'include',
                                                                           'class_filter_array', array( 'hials_avdeling' ) ) )}
                        <ul class="dropdown-menu">
                            {include uri='design:menu/top_menu_submenu_nav_links.tpl' menuitem=$item}
                            <li>
                                <div class="col-sm-offset-2 col-sm-3">
                                    <ul class="submenu">
                                    <li class="submenuhead"><a href={$item.url_alias|ezurl()}>{'Departments'|i18n('hials/design/std')}</a></li>
                                    {foreach $temp_items as $avd_item}
                                        <li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $avd_item.node_id)|ezurl}{else}{$avd_item.url_alias|ezurl}{/if}>{$avd_item.name|wash()}</a></li>
                                    {/foreach}
                                    </ul>
                                </div>
                                {foreach $level2_items as $level2key => $level2item}
                                    <div class="col-sm-2">
                                    <ul class="submenu">
                                        <li class="submenuhead"><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $level2item.node_id)|ezurl}{else}{$level2item.url_alias|ezurl}{/if} title="{$level2item.name|wash()}">{$level2item.name|wash()}</a></li>
                                    {set $level3_items = fetch( 'content', 'list', hash( 'parent_node_id', $level2item.node_id,
                                                                  'sort_by', $level2item.sort_array,
                                                                  'class_filter_type', 'include',
                                                                  'class_filter_array', $top_menu_class_filter ) )
                                         $level3_items_count = $level3_items|count()}
                                    {if $level3_items_count}
                                        {foreach $level3_items as $level3key => $level3item}
                                            <li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $level3item.node_id)|ezurl}{else}{$level3item.url_alias|ezurl}{/if} title="{$level3item.name|wash()}">{$level3item.name|wash()}</a></li>
                                        {/foreach}
                                    {/if}
                                    </ul>
                                </div>                                
                                {/foreach}
                            </li>
                        </ul>
                    {/case}
                    {case match=$UTDANNING_node_id}
                        <ul class="dropdown-menu">
                            {include uri='design:menu/top_menu_submenu_nav_links.tpl' menuitem=$item}
                            <li id="utdanning_tabs" class="hidden-xs">{include uri='design:menu/top_menu_utdanning.tpl' menunode=$UTDANNING_node_id}</li>
                        </ul>                    
                    {/case}
                    {case}
				        <ul class="dropdown-menu">
				            {include uri='design:menu/top_menu_submenu_nav_links.tpl' menuitem=$item}
				            <li>{foreach $level2_items as $level2key => $level2item}
				                <div class="{if $level2key|eq(0)}col-sm-offset-2 col-sm-2{else}col-sm-2{/if}">
				                    <ul class="submenu">
				                        {set $tmp_itemTitle = cond($level2item.data_map.menutitle.has_content, $level2item.data_map.menutitle.content, $level2item.name)}
				                        <li class="submenuhead"><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $level2item.node_id)|ezurl}{else}{$level2item.url_alias|ezurl}{/if} title="{$tmp_itemTitle|wash()}">{$tmp_itemTitle|wash()}</a></li>
				                    {set $level3_items = fetch( 'content', 'list', hash( 'parent_node_id', $level2item.node_id,
					                                              'sort_by', $level2item.sort_array,
					                                              'class_filter_type', 'include',
					                                              'class_filter_array', $top_menu_class_filter ) )
					 					 $level3_items_count = $level3_items|count()}
		                            {if $level3_items_count}
		                                {foreach $level3_items as $level3key => $level3item}
                                            {set $tmp_itemTitle = cond($level3item.data_map.menutitle.has_content, $level3item.data_map.menutitle.content, $level3item.name)} 
		                                    <li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $level3item.node_id)|ezurl}{else}{$level3item.url_alias|ezurl}{/if} title="{$tmp_itemTitle|wash()}">{$tmp_itemTitle|wash()}</a></li>
		                                {/foreach}
		                            {/if}
		                            </ul>
		                        </div>
				            {/foreach}</li>
				        </ul>
			        {/case}
		        {/switch}
		    {else}
                <ul class="dropdown-menu">
                    {include uri='design:menu/top_menu_submenu_nav_links.tpl' menuitem=$item}
                </ul>
		    {/if}
		</li>
		{/if}
	{/foreach}
    </ul>
</div>
{/if}
{undef $level2_items $level2_items_count $level3_items $level3_items_count $root_node $top_menu_items $item_class $top_menu_items_count $UTDANNING_node_id}
<!-- Top menu content: END -->
