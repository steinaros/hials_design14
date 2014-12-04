{* Gammel venstremeny - fases ut *}
{if not(is_set($subitems))}{def $subitems = array()}{/if}
{if not(is_set($title))}{def $title = 'Subpages'}{/if} 
<p class="leftmenu">{$title|i18n('hials/design/std')}</p>
<ul class="leftmenu">
{foreach $subitems as $sub_item}
<li><a href={$sub_item.url_alias|ezurl}>{$sub_item.name|wash()}</a></li>
{/foreach}
</ul>