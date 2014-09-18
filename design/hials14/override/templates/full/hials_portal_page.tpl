{* Portal_page - Full view *}
{def $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          sort_by, $node.sort_array ) )}
<div class="content-view-full class-hials_portal_page">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
            <h1>{$node.data_map.title.content|wash()}</h1>
            {if $node.data_map.intro.content.is_empty|not}
            <section class="intro">
                {attribute_view_gui attribute=$node.data_map.intro}
            </section>
            {/if}          
        </div>
    </div>
    
    <div class="attribute-page">
        {attribute_view_gui attribute=$node.object.data_map.page}
    </div>
    
    <hr/>
    {if $children|count()}
    <ul>
    {foreach $children as $child_item}
    <li><a href={$child_item.url_alias|ezurl}>{$child_item.name|wash()}</a></li>
    {/foreach}
    </ul>
    {/if}
    </div>
</div>
