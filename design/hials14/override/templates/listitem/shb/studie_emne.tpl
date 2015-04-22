{def $is_duallanguage = gt($node.object.languages|count(),1)}
{def $node_name=$node.name 
     $node_url=$node.url_alias
     $language_switch_url = ''
     $alt_lang_code = ''}
{if not($is_duallanguage)}
    {def $translations = language_switcher( $module_result.content_info.node_id )}
    {foreach $translations as $siteaccessName => $lang}
        {foreach $node.object.languages as $node_lang}
	        {if eq($lang.locale, $node_lang.locale)}
		        {set $language_switch_url = fetch( 'switchlanguage', 'url_alias', hash( 'path', $node.url_alias, 'locale', $lang.locale ) )}
		        {set $alt_lang_code = $lang.locale|extract_left(2)}
		        {if $language_switch_url}{set $language_switch_url = concat('/', $siteaccessName, '/', $language_switch_url)}{/if}
	        {/if}
        {/foreach}
    {/foreach}
    {if $language_switch_url}<a href="{$language_switch_url}" hreflang="{$alt_lang_code}">{/if}{$node_name|wash}{if $language_switch_url}</a>{/if}
{else}
{if $node_url}<a href={$node_url|ezurl}>{/if}{$node_name|wash}{if $node_url}</a>{/if}
{/if}
{undef $node_name $node_url $is_duallanguage $language_switch_url $alt_lang_code $translations}