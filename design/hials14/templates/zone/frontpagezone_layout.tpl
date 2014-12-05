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
    <div id="fagomraade-links" class="row">
        <div class="col-xs-12">
            {include uri='design:parts/frontpage_nav-links.tpl'}
		</div>
    </div>   
	<div id="news" class="row bg-white">
        {if and( is_set( $zones[3].blocks ), $zones[3].blocks|count() )}
            {foreach $zones[3].blocks as $block}
                {include uri='design:parts/zone_block.tpl' zone=$zones[3]}
            {/foreach}
        {/if}
    </div>
    <div id="boxzone" class="row">
        {if and( is_set( $zones[2].blocks ), $zones[2].blocks|count() )}
            {foreach $zones[2].blocks as $block}
                {include uri='design:parts/zone_block.tpl' zone=$zones[2]}
            {/foreach}
        {/if}
    </div>    
    <div id="bottomzone" class="row">
        {if and( is_set( $zones[4].blocks ), $zones[4].blocks|count() )}
            {foreach $zones[4].blocks as $block}
                {include uri='design:parts/zone_block.tpl' zone=$zones[4]}
            {/foreach}
        {/if}
    </div>    
</div>