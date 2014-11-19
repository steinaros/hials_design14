{if not(is_set($menuitem))}{def $menuitem = array()}{/if}
{def $content = false()}
<li class="directToMenu">
    <ul class="nav-links col-sm-offset-2">
        <li role="presentation"><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $menuitem.node_id)|ezurl}{else}{$menuitem.url_alias|ezurl}{/if}>{if $menuitem.data_map.submenu_portal_linktext.has_content}{$menuitem.data_map.submenu_portal_linktext.content|wash()}{else}{$menuitem.name|wash()}{/if}</a></li>
{foreach $menuitem.data_map.submenu_extra_links.content.relation_list as $relation}
    {if $relation.in_trash|not()}
        {set $content = fetch( content, object, hash( object_id, $relation.contentobject_id ) )}
        {if or( $content.can_read, $content.can_view_embed)}
	        {if or( $check_visibility|not, fetch( content, node, hash( node_id, $relation.node_id ) ).is_invisible|not )}
	            <li role="presentation">{content_view_gui view=embed content_object=$content}</li>
	        {/if}
        {/if}
    {/if}
{/foreach}
    </ul>
</li>