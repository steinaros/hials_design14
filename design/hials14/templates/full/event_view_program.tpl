{* Event Calendar - Full Program view *}
{def
    $event_node = $node.node_id
    $curr_ts = currentdate()
    $curr_today = $curr_ts|datetime( custom, '%j')
    $curr_year = $curr_ts|datetime( custom, '%Y')
    $curr_month = $curr_ts|datetime( custom, '%n')
    $temp_oldest_event = ''
    $temp_newest_event = ''

    $temp_offset = cond( ne($view_parameters.offset, ''), $view_parameters.offset, 0)
    $daymode = false()
    $direction = ""
    $newer_event_count = fetch( 'content', 'list_count', hash(
            'parent_node_id', $event_node,
            'class_filter_type',  'include',
            'class_filter_array', array( 'hials_event' ),
               'attribute_filter',    array( 'or',
                    array( 'hials_event/from_time', '>=', $curr_ts  ),
                    array( 'hials_event/to_time', '>=', $curr_ts  )
            )    ))
    $older_event_count = fetch( 'content', 'list_count', hash(
            'parent_node_id', $event_node,
            'class_filter_type',  'include',
            'class_filter_array', array( 'hials_event' ),
               'attribute_filter',
            array( 'and', array( 'hials_event/from_time', '<', $curr_ts  ),
                    array( 'hials_event/to_time', '<', $curr_ts  )
            )    ))
}
{if ge($temp_offset,0)}
	{set $temp_offset = $temp_offset|abs}
	{def $events = fetch( 'content', 'list', hash(
	            'parent_node_id', $event_node,
	            'sort_by', array( 'attribute', true(), 'hials_event/from_time' ),
	            'class_filter_type',  'include',
	            'class_filter_array', array( 'hials_event' ),
	            'limit', 15,
	            'offset', $temp_offset|mul(15),
	            'attribute_filter', array( 'or',
	                    array( 'hials_event/from_time', '>=', $curr_ts  ),
	                    array( 'hials_event/to_time', '>=', $curr_ts  )
	            )    ))}
	{set $newer_event_count = $newer_event_count|sub( 15|mul( $temp_offset|inc ) )}
{else}
	{set $temp_offset = $temp_offset|abs|dec
	     $direction = "-"}
	{def $events = fetch( 'content', 'list', hash(
	            'parent_node_id', $event_node,
	            'sort_by', array( 'attribute', true(), 'hials_event/from_time' ),
	            'class_filter_type',  'include',
	            'class_filter_array', array( 'hials_event' ),
	            'limit', 15,
	            'offset', $temp_offset|mul(15),
	            'attribute_filter', array( 'and',
	                    array( 'hials_event/from_time', '<', $curr_ts  ),
	                    array( 'hials_event/to_time', '<', $curr_ts  )
	            )))}
	{set $older_event_count = $older_event_count|sub( 15|mul( $temp_offset|inc ) )}
{/if}

{foreach $events as $event}
	{if or(eq($temp_newest_event,''),gt($event.object.data_map.from_time.content.timestamp, $temp_newest_event))}
	    {set $temp_newest_event=$event.object.data_map.from_time.content.timestamp}
	{/if}
	{if or(eq($temp_oldest_event,''),lt($event.object.data_map.from_time.content.timestamp, $temp_oldest_event))}
	    {set $temp_oldest_event=$event.object.data_map.from_time.content.timestamp}
	{/if}
{/foreach}

{if eq($temp_oldest_event|datetime(custom,"%M"),  $temp_newest_event|datetime(custom,"%M"))}
    {set $daymode=true()}
{/if}

<div class="content-view-full">
 <div class="class-event-calendar event-calendar-programview">
   <div class="row">
    <div class="col-sm-6 col-sm-push-3">
        <h1>{$node.name|wash()}</h1>
        <dl class="hials-event-program">
{def $prev_datemonth = ''}        
{foreach $events as $event}
    {if ne($event.object.data_map.from_time.content.timestamp|datetime('custom',"%j%M"), $prev_datemonth)}
    <dt class="h2"><time>{$event.object.data_map.from_time.content.timestamp|datetime('custom', "%j %M")}</time></dt>
    {/if}
    {set $prev_datemonth = $event.object.data_map.from_time.content.timestamp|datetime('custom',"%j%M")}
    <dd><h4><a href={$event.url_alias|ezurl}>{$event.name|wash}</a>
    <small>  
    {if $event.object.data_map.to_time.has_content}
        {if $event.object.data_map.to_time.content.day|int()|eq( $event.object.data_map.from_time.content.day|int() )}
            (<time datetime="{$event.object.data_map.from_time.content.timestamp|datetime('custom', '%c')}">{$event.object.data_map.from_time.content.timestamp|l10n('shortdatetime')}</time> - <time datetime="{$event.object.data_map.to_time.content.timestamp|datetime('custom', '%c')}">{$event.object.data_map.to_time.content.timestamp|l10n('shorttime')}</time>)
        {else}
            (<time datetime="{$event.object.data_map.from_time.content.timestamp|datetime('custom', '%c')}">{$event.object.data_map.from_time.content.timestamp|l10n('shortdate')}</time> - <time datetime="{$event.object.data_map.to_time.content.timestamp|datetime('custom', '%c')}">{$event.object.data_map.to_time.content.timestamp|l10n('shortdate')}</time>)
        {/if}
    {else}
        (<time datetime="{$event.object.data_map.from_time.content.timestamp|datetime('custom', '%c')}">{$event.object.data_map.from_time.content.timestamp|l10n('shortdatetime')}</time>)
    {/if}
    </small></h4>
    {if $event.object.data_map.text.has_content}
    <p>{attribute_view_gui attribute=$event.object.data_map.text}</p>
    {/if}
    </dd>
{/foreach}
        </dl>
        <nav>
            <ul class="pager">
{if $direction}{* '-' direction  *}
    {if $older_event_count|gt(0)}
    <li class="previous"><a href={concat("/content/view/full/",  $node.node_id, "/offset/-", $temp_offset|sum(2))|ezurl}><span aria-hidden="true">&larr;</span> {"Past events"|i18n("hials/design/full/event_view_program")}</a></li>
    {else}
    <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> {"Past events"|i18n("hials/design/full/event_view_program")}</a></li>
    {/if}

    {if $temp_offset|gt(0)}
    <li class="next"><a href={concat("/content/view/full/",  $node.node_id, "/offset/-", $temp_offset)|ezurl}>{"Future events"|i18n("hials/design/full/event_view_program")} <span aria-hidden="true">&rarr;</span></a></li>
    {elseif $newer_event_count|gt(0)}
    <li class="next"><a href={concat("/content/view/full/",  $node.node_id, "/offset/0")|ezurl}>{"Future events"|i18n("hials/design/full/event_view_program")} <span aria-hidden="true">&rarr;</span></a></li>
    {else}
    <li class="next disabled"><a href="#">{"Future events"|i18n("hials/design/full/event_view_program")} <span aria-hidden="true">&rarr;</span></a></li>
    {/if}
{else}
    {if $temp_offset|gt(0)}
        <li class="previous"><a href={concat("/content/view/full/",  $node.node_id, "/offset/", $temp_offset|dec)|ezurl}><span aria-hidden="true">&larr;</span> {"Past events"|i18n("hials/design/full/event_view_program")}</a></li>
    {elseif $older_event_count|gt(0)}
        <li class="previous"><a href={concat("/content/view/full/",  $node.node_id, "/offset/-1")|ezurl}><span aria-hidden="true">&larr;</span> {"Past events"|i18n("hials/design/full/event_view_program")}</a></li>
    {else}
        <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> {"Past events"|i18n("hials/design/full/event_view_program")}</a></li>
    {/if}
    {if $newer_event_count|gt(0)}
        <li class="next"><a href={concat("/content/view/full/",  $node.node_id, "/offset/", $temp_offset|inc)|ezurl}>{"Future events"|i18n("hials/design/full/event_view_program")} <span aria-hidden="true">&rarr;</span></a></li>
    {else}
        <li class="next disabled"><a href="#">{"Future events"|i18n("hials/design/full/event_view_program")} <span aria-hidden="true">&rarr;</span></a></li>
    {/if}
{/if}
            </ul>
        </nav>
    </div>
    <aside class="col-sm-3 col-sm-pull-6">
    {include uri='design:menu/leftmenu.tpl'}
    </aside>
    <aside class="col-sm-3"> </aside>
</div>
{undef}
