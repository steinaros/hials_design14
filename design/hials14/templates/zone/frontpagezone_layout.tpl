<div class="zone-layout-{$zone_layout|downcase()}">
	<div class="row">
	    <div class="container-md-height colspacing">
	        <div class="row-md-height">
	            {if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
		            {foreach $zones[0].blocks as $block}
		                {include uri='design:parts/zone_block.tpl' zone=$zones[0]}
		            {/foreach}
	            {/if}
	            <div id="fronttool" class="col-md-3 col-md-height bg-darkgray col-top boks">
                    <div class="row">
	                    <div class="col-md-12 col-xs-6">
                            {include uri='design:parts/frontpage_eventlist.tpl'}
		                </div>
		                <div class="col-md-12 col-xs-6">
                            {include uri='design:parts/frontpage_toolslist.tpl'}
		                </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	{if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
    <div class="row">
        {foreach $zones[1].blocks as $block}
            {include uri='design:parts/zone_block.tpl' zone=$zones[1]}
        {/foreach}
    </div>
    {/if}
    {if and( is_set( $zones[3].blocks ), $zones[3].blocks|count() )}
	<div id="news" class="row bg-white">
        {foreach $zones[3].blocks as $block}
            {include uri='design:parts/zone_block.tpl' zone=$zones[3]}
        {/foreach}        
    </div>
    {/if}
    {if and( is_set( $zones[2].blocks ), $zones[2].blocks|count() )}
    <div id="boxzone" class="row">
        {foreach $zones[2].blocks as $block}
            {include uri='design:parts/zone_block.tpl' zone=$zones[2]}
        {/foreach}
    </div>
    {/if}
    {if and( is_set( $zones[4].blocks ), $zones[4].blocks|count() )}    
    <div id="bottomzone" class="row">
        {foreach $zones[4].blocks as $block}
            {include uri='design:parts/zone_block.tpl' zone=$zones[4]}
        {/foreach}
    </div>
    {/if}
</div>