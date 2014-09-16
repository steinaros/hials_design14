{* Innholdsside - Block view *}
{*def $css_class=false()*}

<div class="{concat($css_class,' textcenter')|wash}">
	<article class="class-hials_innholdsside">
	    <h3>{$node.data_map.title.content|wash()}</h3>
	</article>
</div>
{*undef $css_class*}