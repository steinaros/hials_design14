<div class="zone-layout-{$zone_layout|downcase()}">
	<div class="row">
	    <div class="container-md-height colspacing">
	        <div class="row-md-height">
	            {if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
		            {foreach $zones[0].blocks as $block}
		                {include uri='design:parts/zone_block.tpl' zone=$zones[0]}
		            {/foreach}
	            {/if}
	            <div class="col-md-3 col-md-height bg-darkgray col-top boks">
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
	<div id=news class="row bg-white">
        {if and( is_set( $zones[3].blocks ), $zones[3].blocks|count() )}
            {foreach $zones[3].blocks as $block}
                {include uri='design:parts/zone_block.tpl' zone=$zones[3]}
            {/foreach}
        {/if}
    </div>
    <div class="row">
        <div class="container-sm-height colspacing">
            <div class="row-sm-height">
                <div class="col-sm-6 col-sm-height bg-red height180 col-middle text-center">
                    <p class="h2 front">14. august</p>
                    <p>Praktisk informasjon om studiestart</p>
                </div>
                <div class="col-sm-3 col-sm-height nopadding"><img src="{"tmp-frontpage/Faddere.jpg"|ezimage('no')}" alt="Faddere" class="img-responsive"></div>
                <div class="col-sm-3 col-sm-height nopadding"><img src="{"tmp-frontpage/Maritime-Human-Factors-Lab.jpg"|ezimage('no')}" alt="Båt" class="img-responsive"></div>
            </div>
            <div class="row-sm-height">
                <div class="col-sm-6 col-sm-height height180"></div>
                <div class="col-sm-3 col-sm-height col-middle text-center bg-white">
                    <p>text</p>
                </div>
                <div class="col-sm-3 col-sm-height col-middle text-center bg-white">
                    <p>text</p>
                </div>
            </div>
        </div>
    </div>    
</div>