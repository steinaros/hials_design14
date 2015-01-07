{def $CALENDAR_node_id = ezini( 'HialsContentNodeIDs', 'FrontpageCalendar', 'hials.ini' )
     $calendar = fetch( 'content', 'node', hash( 'node_id', $CALENDAR_node_id ) )

     $eventlist = fetch( 'content', 'list', hash(
          'parent_node_id', $CALENDAR_node_id,
          'sort_by', array( 'attribute', true(), 'hials_event/from_time'),
          'class_filter_type',  'include',
          'class_filter_array', array( 'hials_event' ),
          'main_node_only', true(),
          'limit', 5,
          'attribute_filter', array( 'or',
            array( 'hials_event/from_time', '>=', makedate( currentdate()|datetime('custom','%n') , currentdate()|datetime('custom','%j'), currentdate()|datetime('custom','%Y') ) ),
            array( 'hials_event/to_time', '>=', makedate( currentdate()|datetime('custom','%n') , currentdate()|datetime('custom','%j'), currentdate()|datetime('custom','%Y') ) )
          )
        )
     )
}
{if gt($eventlist|count(), 0)}
<h2 class="front">{'Calendar'|i18n('hials/design/calendar')}</h2>
<dl>
    {foreach $eventlist as $event}
    <dt>
        <a href="{$event.url_alias|ezurl('no')}" title="{$event.data_map.title.content|wash()} - {$event.data_map.from_time.content.timestamp|l10n('shortdate')}"><time datetime="{$event.data_map.from_time.content.timestamp|datetime('custom', '%c')}">{$event.data_map.from_time.content.timestamp|datetime(custom,"%d.%m.%y")}</time></a>
    </dt>
    <dd><a href="{$event.url_alias|ezurl('no')}" title="{$event.data_map.title.content|wash()} - {$event.data_map.from_time.content.timestamp|l10n('shortdate')}">{$event.data_map.short_title.content|wash()}</a></dd>
    {/foreach}
</dl>

<p><a href="{$calendar.url_alias|ezurl('no')}" title="{'More events'|i18n('hials/design/calendar')}">{'More...'|i18n('hials/design/std')}</a></p>
{/if}
{undef $CALENDAR_node_id $calendar $eventlist}
