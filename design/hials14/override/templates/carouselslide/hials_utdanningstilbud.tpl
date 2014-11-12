{* Utdanningstilbud - Carouselslide view *}
{if ne($node.data_map.banner.content.relation_list|count(),0)}
    {def $banner = fetch( content, object, hash( object_id, $node.data_map.banner.content.relation_list.0.contentobject_id ) )}
    <!-- {$banner|attribute('show',2,'text')} -->
    {attribute_view_gui attribute=$banner.data_map.image image_class=$big_class css_class='img-responsive'}
{else}
    {attribute_view_gui attribute=$node.data_map.image image_class=$big_class css_class='img-responsive'}
{/if}
<div class="carousel-caption"><a href={$node.url_alias|ezurl}>
    <h3>{$node.data_map.title.content|wash()}</h3>
</a></div>

{undef $banner}