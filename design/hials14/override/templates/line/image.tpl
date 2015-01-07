{* Image - line view *}
<div class="content-view-line">
    <div class="class-image">
    {if $object.data_map.image.has_content}
    {def $image = $object.data_map.image.content
         $iconclasses = array('fa')}
    {switch match=$image['original'].mime_type}
        {case in=array('image/png','image/jpg')}
            {set $iconclasses = $iconclasses|append('fa-file-image-o')}
        {/case}
        {case}
            {set $iconclasses = $iconclasses|append('fa-file-o')}
        {/case}
    {/switch}
    <div class="content-body">
        <i class="{$iconclasses|implode(' ')}"></i><a href={$image['original'].full_path|ezroot}>{$object.name|wash("xhtml")}</a> {$image['original'].filesize|si(byte)}
    </div>
    {undef $image}
    {else}
    <div class="content-body">
        <a href={$object.main_node.url_alias|ezurl}>{$object.name|wash}</a>
    </div>
    {/if}
   </div>
</div>
