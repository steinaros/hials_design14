{* Forskningsprosjekt - Carouselslide view *}
{attribute_view_gui attribute=$node.data_map.image image_class=$big_class css_class='img-responsive'}
<div class="carousel-caption"><a href={$node.url_alias|ezurl}>
    <h3>{$node.data_map.title.content|wash()}</h3>
    <!-- <p>{attribute_view_gui attribute=$node.data_map.intro}</p> -->
</a></div>
