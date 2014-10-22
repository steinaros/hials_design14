{*def $css_class=false()*}

<div class="{$css_class|wash}">
	<article>
	    <p class="h3">{$node.name|wash()}</p>
	    {attribute_view_gui attribute=$node.data_map.contents}
	</article>
</div>
{*undef $css_class*}