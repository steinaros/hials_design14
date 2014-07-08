{* Utdanningstilbud - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{set parent_node=fetch('content', 'node', hash( 'node_id', $node.parent_node_id ) )}
{set fagomrade=$parent_node.data_map.name.content}

<!--
Node:
{$node|attribute('show',2,'text')}

Parent node:
{$parent_node|attribute('show',2,'text')}
-->
                                           
<section class="content-view-full">
    <article class="class-hials_utdanningstilbud row">
        <div class="span8">
       
            <div class="attribute-header">
                <h1>{$node.data_map.title.content|wash()}</h1>
            </div>

            <div class="attribute-subheader">
                <h2><span class="utdanningsnivaa">{$node.data_map.nivaa[0]}</span> innen <span class="fagomraade">{$fagomrade|wash()}</span></h2>
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
	        
	        <aside>
	            <section class="content-view-aside">
                    <div class="attribute-call-for-action">
                        {attribute_view_gui attribute=$node.data_map.bokser}
                    </div>
                </section>
	        </aside
	        
	        {if $node.data_map.banner.content.is_empty|not}
	        <div class="attribute-banner">
	            {attribute_view_gui attribute=$node.data_map.banner}
	        </div>
            {/if}
    </article>
</section>

