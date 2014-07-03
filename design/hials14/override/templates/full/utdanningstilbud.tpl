{* Utdanningstilbud - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
<section class="content-view-full">
    <article class="class-utdanningstilbud row">
        <div class="span8">
            <div class="attribute-header">
                <h1>{$node.data_map.title.content|wash()}</h1>
            </div>

            <div class="attribute-subheader">
                <h2><span class="utdanningsnivaa">Bachelor</span> innen <span class="fagomraade">Biologiske fag</span></h2>
            </div>

            {if $node.data_map.intro.content.is_empty|not}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.intro}
                </div>
            {/if}
        
        {if $node.data_map.description.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
    </article>
</section>

