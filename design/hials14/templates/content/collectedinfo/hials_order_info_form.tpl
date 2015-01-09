{set-block scope=global variable=title}{'Takk for bestillingen'}{/set-block}
{def $collection=cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
                          fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}
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
{if $error}
    {if $error_existing_data}
    <div class="alert alert-danger" role="alert">{'You have already submitted feedback. The previously submitted data was:'|i18n('design/standard/content/feedback')}</div>
    {/if}
{else}
<div class="alert alert-success" role="alert"><strong>Takk for bestillingen!</strong></div>
{/if}
        </article>
        <aside class="{$aside_extra_classes|implode(' ')} col-left">
            {if $node.data_map.image.has_content}
            {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
            {/if}
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
    </div>
</div>