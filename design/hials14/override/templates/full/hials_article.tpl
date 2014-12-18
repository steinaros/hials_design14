{* hials_article - Full view *}
{if eq($node.parent.parent.class_identifier, 'hials_nyhetsmappe')}
    {def $root_node_id = $node.parent.parent_node_id}
{else}
    {def $root_node_id = $node.parent_node_id}
{/if}
<div class="content-view-full">
    {if $node.data_map.image.has_content}
    <div class="row">
	    <div class="col-sm-6 col-sm-offset-3 col-left">
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	    </div>
	    {include uri='design:parts/latest_news_sidebar.tpl' root_node_id=$root_node_id}
    </div>
    {/if}
    <div class="row">
	    <article class="class-hials_article col-sm-6 col-sm-push-3 col-right" itemscope itemtype="http://schema.org/Article">
	        <h1 itemprop="name">{$node.data_map.title.content|wash()}</h1>
	
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
        <div class="col-sm-3 col-sm-pull-6 hidden-xs pubisheddatecol">
            <time class="pull-right">{$node.object.published|l10n('shortdate')}</time>
        </div>        
	    {if not($node.data_map.image.has_content)}{include uri='design:parts/latest_news_sidebar.tpl' root_node_id=$root_node_id}{/if}
	</div>
</div>
{undef $root_node_id}