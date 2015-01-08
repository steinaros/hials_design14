{* hials_signup_tour_form - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $article_extra_classes = array('col-sm-6')
     $aside_extra_classes = array()}
{if $node.data_map.image.has_content}
    {set $article_extra_classes = $article_extra_classes|append('col-sm-push-6')}
    {set $aside_extra_classes = array('col-sm-6', 'col-sm-pull-6')}
{else}
    {set $article_extra_classes = $article_extra_classes|append('col-sm-push-3')}
    {set $aside_extra_classes = array('col-sm-3', 'col-sm-pull-6')}
{/if}
<div class="content-view-full">
    {if $node.data_map.layout.has_content}
    <aside>
        <div class="attribute-bokser">
            {attribute_view_gui attribute=$node.data_map.layout container_node=$node}
        </div>
    </aside>
    {/if}
    {if ne($node.data_map.banner.content.relation_list|count(),0)}
    <div class="attribute-banner row equal">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    <div class="row">
	    <article class="class-hials_order {$article_extra_classes|implode(' ')} col-right">
	        <h1>{$node.data_map.formname.content|wash()}</h1>
	        	
	        {if $node.data_map.intro.content.is_empty|not}
	        <div class="intro">
	            {attribute_view_gui attribute=$node.data_map.description}
	        </div>
	        {/if}
	        {include uri='design:parts/byline.tpl'}
	        
	        {if $node.data_map.body.content.is_empty|not}
	        <div class="bodytext" itemprop="text">
	            {attribute_view_gui attribute=$node.data_map.body}
	        </div>
	        {/if}

			{include name=Validation uri='design:content/collectedinfo_validation.tpl'
                     class='message-warning'
                     validation=$validation collection_attributes=$collection_attributes}

            <form method="post" action={"content/action"|ezurl}>
                <div class="form-group">
                    {attribute_view_gui attribute=$node.data_map.name}
                </div>
                <div class="form-group">
                    {attribute_view_gui attribute=$node.data_map.email}
                </div>
                <div class="form-group">
                    {attribute_view_gui attribute=$node.data_map.phone}
                </div>
                
                {attribute_view_gui attribute=$node.data_map.field_of_interest}

                <div class="content-action">
                    <input type="submit" class="btn btn-default" name="ActionCollectInformation" value="{if $node.data_map.action_button_label.has_content}{$node.data_map.action_button_label.data_text|wash( xhtml )}{else}{"Submit"|i18n("design/ezdemo/full/call_to_action")}{/if}" />
                    <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                    <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                    <input type="hidden" name="ViewMode" value="full" />
                </div>
            </form>
	        
	    </article>
	    <aside class="{$aside_extra_classes|implode(' ')} col-left">
            {if $node.data_map.image.has_content}
            {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
            {/if}
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
	</div>
</div>
