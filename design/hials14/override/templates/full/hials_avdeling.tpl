{* Avdeling - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          class_filter_type, include,
                                          class_filter_array, array( 'hials_forskningsprosjekt' ),
                                          sort_by, $node.sort_array ) )}
{def $extra_class = ""}                                          
<section class="content-view-full">
{*
    {if $node.data_map.bokser.has_content}
    <aside>
        <div class="attribute-bokser">
            {attribute_view_gui attribute=$node.data_map.bokser container_node=$node}
        </div>
    </aside>
    {/if}
    {if ne($node.data_map.banner.content.relation_list|count(),0)}
    <div class="attribute-banner row equal">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if} *}
    <div class="row">
	    {if $node.data_map.image.has_content}
	    <aside class="col-sm-6 col-left">
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	        {if $children|count()}
	        <h3>Undersider</h3>
	        <ul>
	        {foreach $children as $child_item}
	        <li><a href={$child_item.url_alias|ezurl}>{$child_item.name|wash()}</a></li>
	        {/foreach}
	        </ul>
	        {/if}
	    </aside>
	    {elseif $children|count()}
	    <aside class="col-sm-3 col-left">
	        <h3>Undersider</h3>
	        <ul>
	        {foreach $children as $child_item}
	        <li><a href={$child_item.url_alias|ezurl}>{$child_item.name|wash()}</a></li>
	        {/foreach}
	        </ul>
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