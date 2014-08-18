{* Innholdsside - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
<section class="content-view-full">
    <aside>
        <div class="attribute-bokser">
            {attribute_view_gui attribute=$node.data_map.bokser container_node=$node}
        </div>
    </aside>   
    {if ne($node.data_map.banner.content.relation_list|count(),0)}
    <div class="attribute-banner">{attribute_view_gui attribute=$node.data_map.banner}</div>
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