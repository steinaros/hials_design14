{* Forskningsprosjekt - Full view *}
{def $leftmenu_class_filter = ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' )
     $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          class_filter_type, 'include',
                                          class_filter_array, $leftmenu_class_filter,
                                          sort_by, $node.sort_array ) )}
{def $extra_class = ""}
<div class="content-view-full">
    <div class="row">
	    {if or($node.data_map.image.has_content, $node.data_map.bokser.has_content)}
	    <aside class="col-sm-6 col-left">
            {if $node.data_map.image.has_content}
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	        {/if}
            {if $node.data_map.bokser.has_content}
            <div class="attribute-bokser">
            {attribute_view_gui attribute=$node.data_map.bokser container_node=$node}
            </div>
            {/if}
            {if $children|count()}
            {include uri='design:menu/leftmenu_subitems.tpl' subitems=$children}
            {/if}	        
	    </aside>
        {elseif $children|count()}
        <aside class="col-sm-3 col-left">
           {include uri='design:menu/leftmenu_subitems.tpl' subitems=$children}
        </aside>
	    {else}
	        {set $extra_class = "col-sm-offset-3"}
	    {/if}
	    <article class="class-hials_innholdsside col-sm-6 col-right {$extra_class}">
	        <h1>{$node.data_map.title.content|wash()}</h1>
	        <h2 class="tematitle">{$node.data_map.tema_title.content|wash()}</h2>
	
	        {if $node.data_map.intro.content.is_empty|not}
	        <div class="intro">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </div>
	        {/if}
	        {include uri='design:parts/byline.tpl'}
	        
	        {if $node.data_map.description.content.is_empty|not}
	        <div class="bodytext">
	            {attribute_view_gui attribute=$node.data_map.description}
	        </div>
	        {/if}
	    </article>
	</div>
</div>