<div class="bg-gray">
    <ul class="nav-links links-center">
    {def $UTDANNING_node_id = ezini( 'HialsContentNodeIDs', 'UtdanningRoot', 'hials.ini' )
         $root_node = fetch( 'content', 'node', hash( 'node_id', $UTDANNING_node_id ) )
         $top_menu_utdanning_class_filter = ezini( 'MenuContentSettings', 'UtdanningSubMenuIdentifierList', 'menu.ini' )
         $utdanning_groups = fetch('content', 'list', hash( 'parent_node_id', $UTDANNING_node_id,
                                                            'sort_by', $root_node.sort_array,
                                                            'class_filter_type', 'include',
                                                            'class_filter_array', $top_menu_utdanning_class_filter ) )}
    {foreach $utdanning_groups as $item}
        <li role="presentation"><a href="{$item.url_alias|ezurl('no')}">{$item.data_map.name.content|wash()}</a></li>
    {/foreach}
    {undef $UTDANNING_node_id $root_node $top_menu_utdanning_class_filter $utdanning_groups}
    </ul>
</div>
