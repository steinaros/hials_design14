{if is_set( $container_node )}<!-- Container node seen in utdanningsbokslayout.tpl -->{/if}
<section class="content-view-block content-view-aside">
    {if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
    {foreach $zones[0].blocks as $block}
        {include uri='design:parts/zone_block.tpl' zone=$zones[0] container_node=$container_node}
    {/foreach}
    {/if}
</section>
