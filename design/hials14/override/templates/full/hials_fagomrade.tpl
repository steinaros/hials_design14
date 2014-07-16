{* hials_fagomrade - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}

{def $rss_export = fetch( 'rss', 'export_by_node', hash( 'node_id', $node.node_id ) )}

<section class="content-view-full container">
    <div class="class-hials_fagomrade">
        <div class="span8">
            {if $rss_export}
            <div class="attribute-rss-icon">
                <a href="{concat( '/rss/feed/', $rss_export.access_url )|ezurl( 'no' )}" title="{$rss_export.title|wash()}"><img src="{'rss-icon.gif'|ezimage( 'no' )}" alt="{$rss_export.title|wash()}" /></a>
            </div>
            {/if}

            <div class="attribute-header">
                <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
            </div>

            {if $node.object.data_map.intro.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.intro}
                </div>
            {/if}

            {def $classes = array('hials_utdanningstilbud')
                 $children = array()
                 $children_count = ''}

            {set $children_count=fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', $classes ) )}
            <section class="content-view-children">
                {if $children_count}
                    {foreach fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                            'offset', $view_parameters.offset,
                                                            'sort_by', $node.sort_array,
                                                            'class_filter_type', 'include',
                                                            'class_filter_array', $classes ) ) as $child }
                        {node_view_gui view='line' content_node=$child fagomrade=$node.data_map.name}
                    {/foreach}
                {/if}
            </section>
        </div>
    </div>
</section>
