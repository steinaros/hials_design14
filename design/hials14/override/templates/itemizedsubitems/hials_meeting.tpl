<div class="content-view-embed">
    <div class="class-{$object.class_identifier}">

    {def $children = array()
         $limit = 5
         $offset = 0
         $year = 0}
    {if is_set( $object_parameters.limit )}
        {if lt($object_parameters.limit, 0)}
            {set $limit = false()}
        {else}
            {set $limit = $object_parameters.limit}
        {/if}
    {/if}
    {if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if}

    {set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'sort_by', array( 'attribute', false(), 'hials_meeting/dato' ) ) ) }
    {if $children|count()}
    <dl>
        {foreach $children as $child}
        <dt><time datetime="{$child.data_map.dato.content.timestamp|datetime('custom', '%Y-%m-%d')}">{$child.data_map.dato.content.timestamp|l10n('date')}</time></dt>
        <dd>
        {if or($child.data_map.sakliste.has_content, $child.data_map.sakliste.has_content)}
            <ul>
            {def $file = $child.data_map.sakliste}        
            {if $file.has_content}
                <li><div class="attribute-{$file.content.mime_type_part}"><a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl} title="{concat('Agenda'|i18n('design/hials/meeting'),' ',$child.data_map.type.content|wash|downcase,' ',$child.data_map.dato.content.timestamp|l10n('date'))}">{'Agenda'|i18n('design/hials/meeting')}</a>&nbsp;({$file.content.filesize|si(byte)})</li>
            {/if}
            {undef $file}
            {def $file = $child.data_map.protokoll}        
            {if $file.has_content}
                <li><div class="attribute-{$file.content.mime_type_part}"><a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl} title="{concat('Minutes'|i18n('design/hials/meeting'),' ',$child.data_map.type.content|wash|downcase,' ',$child.data_map.dato.content.timestamp|l10n('date'))}">{'Minutes'|i18n('design/hials/meeting')}</a>&nbsp;({$file.content.filesize|si(byte)})</li>
            {/if}
            {undef $file}          
        {else}
            <p>{'No documents are published for this meeting'|i18n('design/hials/meeting')}</p>
        {/if}
        </dd>    
    {/foreach}
    </dl>
    {/if}
    </div>
</div>