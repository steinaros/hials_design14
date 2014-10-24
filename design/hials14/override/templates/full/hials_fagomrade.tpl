{* hials_fagomrade - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
<div class="content-view-full class-hials_fagomrade row">
    <div class="col-sm-12">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>

        {if $node.object.data_map.intro.has_content}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
        {/if}

        {def $classes = array('hials_utdanningstilbud')
             $nivaa_sortorder = array( 1, 0, 2, 5, 4, 3)
             $nivaa_sortorder_name = hash( 1, 'Master', 0, 'Bachelor', 2, 'Videreutdanning', 5, 'Årsstudium', 4, 'Maritime kurs', 3, 'Kurs' )
             $children = array()
             $children_count = ''}

        {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                         'sort_by', $node.sort_array,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', $classes) )}
        <!-- 
        {foreach $children as $child}
        {$child.data_map|attribute('show', 2, 'text')} 
        {/foreach}
        
        -->

        <div class="content-view-children">
            {foreach $nivaa_sortorder as $nivaa_id}
                <!-- Listing: {$nivaa_sortorder_name[$nivaa_id]} ({$nivaa_id}) -->            
                {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                         'sort_by', $node.sort_array,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', $classes,
                                                         'attribute_filter', array ( array ( 325, '=', $nivaa_id ) ) ) )}
                {foreach $children as $child }
                    {node_view_gui view='line' content_node=$child fagomrade=$node.data_map.name}
                {/foreach}
                <!-- END {$nivaa_sortorder_name[$nivaa_id]} -->
            {/foreach}
        </div>
    </div>
</div>
