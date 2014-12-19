{* Fagomrade - Block view *}
{*def $css_class=false()*}
{def $box_title = cond($node.data_map.tagheading.has_content, $node.data_map.tagheading.content, $node.data_map.name.content)}  
<div class="{concat($css_class,' textcenter')|wash}">
    <div class="class-hials_fagomrade">
        <p class="h3"><a href="{$node.url_alias|ezurl( 'no' )}">{$box_title|wash()}</a></p>
    </div>
</div>
{*undef $css_class*}