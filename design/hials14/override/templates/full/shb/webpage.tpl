{* Webpage - Full view *}
<div class="content-view-full class-webpage">
    <div class="row">
        <article class="col-sm-9 col-right col-sm-push-3" itemscope itemtype="http://schema.org/Article">
            <h1>{$node.data_map.title.content|wash()}</h1>
            {if $node.data_map.short_description.content.is_empty|not}
            <div class="intro" itemprop="description">
                {attribute_view_gui attribute=$node.data_map.short_description}
            </div>
            {/if}
            {include uri='design:parts/byline.tpl'}
            
            {if $node.data_map.body.content.is_empty|not}
            <div class="bodytext" itemprop="text">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
            {/if}
        </article>
        <aside class="col-sm-3 col-sm-pull-9 hidden-print">
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
    </div>
</div>
