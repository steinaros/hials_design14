{* Spesialisering - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
<div class="content-view-full">
    <article class="class-hials_spesialisering">
        <h1>{$node.data_map.title.content|wash()}</h1>

        {if $node.data_map.intro.content.is_empty|not}
        {attribute_view_gui attribute=$node.data_map.intro}
        {/if}
            
        {if $node.data_map.description.content.is_empty|not}
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
        {/if}
    </article>
</div>
