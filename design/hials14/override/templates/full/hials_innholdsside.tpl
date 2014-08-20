{* Innholdsside - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          class_filter_type, include,
                                          class_filter_array, array( 'hials_contentpage' ),
                                          sort_by, $node.sort_array ) )}
<section class="content-view-full">
    <!-- {$node.data_map.bokser|attribute(show, 2, text)} -->
    <aside>
        <div class="attribute-bokser">
            {attribute_view_gui attribute=$node.data_map.bokser container_node=$node}
        </div>
    </aside>   
    {if ne($node.data_map.banner.content.relation_list|count(),0)}
    <div class="attribute-banner">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    
    {if $node.data_map.image.has_content}
    <aside class="col-sm-6">
        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half}
        {if $children|count()}
        <h3>Undersider</h3>
        <ul>
        {foreach $children as $child_item}
        <li><a href={$child_item.url_alias|ezurl}>{$child_item.name|wash()}</a></li>
        {/foreach}
        </ul>
        {/if}
    </aside>
    {else}
    <aside class="col-sm-3">
        {if $children|count()}
        <h3>Undersider</h3>
        <ul>
        {foreach $children as $child_item}
        <li><a href={$child_item.url_alias|ezurl}>{$child_item.name|wash()}</a></li>
        {/foreach}
        </ul>
        {/if}
    </aside>    
    {/if}
    <article class="class-hials_innholdsside col-sm-6">
        <h1>{$node.data_map.title.content|wash()}</h1>
        <h2 class="tematitle">{$node.data_map.tema_title.content|wash()}</h2>

        {if $node.data_map.intro.content.is_empty|not}
        <div class="intro">
            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
        {/if}
            
        {if $node.data_map.description.content.is_empty|not}
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.body}
        </div>
        {/if}
    </article>
    
</section>