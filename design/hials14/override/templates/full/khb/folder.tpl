{* Folder - Full view *}
{def $page_limit=20
     $list_items=array()
     $list_count=0
     $time_filter=array()}
<div class="content-view-full class-folder">
    <div class="row">
        <article class="col-sm-9 col-right col-sm-push-3">
		    <h1>{$node.object.data_map.name.content|wash()}</h1>
		    <div class="intro">
		       {attribute_view_gui attribute=$node.data_map.short_description}
		    </div>
		    <div class="bodytext">
		       {attribute_view_gui attribute=$node.data_map.description}
		    </div>
    
{if and(is_unset( $versionview_mode ), $node.object.data_map.show_children.content)}
    {if or( $view_parameters.day, $view_parameters.month, $view_parameters.year )}
    
        {set $time_filter=array( 'and', array( 'published', '>=', maketime( 0, 0, 0, $view_parameters.month, cond( $view_parameters.day, $view_parameters.day, 1 ), $view_parameters.year ) ),
                                       array( 'published', '<=', maketime( 23, 59, 59, cond( $view_parameters.day, $view_parameters.month, $view_parameters.month|inc ), cond( $view_parameters.day, $view_parameters.day, 0 ), $view_parameters.year ) ) )
             $list_items=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                        'offset', $view_parameters.offset,
                                                        'attribute_filter', $time_filter,
                                                        'sort_by', $node.sort_array,
                                                        'limit', $page_limit ) )
             $list_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id ) )}
    {else}
        {set $list_items=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                        'offset', $view_parameters.offset,
                                                        'sort_by', $node.sort_array,
                                                        'limit', $page_limit ) )
             $list_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id ) )}
    {/if}

    {if $list_count}
    <ul class="line-list">
        {foreach $list_items as $item}
        <li>{node_view_gui view='listitem' content_node=$item}</li>
        {/foreach}
    </ul>
    
    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=$node.url_alias
             item_count=$list_count
             view_parameters=$view_parameters
             item_limit=$page_limit}
    {/if}
{/if}
        </article>
        <aside class="col-sm-3 col-sm-pull-9 hidden-print">
            {include uri='design:menu/leftmenu.tpl'}
        </aside>       
    </div>
</div>
{undef $page_limit $list_items $list_count $time_filter}