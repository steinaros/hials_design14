{if not(is_set($menunode))}{def $menunode = 0}{/if}
{def $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '2', '5', '4', '3')
     $nivaa_names = hash( 0, 'Bachelor', 1, 'Master', 2, 'Videreutdanning', 3, 'Kurs', 4, 'Maritime kurs', 5, 'Årsstudium' )
     $utdanninger = array()
     $utdanning_width = array()
     $fagomraader = array()
     $tmp_utd = hash()

     $utdanning_count = ''
     $col_width = 2
     $nivaa_item_count = 0
     $tmp_items = array()
     $tmp_item_count = 0
     
     $tmp_hash = hash()
     $tmp_fagomrade = array()}

{set $fagomraader = fetch( 'content', 'list', hash( 'parent_node_id', $menunode,
                                                    'sort_by', array( 'attribute', false(), 'hials_fagomrade/title' ),
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
             $tmp_item_count = $tmp_items|count()
             $tmp_hash = hash( 'navn', $fagomrade.name, 
                               'antall', $tmp_item_count,
                               'items', $tmp_items )
             $nivaa_item_count = sum($nivaa_item_count, $tmp_item_count)}
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
    <ul class="nav nav-pills nav-stacked" role="tablist">
{foreach $nivaa_sortorder as $nivaa_id}    
    {if gt($utdanninger[$nivaa_id].antall, 0)}
        <li role="presentation"{if eq($nivaa_id,0)} class="active"{/if}><a href="{concat('#utdnivaa_', $nivaa_id)}" role="tab" data-toggle="tab">{$utdanninger[$nivaa_id].nivaa|wash()}</a></li>
    {/if}
{/foreach}
	</ul>
</div>
<div class="tab-content col-sm-10">
{foreach $nivaa_sortorder as $nivaa_id}
    {if gt($utdanninger[$nivaa_id].antall, 0)}
    
    <div role="tabpanel" class="tab-pane{if eq($nivaa_id,0)} active{/if}" id="{concat('utdnivaa_', $nivaa_id)}">
        {foreach $utdanninger[$nivaa_id].fagomrade as $item}
        
        {if gt($item.antall, 0)}
        <ul class="submenu col-sm-2">
            <li class="submenuhead"><a href="#">{$item.navn|wash()}</a></li>
            {foreach $item.items as $utd_item}
            <li><a href="#">{$utd_item.data_map.title.content|wash()}</a></li>         
            {/foreach}
            
        </ul>
        {/foreach}
        {/if}
    </div>
    
    {/if}
{/foreach}
</div>

{undef $classes $nivaa_sortorder $nivaa_names $utdanninger $utdanning_width $utdanning_count $col_width $fagomraader $tmp_items}