{* Systemmappe - Full view *}
<div class="content-view-full class-systemmappe">
    <div class="row">
        <div class="col-sm-9 col-sm-push-3">

            <h1>{attribute_view_gui attribute=$node.data_map.navn}</h1>

            <div class="intro">
                {attribute_view_gui attribute=$node.data_map.info}
            </div>
            
            {def $page_limit = 25
                 $depth = 4
                 $classes = array()
                 $children = array()
                 $children_count = ''}

            {switch match=$node.data_map.identifier.content}
                {case match='versjoner'}
                    {set $classes = array('studiehandbok', 'webpage' )}
                    {set $depth = 1}
                {/case}
                {case match='emner'}
                    {set $classes = array('emne', 'emne_2014_2')}
                {/case}
                {case match='studier'}
                    {set $classes = array('studie', 'studie_2014_2')}
                {/case}
                {case}{/case}
            {/switch}

            {set $children_count=fetch( 'content', 'tree_count', hash( 'parent_node_id', $node.node_id,
                                                                       'class_filter_type', 'include',
                                                                       'class_filter_array', $classes,
                                                                       'depth', $depth ) )}

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

            <div class="content-view-children">
            {if $children_count}
                <ul class="line-list">
                {foreach fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id,
                                                         'offset', $view_parameters.offset,
                                                         'sort_by', $node.sort_array,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', $classes,
                                                         'depth', $depth,
                                                         'limit', $page_limit ) ) as $child }
                    <li>{node_view_gui view='listitem' content_node=$child}</li>
                {/foreach}
                </ul>
            {/if}
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
        </div>
        <aside class="col-sm-3 col-sm-pull-9">
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
    </div>
</div>
{undef $page_limit $depth $classes $children $children_count}