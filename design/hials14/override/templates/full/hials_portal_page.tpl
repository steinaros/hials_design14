{* Portal_page - Full view *}
{def $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          sort_by, $node.sort_array ) )}
<div class="content-view-full class-hials_portal_page">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
            <h1>{$node.data_map.name.content|wash()}</h1>
            {if $node.data_map.intro.content.is_empty|not}
            <div class="intro">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
            {/if}          
        </div>
    </div>
    
    <div class="attribute-page row">
        {attribute_view_gui attribute=$node.object.data_map.page container_node=$node view_parameters=$view_parameters}
    </div>
</div>
