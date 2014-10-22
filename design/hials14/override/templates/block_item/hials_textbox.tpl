{*def $css_class=false()*}

<div class="{$css_class|wash}">
	<div>
	    <p class="h3">{$node.name|wash()}</p>
	    {attribute_view_gui attribute=$node.data_map.contents}
	</div>
</div>
{*undef $css_class*}