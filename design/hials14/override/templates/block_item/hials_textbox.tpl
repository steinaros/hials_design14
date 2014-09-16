{def $css_class=false()}

<div class="{$css_class|wash}">
	<article>
	    <h3>{$node.name|wash()}</h3>
	    {attribute_view_gui attribute=$node.data_map.contents}
	</article>
</div>
{undef $css_class}