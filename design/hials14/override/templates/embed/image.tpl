<figure class="content-view-embed class-image attribute-image">
{if is_set( $link_parameters.href )}
    {attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size href=$link_parameters.href|ezurl target=$link_parameters.target link_class=first_set( $link_parameters.class, '' ) link_id=first_set( $link_parameters['xhtml:id'], '' ) link_title=first_set( $link_parameters['xhtml:title'], '' ) border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}
{else}
    {attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size css_class="img-responsive"}
{/if}
{if $object.data_map.caption.has_content}
    <figcaption class="attribute-caption">
    {attribute_view_gui attribute=$object.data_map.caption}
    </figcaption>
{/if}
</figure>