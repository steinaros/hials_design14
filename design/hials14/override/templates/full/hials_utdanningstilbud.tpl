{* Utdanningstilbud - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}                                       
<section class="content-view-full">
    {if $node.data_map.banner.content.is_empty|not}
    <div class="attribute-banner">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    
    <article class="class-hials_utdanningstilbud col-sm-6">
        <h1>{$node.data_map.title.content|wash()}</h1>
        <h2><span class="utdanningsnivaa">{$node.data_map.nivaa.class_content.options[$node.data_map.nivaa.content[0]].name|wash()}</span> innen <span class="fagomraade">{$node.parent.data_map.name.content|wash()}</span></h2>

        {if $node.data_map.intro.content.is_empty|not}
        {attribute_view_gui attribute=$node.data_map.intro}
        {/if}
        
        {if $node.data_map.description.content.is_empty|not}
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
        {/if}             
    </article>
    <aside>
        <div class="attribute-bokser">
            {attribute_view_gui attribute=$node.data_map.bokser container_node=$node}
        </div>
    </aside>   
</section>
