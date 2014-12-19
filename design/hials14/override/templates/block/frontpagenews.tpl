{def $valid_nodes = $block.valid_nodes}
<div class="block-type-content-grid block-view-{$block.view} row-wrapper">
    <div class="col-sm-6 highlighted-image">
    {if $valid_nodes.0.data_map.image.has_content}
        <a title="{$valid_nodes.0.data_map.title.content|wash()}" href="{$valid_nodes.0.url_alias|ezurl( 'no' )}">
            {attribute_view_gui css_class='img-responsive' image_class=banner_half attribute=$valid_nodes.0.data_map.image}
        </a>
    {/if}
    </div>
    <div class="col-sm-6 col-top" itemscope itemtype="http://schema.org/Article">
        <article class="front headline">
            <span class="glyphicon glyphicon-chevron-left hidden-xs" style="position: absolute;font-size: 28px;color: #f1f1f1;margin-top: 35px;left:-22px;"></span>
            <h2 class="teaser-title" itemprop="name"><a href="{$valid_nodes.0.url_alias|ezurl( 'no' )}">{$valid_nodes.0.data_map.title.content|wash()}</a></h2>
            <div class="teaser-intro"><time itemprop="datePublished" datetime="{$valid_nodes.0.object.published|datetime('custom', '%c')}">{$valid_nodes.0.object.published|l10n('shortdate')}</time><div itemprop="description">{attribute_view_gui attribute=$valid_nodes.0.data_map.intro}</div></div>
        </article>
        <div class="row">
            {foreach $valid_nodes as $item offset 1}
            <article class="col-sm-6" itemscope itemtype="http://schema.org/Article">
                <h2 class="teaser-title" itemprop="name"><a href="{$item.url_alias|ezurl( 'no' )}">{$item.data_map.title.content|wash()}</a></h2>
                <div class="teaser-intro"><time itemprop="datePublished" datetime="{$item.object.published|datetime('custom', '%c')}">{$item.object.published|l10n('shortdate')}</time><div itemprop="description">{attribute_view_gui attribute=$item.data_map.intro}</div></div>
            </article>
            {/foreach}
        </div>
        <div class="text-right"><a href="{'Hoegskolen/Aktuelt/Nyhetsarkiv'|ezurl('no')}" title="{'More news'|i18n('hials/design/news')}">{'Newsarchive'|i18n('hials/design/news')}</a></div>
    </div>
</div>

{undef $valid_nodes}