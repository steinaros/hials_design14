{* Forskningsprosjekt - Carouselslide view *}
<div class="item">
    {attribute_view_gui attribute=$content_node.data_map.image image_class=$big_class css_class=img-responsive}
    <div class="carousel-caption"><a href={$content_node.url_alias|ezurl}>
        <h3>{$content_node.data_map.title.content|wash()}</h3>
        <!-- <p>{attribute_view_gui attribute=$content_node.data_map.intro}</p> -->
    </a></div>
</div>
