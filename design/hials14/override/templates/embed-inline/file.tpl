{* File - embed-inline view *}
<span class="content-view-embed-inline">
    <span class="class-file">
    {if $object.data_map.file.has_content}
    {def $file = $object.data_map.file}
    <span class="content-body attribute-{$file.content.mime_type_part}">
        <a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl}>{$object.name|wash("xhtml")}</a> {$file.content.filesize|si(byte)}
    </span>
    {undef $file}
    {else}
    <span class="content-body">
        <a href={$object.main_node.url_alias|ezurl}>{$object.name|wash}</a>
    </span>
    {/if}
   </span>
</span>