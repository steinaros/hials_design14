{* hials_utdanningstilbud - Line view *}

<article class="media node-view-line class-hials_utdanningstilbud">
    {if $node.data_map.banner.has_content}
   
    {def $banner = fetch( 'content', 'node', hash( 'node_id', $node.data_map.banner.content.relation_list.0.node_id ) ) }

    <a class="pull-left" href="{$node.url_alias|ezurl( 'no' )}">
        {attribute_view_gui image_class=articlethumbnail attribute=$banner.data_map.image}
    </a>
    {/if}

    <div class="media-body">
        <h2 class="media-heading"><a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.data_map.title.content|wash()} - {$node.data_map.nivaa.class_content.options[$node.data_map.nivaa.content[0]].name|wash()} innen {$node.parent.data_map.name.content|wash()}</a></h2>
        {if $node.data_map.intro.content.is_empty|not}
        <div class="attribute-intro">
            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
        {/if}
    </div>
</article>
{undef $content_size $banner}