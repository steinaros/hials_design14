{* Contentpage - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $article_extra_classes = array('col-sm-6')
     $aside_extra_classes = array()}
{if $node.data_map.image.has_content}
    {set $article_extra_classes = $article_extra_classes|append('col-sm-push-6')}
    {set $aside_extra_classes = array('col-sm-6', 'col-sm-pull-6')}
{else}
    {set $article_extra_classes = $article_extra_classes|append('col-sm-push-6')}
    {set $aside_extra_classes = array('col-sm-6', 'col-sm-pull-6')}
{/if}
<div class="content-view-full">
    {if ne($node.data_map.banner.content.relation_list|count(),0)}
    <div class="attribute-banner row equal">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    <div class="row">
	    <article class="class-hials_innholdsside {$article_extra_classes|implode(' ')} col-right" itemscope itemtype="http://schema.org/Article">
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
	    <aside class="{$aside_extra_classes|implode(' ')} col-left">
            {if $node.data_map.image.has_content}
            {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
            {/if}
            {include uri='design:parts/library_search.tpl'}
            
		    {if $node.data_map.layout.has_content}
	        <div class="attribute-bokser">
	            {attribute_view_gui attribute=$node.data_map.layout container_node=$node}
	        </div>
		    {/if}
            
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
	</div>
</div>
