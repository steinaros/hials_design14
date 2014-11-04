{if not(is_set($menunode))}{def $menunode = 0}{/if}
{def $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '2', '5', '4', '3')
     $nivaa_names = hash( 0, 'Bachelor', 1, 'Master', 2, 'Videreutdanning', 3, 'Kurs', 4, 'Maritime kurs', 5, 'Årsstudium' )
     $utdanninger = array()
     $utdanning_width = array()
     $fagomraader = array()
     $tmp_utd = hash()
     $extra_space = 0
     
     $col_width = 2
     $nivaa_item_count = 0
     $tmp_items = array()
     $tmp_item_count = 0
     $tmp_width = 0
     
     $tmp_hash = hash()
     $tmp_fagomrade = array()}

{set $fagomraader = fetch( 'content', 'list', hash( 'parent_node_id', $menunode,
                                                    'sort_by', array( 'attribute', true(), 315 ),
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'hials_fagomrade' ) ) )}
{foreach $nivaa_names as $nivaa_id => $nivaa_name}
    {set $nivaa_item_count = 0}
    {set $tmp_fagomrade = array()}
    {set $tmp_utd = hash()}
    {foreach $fagomraader as $fagomrade}
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
    <ul id="utdanning_tabs" class="nav nav-pills nav-stacked" role="tablist">
{foreach $nivaa_sortorder as $nivaa_id}    
    {if gt($utdanninger[$nivaa_id].antall, 0)}
        <li role="presentation"{if eq($nivaa_id,0)} class="active"{/if}><a href="{concat('#utdnivaa_', $nivaa_id)}" data-toggle="pill">{$utdanninger[$nivaa_id].nivaa|wash()}</a></li>
    {/if}
{/foreach}
	</ul>
</div>
<div class="tab-content col-sm-10">
{foreach $nivaa_sortorder as $nivaa_id}
    {if gt($utdanninger[$nivaa_id].antall, 0)}
 
    {set $col_width = floor(div(12, $utdanninger[$nivaa_id].fagomrade|count()))}
    {if gt($col_width, 4)}{set $col_width = 4}{/if}
    {set $extra_space = mod(12, $utdanninger[$nivaa_id].fagomrade|count())}
    {*if gt($extra_space, 0)*}
        {*foreach $utdanninger[$nivaa_id].fagomrade as $item*}
            
        {*/foreach*}
    {*/if*}

    <div role="tabpanel" class="tab-pane{if eq($nivaa_id,0)} active{/if}" id="{concat('utdnivaa_', $nivaa_id)}">
        {foreach $utdanninger[$nivaa_id].fagomrade as $item}
        
        {if gt($item.antall, 0)}
        <ul class="submenu col-sm-{$col_width}">
            <li class="submenuhead"><a href={$item.url_alias|ezurl}>{$item.navn|wash()}</a></li>
            {foreach $item.items as $utd_item}
            <li><a href={$utd_item.url_alias|ezurl}>{$utd_item.data_map.title.content|wash()}</a></li>
            {/foreach}
            
        </ul>
        {/foreach}
        {/if}
    </div>
    
    {/if}
{/foreach}
</div>

<!--

Utdanninger:
{$utdanninger|attribute('show', 4, 'text')}

-->

{undef $classes $nivaa_sortorder $nivaa_names $utdanninger $utdanning_width $fagomraader $tmp_utd $col_width $nivaa_item_count $tmp_items $tmp_item_count $tmp_hash $tmp_fagomrade}