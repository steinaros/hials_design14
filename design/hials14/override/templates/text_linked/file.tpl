{* File - text_linked view *}
{if is_unset($object_name)}{def $object_name=$object.name}{/if}
{if and($object.has_visible_node, $object.data_map.file.has_content)}
    {def $file = $object.data_map.file}
    <a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl}>{$object_name|wash}</a>
    {undef $file}
{else}
    {$object_name|wash}
{/if}