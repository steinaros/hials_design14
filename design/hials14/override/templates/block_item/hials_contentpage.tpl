{* Contentpage - Block view *}
{*def $css_class=false()*}
<div class="{concat($css_class,' textcenter')|wash}">
	<div class="class-hials_contentpage">
	    <p class="h3"><a href="{$node.url_alias|ezurl( 'no' )}">{$node.data_map.title.content|wash()}</a></p>
	</div>
</div>
{*undef $css_class*}