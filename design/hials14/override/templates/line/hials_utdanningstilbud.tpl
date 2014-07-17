{* hials_utdanningstilbud - Line view *}
{def $content_size = '12'}

<div class="node-view-line">
    <article class="class-hials_utdanningstilbud">

    {if $node.data_map.banner.has_content}
    
    <!-- Banner: {$node.data_map.banner|attribute('show', 2, 'text')} -->
    {set $banner_object = $node.data_map.banner.object}
    
    <!-- Object: {$banner_object|attribute('show', 2, 'text')} -->
    
    <div class="col-sm-4">
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.banner.object.data_map.image}
        </div>
    </div>
        {set $content_size = '8'}
    {/if}

    <div class="col-sm-{$content_size}">
        <div class="attribute-header">
            <h2>
                <a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.data_map.title.content|wash()} - {$node.data_map.nivaa.class_content.options[$node.data_map.nivaa.content[0]].name|wash()} innen {$node.parent.data_map.name.content|wash()}</a>
            </h2>
        </div>

        {if $node.data_map.intro.content.is_empty|not}
        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
        {/if}
    </div>

    </article>
</div>

{undef $content_size}