{def $article_extra_classes = array('col-sm-6')
     $aside_extra_classes = array()}
{if $node.data_map.image.has_content}
    {set $article_extra_classes = $article_extra_classes|append('col-sm-push-6')}
    {set $aside_extra_classes = array('col-sm-6', 'col-sm-pull-6')}
{else}
    {set $article_extra_classes = $article_extra_classes|append('col-sm-push-3')}
    {set $aside_extra_classes = array('col-sm-3', 'col-sm-pull-6')}
{/if}

<!-- DesignKeys:used {$DesignKeys:used|attribute('show',2,'text')}
     Site: {$site|attribute('show',2,'text')}
-->

<div class="zone-layout-{$zone_layout|downcase()}">
{if and( is_set( $zones[2].blocks ), $zones[2].blocks|count() )}
    <aside>
    {foreach $zones[2].blocks as $block}
        {include uri='design:parts/zone_block.tpl' zone=$zones[2]}
    {/foreach}
    </aside>
{/if}
<div class="row">   
    <article class="col-sm-6 col-sm-push-6 col-right">
        {if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
        {foreach $zones[1].blocks as $block}
            {include uri='design:parts/zone_block.tpl' zone=$zones[1]}
        {/foreach}
        {/if}
    </article>
    <aside class="col-sm-6 col-sm-pull-6 col-left">
        {if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
        {foreach $zones[0].blocks as $block}
            {include uri='design:parts/zone_block.tpl' zone=$zones[0]}
        {/foreach}
        {/if}
    </aside>
</div>
