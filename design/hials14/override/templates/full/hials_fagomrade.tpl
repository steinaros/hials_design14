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
             $nivaa_sortorder = array( 'Master', 'Bachelor', 'Videreutdanning', 'Å0rsstudium', 'Maritime kurs', 'Kurs' )
             $children = array()
             $children_count = ''}

        <div class="content-view-children">
            {foreach $nivaa_sortorder as $nivaa}
                <!-- Listing: {$nivaa} -->            
                {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                         'sort_by', $node.sort_array,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', $classes,
                                                         'attribute_filter', array ( array ( 'hials_utdanningstilbud/nivaa', '=', $nivaa ) ) ) )}
                {foreach $children as $child }
                    {node_view_gui view='line' content_node=$child fagomrade=$node.data_map.name}
                {/foreach}
                <!-- END {$nivaa} -->
            {/foreach}
        </div>
    </div>
</div>
