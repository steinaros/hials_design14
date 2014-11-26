{def $UTDANNING_node_id = ezini( 'HialsContentNodeIDs', 'UtdanningRoot', 'content.ini' )
     $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '2', '5', '6', '4', '3')
     $nivaa_names = hash( 0, 'Bachelor', 1, 'Master', 2, 'Videreutdanning', 3, 'Kurs', 4, 'Maritime kurs', 5, 'Årsstudium', 6, 'Enkeltemne' )
     $utdanninger = array()
     $fagomraader = array()

     $tmp_items = array()
     $tmp_item_count = 0
     $tmp_hash = hash()}

{set $fagomraader = fetch( 'content', 'list', hash( 'parent_node_id', $UTDANNING_node_id,
                                                    'sort_by', array( 'attribute', true(), 315 ),
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'hials_fagomrade' ) ) )}
    
{foreach $fagomraader as $fagomrade}
    {* 'attribute_filter', array( array( 325, '=', $nivaa_id ) ) ) )*}
    {set $tmp_items = fetch( 'content', 'list', hash( 'parent_node_id', $fagomrade.node_id,
                                 'sort_by', array( 'attribute', true(), 317),
                                 'class_filter_type', 'include',
                                 'class_filter_array', $classes ) ) 

         $tmp_item_count = $tmp_items|count()}
         {*$nivaa_item_count = sum($nivaa_item_count, $tmp_item_count)}*}
    
    {set $tmp_hash = hash( 'navn', $fagomrade.name,
                           'url_alias', $fagomrade.url_alias, 
                           'antall', $tmp_item_count,
                           'items', $tmp_items )}
    {if gt($tmp_item_count, 0)}
    {set $utdanninger = $utdanninger|append($tmp_hash)}
    {/if}
{/foreach}

<aside class="col-sm-3">
    <h3>Fagområde</h3>
    <ul>
    {foreach $utdanninger as $utdanning}
        <li><input type="checkbox">{$utdanning.navn|wash()} <span class="badge">{$utdanning.antall|wash()}</span></li>
    {/foreach}
    </ul>
    <h3>Nivå</h3>
    <ul>
        <li><input type="checkbox">Nivå 1 <span class="badge">1</span></li>
        <li><input type="checkbox">Nivå 2 <span class="badge">12</span></li>
        <li><input type="checkbox">Nivå 3 <span class="badge">123</span></li>
        <li><input type="checkbox">Nivå 4 <span class="badge">1234</span></li>
        <li><input type="checkbox">Nivå 5 <span class="badge">12345</span></li>
    </ul>
</aside>
<div class="col-sm-9">
    {foreach $utdanninger as $utdanning}
        <h2>{$utdanning.navn|wash()}</h2>
        <ul>
        {foreach $utdanning.items as $item}
            <li><a href={$item.url_alias|ezurl}>{$item.data_map.title.content|wash()}</a></li>
            <!--
                {$item|attribute('show', 2, 'text')} 
            -->
        {/foreach}
        </ul>
    {/foreach}
</div>

{undef $UTDANNING_node_id $classes $nivaa_sortorder $nivaa_names $utdanninger $fagomraader $tmp_items $tmp_item_count $tmp_hash} 
{*$utdanning_width $tmp_utd $col_width $nivaa_item_count $tmp_fagomrade*}