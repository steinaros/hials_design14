{* Contentpage - Carouselslide view *}
{def $slide_title = cond($node.data_map.tagheading.has_content, $node.data_map.tagheading.content, $node.data_map.title.has_content, $node.data_map.title.content, $node.name)}
{if ne($node.data_map.banner.content.relation_list|count(),0)}
    {def $banner = fetch( content, object, hash( object_id, $node.data_map.banner.content.relation_list.0.contentobject_id ) )}
    <a href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$banner.data_map.image image_class=$big_class css_class='img-responsive'}</a>
{else}
    <a href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$node.data_map.image image_class=$big_class css_class='img-responsive'}</a>
{/if}
<div class="carousel-caption">
    <h3><a href={$node.url_alias|ezurl}>{$slide_title|wash()}</a></h3>
    <p class="hidden-xs">{$node.data_map.tagline.content|wash()}</p>
</div>
{undef $slide_title}