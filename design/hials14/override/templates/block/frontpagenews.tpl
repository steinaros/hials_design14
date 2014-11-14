{def $valid_nodes = $block.valid_nodes}
<div class="row-sm-height block-type-content-grid block-view-{$block.view}">
    <div class="col-sm-6 col-sm-height nopadding">
    {if $valid_nodes.0.data_map.image.has_content}
        <a href="{$node.url_alias|ezurl( 'no' )}">
            {attribute_view_gui css_class='img-responsive' image_class=banner_half attribute=$valid_nodes.0.data_map.image}
        </a>
    {/if}
    </div>
    <div class="col-sm-6 col-sm-height col-top" itemscope itemtype="http://schema.org/Article">
        <article class="front headline">
            <h2 class="teaser-title" itemprop="name">{$valid_nodes.0.data_map.title.content|wash()}</h2>
            <div><time itemprop="datePublished" datetime="{$valid_nodes.0.object.published|datetime('custom', '%c')}">{$valid_nodes.0.object.published|l10n('shortdate')}</time><span itemprop="description">{attribute_view_gui attribute=$valid_nodes.0.data_map.intro}</span></div>
        </article>
        <div class="row">
            {foreach $valid_nodes as $item offset 1}
            <article class="col-sm-6" itemscope itemtype="http://schema.org/Article">
                <h2 class="teaser-title" itemprop="name"><a href="{$item.url_alias|ezurl( 'no' )}">{$item.data_map.title.content|wash()}</a></h2>
                <div><time itemprop="datePublished" datetime="{$item.object.published|datetime('custom', '%c')}">{$item.object.published|l10n('shortdate')}</time><span itemprop="description">{attribute_view_gui attribute=$item.data_map.intro}</span></div>
            </article>
            {/foreach}
        </div>
        <p class="text-right"><a href="{'Hoegskolen/Aktuelt/Nyhetsarkiv'|ezurl('no')}" title="{'More news'|i18n('hials/design/news')}">{'Newsarchive'|i18n('hials/design/news')}</a></p>
    </div>
</div>

{undef $valid_nodes}