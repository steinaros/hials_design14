{* Personmappe - Block view *}
{def $box_title = concat('Employees at'|i18n('hials/design/person'),' ',cond($item.data_map.menutitle.has_content, $item.data_map.menutitle.content|downcase(), $item.data_map.title.content|downcase() ) )}
<div class="{concat($css_class,' textcenter')|wash}">
    <div class="class-hials_person_mappe">
        <p class="h3"><a href="{$node.url_alias|ezurl( 'no' )}">{$box_title|wash()}</a></p>
    </div>
</div>
