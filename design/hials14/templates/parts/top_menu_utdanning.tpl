{if not(is_set($menunode))}{def $menunode = 0}{/if}
{def $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '2', '5', '4', '3')
     $nivaa_names = hash( 0, 'Bachelor', 1, 'Master', 2, 'Videreutdanning', 3, 'Kurs', 4, 'Maritime kurs', 5, 'Årsstudium' )
     $utdanninger = array()
     $utdanning_width = array()
     $utdanning_count = ''
     $col_width = 2
     $fagomraader = array()
     $nivaa_item_count = 0
     $tmp_items = array()
     $tmp_item_count = 0
     $tmp_hash = hash()
     $tmp_fagomrade = array()}

{set $fagomraader = fetch( 'content', 'list', hash( 'parent_node_id', $menunode,
                                                    'sort_by', $node.sort_array,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'hials_fagomrade' ) ) )}
{foreach $nivaa_names as $nivaa_id => $nivaa_name}
    {set $nivaa_item_count = 0}
    {set $utdanninger = $utdanninger|append(hash('nivaa_id', $nivaa_id,
                                                 'nivaa', $nivaa_name,
                                                 'antall', 0,
                                                 'fagomrade', hash() ) )}
    {set $tmp_fagomrade = array()}
    {foreach $fagomraader as $fagomrade}
        {set $tmp_items = fetch( 'content', 'list', hash( 'parent_node_id', $fagomrade.node_id,
                                     'sort_by', array( 'attribute', true(), 317),
                                     'class_filter_type', 'include',
                                     'class_filter_array', $classes,
                                     'attribute_filter', array( array( 325, '=', $nivaa_id ) ) ) )
             $tmp_item_count = $tmp_items|count()
             $tmp_hash = hash( $fagomrade.name, hash( 'antall', $tmp_item_count,
                                                      'items', $tmp_items ) )
             $nivaa_item_count = sum($nivaa_item_count, $tmp_item_count)}

<!--
nivaa_id: {$nivaa_id}
Tmp_item_count: {$tmp_item_count}
tmp_hash: {$tmp_hash|attribute('show',2,'text')}
nivaa_item_count: {$nivaa_item_count}
-->
        {set $tmp_fagomrade = $utdanninger[$nivaa_id].fagomrade|append($tmp_hash)}
<!--
Tmp_fagomrade: {$tmp_fagomrade|attribute('show',1,'text')}
-->        
                 
        {*set $utdanninger[$nivaa_id].fagomrade = $tmp_fagomrade*}      
    {/foreach}
    <!--
    FOR
    Nivaa_id: {$nivaa_id}
    Count: {$utdanninger.$nivaa_id.antall}
    Utdanninger:
    {$utdanninger|dump('show',3,'text')}
    -->
    {set $utdanninger.$nivaa_id.antall = $nivaa_item_count}

    <!--
    ETTER
    Nivaa_id: {$nivaa_id}
    Count: {$utdanninger.$nivaa_id.antall}
    Utdanninger:
    {$utdanninger|dump('show',3,'text')}
    -->

{/foreach}                                                     
<div class="col-sm-2">
    <ul class="nav nav-pills nav-stacked" role="tablist">
{foreach $nivaa_sortorder as $nivaa_id}    
    {if gt($nivaa_item_count, 0)}
        <li role="presentation"{if eq($nivaa_id,0)} class="active"{/if}><a href="{concat('#utdnivaa_', $nivaa_id)}" role="tab" data-toggle="tab">{$utdanninger[$nivaa_id].nivaa|wash()}</a></li>
    {/if}
{/foreach}    
	</ul>
</div>
<div class="tab-content col-sm-10">
{foreach $nivaa_sortorder as $nivaa_id}
    <div role="tabpanel" class="tab-pane active" id="{concat('utdnivaa_', $nivaa_id)}">
        <ul class="submenu col-sm-2">
            <li class="submenuhead"><a href="#">{$nivaa_names[$nivaa_id]|wash()}</a></li>
            <li><a href="#">Biomarin innovasjon</a></li>
            <li><a href="#">Bioteknologi</a></li>
            <li><a href="#">Bioingeniør</a></li>
        </ul>
    </div>
{/foreach}
</div>

<!--
{foreach $utdanninger as $key => $item}
    Key: {$key}
    Item: {$item|attribute('show',1,'text')}
{/foreach}
-->

{undef $classes $nivaa_sortorder $nivaa_names $utdanninger $utdanning_width $utdanning_count $col_width $fagomraader $tmp_items}