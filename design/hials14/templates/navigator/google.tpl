{def $page_uri_suffix = false()
     $left_max = 7
     $right_max = 6}

{def $page_count    = int( ceil( div( $item_count, $item_limit ) ) )
     $current_page  = min($page_count, int( ceil( div( first_set( $view_parameters.offset, 0 ), $item_limit ) ) ) )
     $item_previous = sub( mul( $current_page, $item_limit ), $item_limit )
     $item_next     = sum( mul( $current_page, $item_limit ), $item_limit )
     $left_length   = min($current_page, $left_max)
     $right_length  = max(min(sub($page_count, $current_page, 1), $right_max), 0)
     $view_parameter_text = ""
     $offset_text   = eq( ezini( 'ControlSettings', 'AllowUserVariables', 'template.ini' ), 'true' )|choose( '/offset/', '/(offset)/' )}

{def $page_offset = false()
     $counter = 0
     $i = 0}
    
{* Create view parameter text with the exception of offset *}
 
{foreach $view_parameters as $key => $item}
    {if and(not($key|eq('offset')), not($item|eq('')))}
        {set $view_parameter_text = concat($view_parameter_text, '/(', $key, ')/' , $item)}
    {/if}
{/foreach} 

{if $page_count|gt(1)}
<ul class="pagination">
    {if $item_previous|lt(0)}
    <li class="previous disabled"><span>&laquo; <span class="sr-only">({"Previous"|i18n("design/standard/navigator")})</span></span></li>
    {else}
    <li class="previous"><a href={concat($page_uri, $item_previous|gt(0)|choose('',concat($offset_text, $item_previous)), $view_parameter_text, $page_uri_suffix)|ezurl} title="{"Previous"|i18n("design/standard/navigator")}">&laquo; <span class="sr-only">({"Previous"|i18n("design/standard/navigator")})</span></a></li>        
    {/if}
    
    {if $current_page|gt($left_max)}
	    <li><a href={concat($page_uri, $view_parameter_text, $page_uri_suffix)|ezurl}>1</a></li>
	    {if sub($current_page, $left_length)|gt(1)}
	    <li><span>...</span></li>
	    {/if}
    {/if}

    {set $counter = $left_length}
    {while $counter|gt(0)}
        {set $page_offset = sum(sub($current_page, $left_length), $i)}
        <li><a href={concat($page_uri, $page_offset|gt(0)|choose('', concat($offset_text, mul($page_offset, $item_limit))), $view_parameter_text, $page_uri_suffix)|ezurl}>{$page_offset|inc}</a></li>
        {set $i=inc($i)}
        {set $counter=dec($counter)}
    {/while}

    <li class="active"><span>{$current_page|inc} <span class="sr-only">({"Current"|i18n('design/standard/navigator')})</span></span></li>

    {set $i=0
         $counter=$right_length}
    {while $counter|gt(0)}
	    {set $page_offset = sum($current_page, 1, $i)}
	    <li><a href={concat($page_uri, $page_offset|gt(0)|choose('',concat($offset_text, mul($page_offset, $item_limit))), $view_parameter_text, $page_uri_suffix)|ezurl}>{$page_offset|inc}</a></li>
        {set $i=inc($i)}
        {set $counter=dec($counter)}   
    {/while}

	{if $page_count|gt(sum($current_page, $right_max, 1))}
		{if sum($current_page, $right_max, 2)|lt($page_count)}
		<li><span>...</span></li>
		{/if}
		<li><a href={concat($page_uri, $page_count|dec|gt(0)|choose('',concat($offset_text, mul($page_count|dec, $item_limit))), $view_parameter_text, $page_uri_suffix)|ezurl}>{$page_count}</a></li>
	{/if}

    {if $item_next|lt($item_count)}
    <li class="next"><a href={concat($page_uri, $offset_text, $item_next, $view_parameter_text, $page_uri_suffix)|ezurl} title="{"Next"|i18n("design/standard/navigator")}">&raquo; <span class="sr-only">({"Next"|i18n("design/standard/navigator")})</span></a></li>
    {else}
    <li class="next disabled"><span>&raquo; <span class="sr-only">({"Next"|i18n("design/standard/navigator")})</span></span></li>
    {/if}
</ul> 
{/if}