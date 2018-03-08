{* Kurs - Full view *}
{def $content_version=$node.contentobject_version_object
     $language_code=$node.object.default_language}
{def $is_duallanguage = gt($node.object.languages|count(),1)}
{def $language_switch_url = ''
     $alt_lang_code = ''}
{def $translations = language_switcher( $module_result.content_info.node_id )}
{foreach $translations as $siteaccessName => $lang}
    {if and(ne($lang.locale, $language_code),$is_duallanguage)}
    {set $language_switch_url = fetch( 'switchlanguage', 'url_alias', hash( 'path', $node.url_alias, 'locale', $lang.locale ) )}
    {set $alt_lang_code = $lang.locale|extract_left(2)}
    {if $language_switch_url}{set $language_switch_url = concat('/', $siteaccessName, '/', $language_switch_url)}{/if}
    {/if}
{/foreach}
<div class="content-view-full class-kurs">
    <div class="row">
        <article class="col-sm-9 col-right col-sm-push-3">
            <h1>{$node.name}</h1>
            {include uri='design:shb/parts/archived_info_warning.tpl'}
{foreach $content_version.contentobject_attributes as $attribute}
    {if $attributes_in_box|contains( $attribute.contentclass_attribute.identifier )}{skip}{/if}
    {if or(eq($attribute.content, ''), not($attribute.has_content), eq( $attribute.data_text|striptags|wstrim, ''))}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezdate'), or(is_null( $attribute.data_int), eq( $attribute.data_int, 0) ) )}{skip}{/if}
    <h3>{description($attribute.contentclass_attribute.id, $attribute.language_code)|wash}</h3>
    {switch match=$attribute.is_a}
        {case match='ezxmltext'}<div class="ezxmltext">{attribute_view_gui attribute=$attribute}</div>{/case}
        {case}<p>{attribute_view_gui attribute=$attribute}</p>{/case}
    {/switch}
{/foreach}
        </article>
        <aside class="col-sm-3 col-sm-pull-9 hidden-print">
            <a class="btn btn-hials btn-lg btn-block{if not($language_switch_url)} disabled{/if}" {if $language_switch_url}rel="alternate" hreflang="{$alt_lang_code}" href="{$language_switch_url}"{else}href="#"{/if} role="button">{if $language_switch_url}{'Også tilgjengelig på norsk'|i18n('hials/design/shb')}{else}{'Kun tilgjengelig på engelsk'|i18n('hials/design/shb')}{/if}</a>
            <a class="btn btn-hials btn-lg btn-block" href="{concat('/', $siteaccessName, '/layout/set/pdf/content/view/full/', $node.node_id, '/language/', $language_code)|ezurl(no)}" role="button no-follow"><i class="fa fa-file-pdf-o"></i><span>{'PDF version'|i18n('hials/design/shb')}</span></a>
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
    </div>
</div>
{undef $content_version $attributes_in_box $language_code $is_duallanguage $language_switch_url $translations $alt_lang_code}