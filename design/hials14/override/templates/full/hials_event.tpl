{* hials_event - Full view *}
<div class="content-view-full" itemscope itemtype="http://schema.org/Event">
    {if $node.data_map.image.has_content}
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3 col-left">
            {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
        </div>
    </div>
    {/if}
    <div class="row">
        <article class="col-sm-6 col-sm-push-3">
            <h1 itemprop="name">{if $node.data_map.title.has_content}{$node.data_map.title.content|wash()}{else}{$node.data_map.short_title.content|wash()}</h1>
            {if $node.data_map.intro.content.is_empty|not}
            <div class="intro" itemprop="description">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
            {/if}
            {include uri='design:parts/byline.tpl'}
            {if $node.data_map.text.content.is_empty|not}
            <div class="bodytext" itemprop="text">
                {attribute_view_gui attribute=$node.data_map.text}
            </div>
            {/if}
        </article>
        <aside class="col-sm-3 col-sm-pull-6">
            <dl>
                <dt>Tid</dt>
	            {if $node.data_map.to_time.has_content}
	                {if $node.data_map.to_time.content.day|int()|eq( $node.data_map.from_time.content.day|int() )}
	                    <dd><time datetime="{$node.data_map.from_time.content.timestamp|datetime('custom', '%c')}">{$node.data_map.from_time.content.timestamp|l10n('shortdatetime')}</time> - <time datetime="{$node.data_map.to_time.content.timestamp|datetime('custom', '%c')}">{$node.data_map.to_time.content.timestamp|l10n('shorttime')}</time></dd>
	                {else}
	                    <dd><time datetime="{$node.data_map.from_time.content.timestamp|datetime('custom', '%c')}">{$node.data_map.from_time.content.timestamp|l10n('shortdate')}</time> - <time datetime="{$node.data_map.to_time.content.timestamp|datetime('custom', '%c')}">{$node.data_map.to_time.content.timestamp|l10n('shortdate')}</time></dd>
	                {/if}
			    {else}
			        <dd><time datetime="{$node.data_map.from_time.content.timestamp|datetime('custom', '%c')}">{$node.data_map.from_time.content.timestamp|l10n('shortdatetime')}</time></dd>
			    {/if}
			    {if $node.data_map.place.has_content}
			    <dt>Sted</dt>
			    <dd>{$node.data_map.place.content|wash()}</dd>
			    {/if}
            </dl>
        </aside>
    </div>
</div>
{undef $extra_class}