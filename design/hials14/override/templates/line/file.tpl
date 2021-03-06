{* File - line view *}
<div class="content-view-line">
    <div class="class-file">
    {if $object.data_map.file.has_content}
    {def $file = $object.data_map.file
         $iconclasses = array('fa')}
    {switch match=$file.content.mime_type_part}
        {case match='pdf'}
            {set $iconclasses = $iconclasses|append('fa-file-pdf-o')}
        {/case}
        {case in=array('png','jpg')}
            {set $iconclasses = $iconclasses|append('fa-file-image-o')}
        {/case}
        {case}
            {set $iconclasses = $iconclasses|append('fa-file-o')}
        {/case}
    {/switch}
    <div class="content-body">
        <i class="{$iconclasses|implode(' ')}"></i><a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl}>{$object.name|wash("xhtml")}</a> {$file.content.filesize|si(byte)}
    </div>
    {undef $file}
    {else}
    <div class="content-body">
        <a href={$object.main_node.url_alias|ezurl}>{$object.name|wash}</a>
    </div>
    {/if}
   </div>
</div>
