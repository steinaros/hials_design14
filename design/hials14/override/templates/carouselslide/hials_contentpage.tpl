{* Contentpage - Carouselslide view *}
{if ne($node.data_map.banner.content.relation_list|count(),0)}
    {def $banner = fetch( content, object, hash( object_id, $node.data_map.banner.content.relation_list.0.contentobject_id ) )}
    <a href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$banner.data_map.image image_class=$big_class css_class='img-responsive'}</a>
{else}
    <a href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$node.data_map.image image_class=$big_class css_class='img-responsive'}</a>
{/if}
<div class="carousel-caption">
    <h3><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash()}</a></h3>
    <p>{$node.data_map.intro.content|wash()}</p>
</div>
