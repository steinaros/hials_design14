{* hials_article - Carouselslide view *}
<a href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$node.data_map.image image_class=$big_class css_class='img-responsive'}</a>
<div class="carousel-caption">
    <h3><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash()}</a></h3>
    <p class="hidden-xs">{$node.data_map.tagline.content|wash()}</p>
</div>
