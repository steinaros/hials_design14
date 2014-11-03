{* Avdeling - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $leftmenu_class_filter = ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' ) 
     $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          class_filter_type, include,
                                          class_filter_array, $leftmenu_class_filter,
                                          sort_by, $node.sort_array ) )
     $projects=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          class_filter_type, include,
                                          class_filter_array, array( 'hials_forskningsprosjekt' ),
                                          sort_by, $node.sort_array ) )}
                                          
{def $extra_class = ""}                                          
<div class="content-view-full">
    {if ne($node.data_map.banner.content.relation_list|count(),0)}
    <div class="attribute-banner row equal">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    <div class="row">
	    {if $node.data_map.image.has_content}
	    <aside class="col-sm-6 col-left">
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	        {if $children|count()}
            {include uri='design:menu/leftmenu_subitems.tpl' subitems=$children}
	        {/if}
            {if $projects|count()}
            {include uri='design:menu/leftmenu_subitems.tpl' subitems=$projects title='Projects'}
            {/if}       
	    </aside>
	    {elseif or($children|count(), $projects|count())}
	    <aside class="col-sm-3 col-left">
            {if $children|count()}
            {include uri='design:menu/leftmenu_subitems.tpl' subitems=$children}
            {/if}
            {if $projects|count()}
            {include uri='design:menu/leftmenu_subitems.tpl' subitems=$projects title='Projects'}
            {/if}       
	    </aside>
	    {else}
	        {set $extra_class = "col-sm-offset-3"}
	    {/if}
	    <article class="class-hials_innholdsside col-sm-6 col-right {$extra_class}" itemscope itemtype="http://schema.org/Article">
	        <h1>{$node.data_map.name.content|wash()}</h1>
	
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
{undef $leftmenu_class_filter $children $extra_class}