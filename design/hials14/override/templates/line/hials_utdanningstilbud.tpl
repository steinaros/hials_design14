{* hials_utdanningstilbud - Line view *}
{def $content_size = '8'}

<div class="node-view-line">
    <article class="class-hials_utdanningstilbud row">

    {if $node.data_map.banner.has_content}
    <div class="span2">
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.banner}
        </div>
    </div>
        {set $content_size = '6'}
    {/if}

    <div class="span{$content_size}">
        <div class="attribute-header">
            <h2>
                <a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.data_map.title.content|wash()} - {$node.data_map.nivaa[0]} innen {$fagomrade|wash()}</a>
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