{* Nyhetsmappe - Full view *}
{def $rss_export = fetch( 'rss', 'export_by_node', hash( 'node_id', $node.node_id ) )}

<section class="content-view-full class-hials_nyhetsmapppe">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
            {if $rss_export}
            <div class="attribute-rss-icon">
                <a href="{concat( '/rss/feed/', $rss_export.access_url )|ezurl( 'no' )}" title="{$rss_export.title|wash()}"><img src="{'rss-icon.gif'|ezimage( 'no' )}" alt="{$rss_export.title|wash()}" />RSS</a>
            </div>
            {/if}

            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>

            {def $page_limit = 10
                 $depth = 2
                 $classes = array('hials_nyhetsartikkel')
                 $children = array()
                 $children_count = ''}

                {set $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                          'class_filter_type', 'include',
                                                                          'class_filter_array', $classes ) )}
                {include name=navigator
                         uri='design:navigator/google.tpl'
                         page_uri=$node.url_alias
                         item_count=$children_count
                         view_parameters=$view_parameters
                         item_limit=$page_limit}

                <section class="content-view-children">
                {if $children_count}
                    {foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                            'offset', $view_parameters.offset,
                                                            'sort_by', $node.sort_array,
                                                            'class_filter_type', 'include',
                                                            'class_filter_array', $classes,
                                                            'depth', $depth,
                                                            'limit', $page_limit ) ) as $child }
                        {node_view_gui view='line' content_node=$child}
                    {/foreach}
                {/if}
                </section>

                {include name=navigator
                         uri='design:navigator/google.tpl'
                         page_uri=$node.url_alias
                         item_count=$children_count
                         view_parameters=$view_parameters
                         item_limit=$page_limit}
        </div>
        <aside class="col-sm-3">
            
            {* 2 levels of hials_nyhetsmappe *}
            {if eq($node.parent.class_identifier, 'hials_nyhetsmappe')}
                {def $root_node = fetch( 'content', 'node', hash( 'node_id', $node.parent_node_id ) )}
            {else}
                {def $root_node = $node}
            {/if}
            {def $menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
                                                               'sort_by', $root_node.sort_array,
                                                               'load_data_map', false(),
                                                               'class_filter_type', 'include',
                                                               'class_filter_array', array('hials_nyhetsmappe' ) ) )
                 $menu_items_count = $menu_items|count()}
      
                <h2>Arkiv</h2>
            
                {if $menu_items_count}
                <ul>
                    {foreach $menu_items as $key => $item}
                        <li><a href="{$item.url_alias|ezurl('no')}">{$item.name|wash()}</a></li>
                    {/foreach}
                </ul>
                {/if}
                {undef $root_node $menu_items $menu_items_count}
        </aside>
    </div>
</section>
