{if not(is_set($subitems))}{def $subitems = array()}{/if} 
<h3>{'Subpages'|i18n('hials/design/std')}</h3>
<ul class="leftmenu">
{foreach $subitems as $sub_item}
<li><a href={$sub_item.url_alias|ezurl}>{$sub_item.name|wash()}</a></li>
{/foreach}
</ul>