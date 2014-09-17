{* Innholdsside - Block view *}
{*def $css_class=false()*}
<div class="{concat($css_class,' textcenter')|wash}">
	<article class="class-hials_innholdsside">
	    <h3><a href="{$node.url_alias|ezurl( 'no' )}">{$node.data_map.title.content|wash()}</a></h3>
	</article>
</div>
{*undef $css_class*}