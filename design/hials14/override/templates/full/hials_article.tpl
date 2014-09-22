{* hials_article - Full view *}
{if eq($node.parent.parent.class_identifier, 'hials_nyhetsmappe')}
    {def $root_node_id = $node.parent.parent_node_id}
{else}
    {def $root_node_id = $node.parent_node_id}
{/if}
<section class="content-view-full">
    {if $node.data_map.image.has_content}
    <div class="row">
	    <div class="col-sm-6 col-sm-offset-3 col-left">
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	    </div>
	    {include uri='design:parts/latest_news_sidebar.tpl' root_node_id=$root_node_id}
    </div>
    {/if}
    <div class="row">
        <div class="col-sm-3 hidden-xs">
            <time class="h1">{$node.object.modified|l10n('shortdate')}</time>
        </div>    
	    <article class="class-hials_article col-sm-6 col-right">
	        <h1>{$node.data_map.title.content|wash()}</h1>
	
	        {if $node.data_map.intro.content.is_empty|not}
	        <section class="intro">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </section>
	        {/if}
	        {include uri='design:parts/byline.tpl'}
	        
	        {if $node.data_map.body.content.is_empty|not}
	        <section class="bodytext">
	            {attribute_view_gui attribute=$node.data_map.body}
	        </section>
	        {/if}
	    </article>
	    {if not($node.data_map.image.has_content)}{include uri='design:parts/latest_news_sidebar.tpl' root_node_id=$root_node_id}{/if}
	</div>
</section>
{undef $root_node_id}