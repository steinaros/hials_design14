<div class="content-view-embed">
    <div class="class-{$object.class_identifier}">

    {def $children = array()
         $limit = 5
         $offset = 0
         $year = 0}
    {if is_set( $object_parameters.limit )}
        {set $limit = $object_parameters.limit}
    {/if}
    {if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if}

    {set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'sort_by', array( 'attribute', false(), 'hials_meeting/dato' ) ) ) }
    {if $children|count()}
    {foreach $children as $child}
        {if ne($child.data_map.dato.content.year, $year)}
        <h3>{$child.data_map.dato.content.year|wash()}</h3>
        {set $year = $child.data_map.dato.content.year}
        <dl>
        {/if}
        <dt><time datetime="{$child.data_map.timestamp|datetime('custom', '%Y-%m-%d')}">{$child.data_map.timestamp|i10n('date')}</time></dt>
        <dd>
        {if or($child.data_map.sakliste.has_content, $child.data_map.sakliste.has_content)}
            <ul>
            {def $file = $child.data_map.sakliste}        
            {if $file.has_content}
                <li><div class="attribute-{$file.content.mime_type_part}"><a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl} title="{'Agenda'|i18n('design/hials/meeting')} {$child.data_map.type|wash()|downcase()} {$child.data_map.timestamp|i10n('date')}">{'Agenda'|i18n('design/hials/meeting')} ({$file.content.filesize|si(byte)})</a></li>
            {/if}
            {undef $file}
            {def $file = $child.data_map.protokoll}        
            {if $file.has_content}
                <li><div class="attribute-{$file.content.mime_type_part}"><a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl} title="{'Minutes'|i18n('design/hials/meeting')} {$child.data_map.type|wash()|downcase()} {$child.data_map.timestamp|i10n('date')}">{'Minutes'|i18n('design/hials/meeting')} ({$file.content.filesize|si(byte)})</a></li>
            {/if}
            {undef $file}          
        {else}
            <p>{'No documents are published for this meeting'|i18n('design/hials/meeting')}</p>
        {/if}
        
        <ul>
        </ul>
    {/foreach}
    {/if}
    </div>
</div>