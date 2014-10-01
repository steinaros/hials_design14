<article class="{$css_class}">
	{if $node.data_map.image.has_content}
    {attribute_view_gui image_class=articleimage attribute=$node.data_map.image}
	{/if}
    {if eq($node.parent.class_identifier,'hials_avdeling')}{$node.parent.data_map.name.content|wash()}{/if}
    <h2 class="media-heading"><a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.data_map.title.content|wash()}</a></h2>
    {if $node.data_map.intro.content.is_empty|not}
    <div class="attribute-intro">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/if}
    <p><a href="{$node.url_alias|ezurl( 'no' )}">Mer om dette prosjektet</a></p>
    <p><a href="{$node.parent.url_alias|ezurl( 'no' )}">Alle prosjekter {if eq($node.parent.class_identifier,'hials_avdeling')}ved {$node.parent.data_map.name.content|wash()}{/if}</a></p> 
</article>