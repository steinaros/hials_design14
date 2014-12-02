{if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
<div class="zone-layout-{$zone_layout|downcase()}">
    <div class="container">
        <div class="row">
		{foreach $zones[0].blocks as $block}
		    {include uri='design:parts/zone_block.tpl' zone=$zones[0] container_node=$container_node}
		{/foreach}
		</div>
    </div>
</div>
{/if}