{def $check_visibility = ezini( 'SiteAccessSettings', 'ShowHiddenNodes' )|ne( 'true' )
     $content = false()
     $has_readable_related = false()}
{foreach $attribute.content.relation_list as $relation}
{if $relation.in_trash|not()}
    {set $content = fetch( content, object, hash( object_id, $relation.contentobject_id ) )}
    {if or( $content.can_read, $content.can_view_embed)}
        {if or(
            $check_visibility|not,
            fetch( content, node, hash( node_id, $relation.node_id ) ).is_invisible|not
        )}
            {content_view_gui view=embed content_object=$content}
            {set $has_readable_related = true()}
        {/if}
    {/if}
{/if}
{/foreach}
{if $has_readable_related|not()}
{'There are no related objects.'|i18n( 'design/standard/content/datatype' )}
{/if}
{undef $check_visibility $content $has_readable_related}