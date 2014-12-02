{def $UTDANNING_node_id = ezini( 'HialsContentNodeIDs', 'UtdanningRoot', 'content.ini' )
     $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '2', '5', '6', '4', '3')}
     {* needs to be string-type so that contains-function works... *}
{def $nivaa_names = hash( '0', 'Bachelor', '1', 'Master', '2', 'Videreutdanning', '3', 'Kurs', '4', 'Maritime kurs', '5', 'Årsstudium', '6', 'Enkeltemne' )
     $utdanninger = array()
     $fagomraader = array()

     $tmp_utdanninger = array()
     $tmp_fagomraader = array()

     $tmp_items = array()
     $tmp_item_count = 0
     $tmp_hash = hash()
     $tmp_viewheading = false()}

{def $sel_fagomr = array()
     $sel_nivaa = array()}

{if is_set($view_parameters.s1)}{set $sel_fagomr = $view_parameters.s1|explode(',')}{/if}
{if is_set($view_parameters.s2)}{set $sel_nivaa = $view_parameters.s2|explode(',')}{/if}

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
    <form id="education_filter" action={"content/action"|ezurl} method="post">
    <input type="hidden" name="DestinationURL" value="{$container_node.url_alias}" />
    <div class="wrapper bg-darkgray toolmenu">
	    <h3>Fagområde</h3>
	    <ul>
	    {foreach $fagomraader as $fagomraade}
	        <li><label><input type="checkbox" name="(s1)[]" onchange="$('#education_filter').submit();" value="{$fagomraade.node_id|wash()}"{if $sel_fagomr|contains($fagomraade.node_id)} checked{/if}>{$fagomraade.navn|wash()}</label> <span class="badge pull-right">{$fagomraade.antall|wash()}</span></li>
	    {/foreach}
	    </ul>
    </div>
    <div class="wrapper bg-darkgray toolmenu">
	    <h3>Nivå</h3>
	    <ul>
	    {foreach $utdanninger as $utdanning}
	        {if ne($utdanning.antall, 0)}
	        <li><label><input type="checkbox" name="(s2)[]" onchange="$('#education_filter').submit();" value="{$utdanning.nivaa_id}"{if $sel_nivaa|contains($utdanning.nivaa_id)} checked{/if}>{$utdanning.navn|wash()}</label> <span class="badge pull-right">{$utdanning.antall}</span></li>
	        {/if}
	    {/foreach}
	    </ul>
    </div>
    <noscript><input type="submit" name="Submit" value="Søk" /></noscript>
    </form>
</aside>
<div class="col-sm-9">
{foreach $utdanninger as $utdanning}
    {if or(eq($sel_nivaa|count(),0), $sel_nivaa|contains($utdanning.nivaa_id))}
        {set $tmp_viewheading = false()}
        {foreach $utdanning.items as $item}
            {if or(eq($sel_fagomr|count(),0), $sel_fagomr|contains($item.parent_node_id))}
                {set $tmp_viewheading = true()}
                {break}
            {/if}
        {/foreach}
        {if $tmp_viewheading}
            <h2>{$utdanning.navn|wash()}</h2>
            <ul>
	        {foreach $utdanning.items as $item}
	            {if or(eq($sel_fagomr|count(),0), $sel_fagomr|contains($item.parent_node_id))}<li><a href={$item.url_alias|ezurl}>{$item.data_map.title.content|wash()}</a></li>{/if}
	        {/foreach}
            </ul>
        {/if}            
    {/if}
{/foreach}
</div>

{undef $UTDANNING_node_id $classes $nivaa_sortorder $nivaa_names $utdanninger $fagomraader $tmp_utdanninger $tmp_fagomraader $tmp_items $tmp_item_count $tmp_hash $sel_fagomr $sel_nivaa $tmp_viewheading} 
{*$utdanning_width $tmp_utd $col_width $nivaa_item_count $tmp_fagomrade*}