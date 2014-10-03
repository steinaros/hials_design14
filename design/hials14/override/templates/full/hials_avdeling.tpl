{* Avdeling - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          class_filter_type, include,
                                          class_filter_array, array( 'hials_forskningsprosjekt' ),
                                          sort_by, $node.sort_array ) )}
{def $extra_class = ""}                                          
<section class="content-view-full">
    <div class="row">
	    {if $node.data_map.image.has_content}
	    <aside class="col-sm-6 col-left">
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	        {if $children|count()}
            {include uri='design:parts/leftmenu_subitems.tpl' subitems=$children}
	        {/if}
	    </aside>
	    {elseif $children|count()}
	    <aside class="col-sm-3 col-left">
            {include uri='design:parts/leftmenu_subitems.tpl' subitems=$children}
	    </aside>
	    {else}
	        {set $extra_class = "col-sm-offset-3"}
	    {/if}
	    <article class="class-hials_innholdsside col-sm-6 col-right {$extra_class}">
	        <h1>{$node.data_map.name.content|wash()}</h1>
	
	        {if $node.data_map.intro.content.is_empty|not}
	        <section class="intro">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </section>
	        {/if}
	        {include uri='design:parts/byline.tpl'}
	        
	        {if $node.data_map.description.content.is_empty|not}
	        <section class="bodytext">
	            {attribute_view_gui attribute=$node.data_map.description}
	        </section>
	        {/if}
	    </article>
	</div>
</section>