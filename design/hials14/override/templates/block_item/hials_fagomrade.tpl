{* Fagomrade - Block view *}
{if is_unset($css_class)}{def $css_class=false()}{/if}
{def $box_title = cond($node.data_map.tagheading.has_content, $node.data_map.tagheading.content, $node.data_map.name.content)}  
<div class="{concat($css_class,' textcenter')|wash}">
    <div class="class-hials_fagomrade">
        <span class="h3"><a href="{$node.url_alias|ezurl( 'no' )}">{$box_title|wash()}</a></span>
    </div>
</div>
