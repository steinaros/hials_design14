{if not(is_set($menunode))}{def $menunode = 0}{/if}
{def $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '5', '2', '6', '4', '3')
     $nivaa_names = hash( 0, 'Bachelor', 1, 'Master', 2, 'Videreutdanning', 3, 'Kurs', 4, 'Maritime kurs', 5, 'Årsstudium', 6, 'Enkeltemne' )
     $utdanninger = array()
     $utdanning_width = array()
     $utd_category = array()
     $tmp_utd = hash()
     $extra_space = 0
     
     $col_width = 2
     $nivaa_item_count = 0
     $tmp_items = array()
     $tmp_item_count = 0
     $tmp_width = 0
     
     $tmp_hash = hash()
     $tmp_fagomrade = array()
     
     $tmp_itemTitle = ''}

{* $utd_category er enten fagområde (norsk) eller utdanningsnivå (engelsk) *}

<!--
Sortorder: {$nivaa_sortorder|attribute('show', 2, 'text')}
-->

{set $utd_category = fetch( 'content', 'list', hash( 'parent_node_id', $menunode,
                                                    'sort_by', array( 'attribute', true(), 315 ),
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'hials_fagomrade' ) ) )}
{if eq($utd_category|count(), 0)}
	
	{* English menu *}
	
	{set $utd_category = fetch( 'content', 'list', hash( 'parent_node_id', $menunode,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'hials_utdanningsniva' ) ) )}
	{foreach $utd_category as $key => $nivaa}
		<div class="{if $key|eq(0)}col-sm-offset-2 col-sm-2{else}col-sm-2{/if}">
			<ul class="submenu">
			{set $tmp_itemTitle = cond($nivaa.data_map.menutitle.has_content, $nivaa.data_map.menutitle.content, $nivaa.name)}
				<li class="submenuhead"><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $nivaa.node_id)|ezurl}{else}{$nivaa.url_alias|ezurl}{/if} title="{$tmp_itemTitle|wash()}">{$tmp_itemTitle|wash()}</a></li>
                {set $tmp_items = fetch( 'content', 'list', hash( 'parent_node_id', $level2item.node_id,
                                         'sort_by', $level2item.sort_array,
                                         'class_filter_type', 'include',
                                         'class_filter_array', $classes ) )}
				{if gt($tmp_items|count(), 0)}
					{foreach $tmp_items as $level3key => $level3item}
                    	{set $tmp_itemTitle = cond($level3item.data_map.menutitle.has_content, $level3item.data_map.menutitle.content, $level3item.name)} 
						<li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $level3item.node_id)|ezurl}{else}{$level3item.url_alias|ezurl}{/if} title="{$tmp_itemTitle|wash()}">{$tmp_itemTitle|wash()}</a></li>
					{/foreach}
				{/if}
			</ul>
		</div>
	{/foreach}
{else}

	{* Norwegian menu *}

	{foreach $nivaa_names as $nivaa_id => $nivaa_name}
	    {set $nivaa_item_count = 0}
	    {set $tmp_fagomrade = array()}
	    {set $tmp_utd = hash()}
	    {foreach $utd_category as $fagomrade}
	        {set $tmp_items = fetch( 'content', 'list', hash( 'parent_node_id', $fagomrade.node_id,
	                                     'sort_by', array( 'attribute', true(), 317),
	                                     'class_filter_type', 'include',
	                                     'class_filter_array', $classes,
	                                     'attribute_filter', array( array( 325, '=', $nivaa_id ) ) ) )
	             $tmp_width = $fagomrade.data_map.name.content|count()
	             $tmp_item_count = $tmp_items|count()
	             $nivaa_item_count = sum($nivaa_item_count, $tmp_item_count)}
	        {foreach $tmp_items as $item}{if gt($item.data_map.title.content|count(), $tmp_width)}{set $tmp_width = $item.data_map.title.content|count()}{/if}{/foreach}
	        {set $tmp_hash = hash( 'navn', $fagomrade.name,
	                               'url_alias', $fagomrade.url_alias, 
	                               'antall', $tmp_item_count,
	                               'width', $tmp_width,
	                               'items', $tmp_items )}
	        {if gt($tmp_item_count, 0)}
	        {set $tmp_fagomrade = $tmp_fagomrade|append($tmp_hash)}
	        {/if}
	    {/foreach}
	    {set $tmp_utd = hash('nivaa_id', $nivaa_id,
	                         'nivaa', $nivaa_name,
	                         'antall', $nivaa_item_count,
	                         'fagomrade', $tmp_fagomrade )}
	    {if gt($tmp_utd.antall, 0)}
	    {set $utdanninger = $utdanninger|append($tmp_utd)}
	    {/if}
	{/foreach}
	<div class="col-sm-2">
	    <ul class="nav nav-pills nav-stacked hials-nav-pills" role="tablist">
	{foreach $nivaa_sortorder as $nivaa_id}
	    {if gt($utdanninger[$nivaa_id].antall, 0)}
	        <li role="presentation"{if eq($nivaa_id,0)} class="active"{/if}><a href="{concat('#utdnivaa_', $nivaa_id)}" data-toggle="pill" title="{$utdanninger[$nivaa_id].nivaa|wash()}">{$utdanninger[$nivaa_id].nivaa|wash()}</a></li>
	    {/if}
	{/foreach}
		</ul>
	</div>
	<div class="tab-content">
	{foreach $nivaa_sortorder as $nivaa_id}
	    {if gt($utdanninger[$nivaa_id].antall, 0)}
	    
		    {set $col_width = floor(div(10, $utdanninger[$nivaa_id].fagomrade|count()))}
		    {if gt($col_width, 4)}{set $col_width = 4}{/if}
	    	{set $extra_space = mod(12, $utdanninger[$nivaa_id].fagomrade|count())}
	
		    <div role="tabpanel" class="tab-pane{if eq($nivaa_id,0)} active{/if}" id="{concat('utdnivaa_', $nivaa_id)}">
		        {foreach $utdanninger[$nivaa_id].fagomrade as $item}
		        
		        {if gt($item.antall, 0)}
		        <div class="col-sm-{$col_width}">
			        <ul class="submenu">
			            <li class="submenuhead"><a href={$item.url_alias|ezurl} title="{$item.navn|wash()}">{$item.navn|wash()}</a></li>
			            {foreach $item.items as $utd_item}
			            <li><a href={$utd_item.url_alias|ezurl} title="{$utd_item.data_map.title.content|wash()}">{$utd_item.data_map.title.content|wash()}</a></li>
			            {/foreach}
			        </ul>
			    </div>
		        {/if}
		        {/foreach}
		    </div>	    
	    {/if}
	{/foreach}
	</div>
	{*
	<!--
	Utdanninger:
	{$utdanninger|attribute('show', 4, 'text')}
	-->
	*}
{/if}
{undef $classes $nivaa_sortorder $nivaa_names $utdanninger $utdanning_width $utd_category $tmp_utd $col_width $nivaa_item_count $tmp_items $tmp_item_count $tmp_hash $tmp_fagomrade}