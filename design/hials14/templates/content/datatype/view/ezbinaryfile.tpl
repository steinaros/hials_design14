{if $attribute.content}
    {def $iconclasses = array('fa')}
    {switch match=$attribute.content.mime_type_part}
        {case match='pdf'}{set $iconclasses = $iconclasses|append('fa-file-pdf-o')}{/case}
        {case in=array('png','jpg')}{set $iconclasses = $iconclasses|append('fa-file-image-o')}{/case}
        {case}{set $iconclasses = $iconclasses|append('fa-file-o')}{/case}
    {/switch}
<i class="{$iconclasses|implode(' ')}"></i><a href={concat( 'content/download/', $attribute.contentobject_id, '/', $attribute.id,'/version/', $attribute.version , '/file/', $attribute.content.original_filename|urlencode )|ezurl}>{$attribute.content.original_filename|wash( xhtml )}</a>&nbsp;({$attribute.content.filesize|si( byte )})
{undef $iconclasses}
{/if}