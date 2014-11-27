{def $UTDANNING_node_id = ezini( 'HialsContentNodeIDs', 'UtdanningRoot', 'content.ini' )
     $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '2', '5', '6', '4', '3')
     $nivaa_names = hash( 0, 'Bachelor', 1, 'Master', 2, 'Videreutdanning', 3, 'Kurs', 4, 'Maritime kurs', 5, 'Årsstudium', 6, 'Enkeltemne' )
     $utdanninger = array()
     $fagomraader = array()

     $tmp_utdanninger = array()
     $tmp_fagomraader = array()

     $tmp_items = array()
     $tmp_item_count = 0
     $tmp_hash = hash()}
     
<!--
    Sel1: {$view_parameters.sel1} {is_array($view_parameters.sel1)}
    Sel2: {$view_parameters.sel2} {is_array($view_parameters.sel2)}
-->     

{def $sel1 = first_set($view_parameters.sel1, $view_parameters.sel1|explode(','), array())
     $sel2 = first_set($view_parameters.sel2, $view_parameters.sel2|explode(','), array())}

<!--
    Sel1: {$sel1|attribute('show',2,'text')}
    Sel2: {$sel2|attribute('show',2,'text')}
-->

{set $tmp_fagomraader = fetch( 'content', 'list', hash( 'parent_node_id', $UTDANNING_node_id,
                                                    'sort_by', array( 'attribute', true(), 315 ),
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'hials_fagomrade' ) ) )}

{foreach $tmp_fagomraader as $fagomraade}
    {* 'attribute_filter', array( array( 325, '=', $nivaa_id ) ) ) )*}
    {set $tmp_items = fetch( 'content', 'list', hash( 'parent_node_id', $fagomraade.node_id,
                                 'sort_by', array( 'attribute', true(), 317),
                                 'class_filter_type', 'include',
                                 'class_filter_array', $classes ) ) 

         $tmp_item_count = $tmp_items|count()}
         {*$nivaa_item_count = sum($nivaa_item_count, $tmp_item_count)}*}
    
    {set $tmp_hash = hash( 'navn', $fagomraade.name,
                           'url_alias', $fagomraade.url_alias,
                           'node_id', $fagomraade.node_id, 
                           'antall', $tmp_item_count,
                           'items', $tmp_items )}
    {if gt($tmp_item_count, 0)}
    {set $fagomraader = $fagomraader|append($tmp_hash)}
    {/if}
{/foreach}

{foreach $nivaa_names as $nivaa_id => $nivaa_name}
	{set $tmp_utdanninger = fetch( 'content', 'list', hash( 'parent_node_id', $UTDANNING_node_id,
	                                                    'depth', 2,
	                                                    'sort_by', array(
	                                                        array( 'attribute', true(), 325 ), 
	                                                        array( 'attribute', true(), 317 ) ),
	                                                    'class_filter_type', 'include',
	                                                    'class_filter_array', $classes,
	                                                    'attribute_filter', array( array( 325, '=', $nivaa_id ) ) ) )}
    {set $tmp_item_count = $tmp_utdanninger|count()}
    {set $tmp_hash = hash( 'navn', $nivaa_name,
                           'nivaa_id', $nivaa_id,
                           'antall', $tmp_item_count,
                           'items', $tmp_utdanninger )}
    {set $utdanninger = $utdanninger|append($tmp_hash)}
{/foreach}
<aside class="col-sm-3">
    <form action={"content/action"|ezurl} method="post">
    <input type="hidden" name="DestinationURL" value="{$container_node.url_alias}" />
    <h3>Fagområde</h3>
    <ul>
    {foreach $fagomraader as $fagomraade}
        <li><input type="checkbox" name="(sel1)[]" value="{$fagomraade.node_id|wash()}"{if $sel1|contains($fagomraade.node_id|int())} checked{/if}>{$fagomraade.navn|wash()} <span class="badge">{$fagomraade.antall|wash()}</span></li>
    {/foreach}
    </ul>
    <h3>Nivå</h3>
    <ul>
    {foreach $utdanninger as $utdanning}
        <li><input type="checkbox" name="(sel2)[]" value="{$utdanning.nivaa_id}"{if $sel2|contains($utdanning.nivaa_id|int())} checked{/if}>{$utdanning.navn|wash()} <span class="badge">{$utdanning.antall}</span></li>
    {/foreach}
    </ul>
    <input type="submit" name="Submit" value="Test" />
    </form>
</aside>
<div class="col-sm-9">
    {foreach $utdanninger as $utdanning}
        <h2>{$utdanning.navn|wash()}</h2>
        <ul>
        {foreach $utdanning.items as $item}
            <li><a href={$item.url_alias|ezurl}>{$item.data_map.title.content|wash()}</a></li>
            <!--
                Nivaa: {$item.data_map.nivaa|attribute('show',2,'text')}
                {$item|attribute('show', 2, 'text')} 
            -->
        {/foreach}
        </ul>
    {/foreach}
</div>

{undef $UTDANNING_node_id $classes $nivaa_sortorder $nivaa_names $utdanninger $fagomraader $tmp_utdanninger $tmp_fagomraader $tmp_items $tmp_item_count $tmp_hash} 
{*$utdanning_width $tmp_utd $col_width $nivaa_item_count $tmp_fagomrade*}