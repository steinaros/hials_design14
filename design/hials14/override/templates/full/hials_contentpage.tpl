{* Contentpage - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}                                     
<div class="content-view-full">
    {if $node.data_map.bokser.has_content}
    <aside>
        <div class="attribute-bokser">
            {attribute_view_gui attribute=$node.data_map.bokser container_node=$node}
        </div>
    </aside>
    {/if}
    {if ne($node.data_map.banner.content.relation_list|count(),0)}
    <div class="attribute-banner row equal">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    <div class="row">
	    {if $node.data_map.image.has_content}
	    <aside class="col-sm-6 col-left">
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	        {include uri='design:menu/leftmenu.tpl'}
	    </aside>
	    {else}
	    <aside class="col-sm-3 col-left">
	       {include uri='design:menu/leftmenu.tpl'}
	    </aside>
	    {/if}
	    <article class="class-hials_innholdsside col-sm-6 col-right" itemscope itemtype="http://schema.org/Article">
	        <h1>{$node.data_map.title.content|wash()}</h1>
	        {if $node.data_map.tema_title.content}<h2 class="tematitle">{$node.data_map.tema_title.content|wash()}</h2>{/if}
	
	        {if $node.data_map.intro.content.is_empty|not}
	        <div class="intro" itemprop="description">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </div>
	        {/if}
	        {include uri='design:parts/byline.tpl'}
	        
	        {if $node.data_map.body.content.is_empty|not}
	        <div class="bodytext" itemprop="text">
	            {attribute_view_gui attribute=$node.data_map.body}
	        </div>
	        {/if}
	    </article>
	</div>
</div>

<!-- {$pagedata|attribute('show',2,'text')} -->
<!-- {$module_result|attribute('show',2,'text')} -->