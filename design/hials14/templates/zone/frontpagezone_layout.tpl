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
	                <h2 class="front">Kalender</h2>
	                <dl>
	                    <dt>
	                        <time datetime="2014-04-07">07.04.14</time>
	                    </dt>
	                    <dd>Valg i studentparlamentet</dd>
	                    <dt>
	                        <time datetime="2014-04-08">08.04.14</time>
	                    </dt>
	                    <dd>Kurs: Marine lipider</dd>
	                    <dt>
	                        <time datetime="2014-04-08">08.04.14</time>
	                    </dt>
	                    <dd>Møte i <abbr title="Hva står AMU for?">AMU</abbr></dd>
	                    <dt>
	                        <time datetime="2014-04-08">08.04.14</time>
	                    </dt>
	                    <dd>Kurs: Marine lipider</dd>
	                    <dt>
	                        <time datetime="2014-04-08">08.04.14</time>
	                    </dt>
	                    <dd>Møte i <abbr title="Hva står AMU for?">AMU</abbr></dd>
	                </dl>
	                <p class="text-right"><a href="#" title="Flere hendelser">Se flere</a></p>
	                <h2 class="front">Verktøy</h2>
	                <ul class="toolmenu">
	                    <li><a href="#">Aktiver/administrer studentkonto</a></li>
	                    <li><a href="#">Studentweb</a></li>
	                    <li><a href="#">Fronter</a></li>
	                    <li><a href="#">E-post</a></li>
	                    <li><a href="#">Romreservasjon</a></li>
	                    <li><a href="#">Timeplan</a></li>
	                    <li><a href="#">Studiehåndbok</a></li>
	                </ul>
	                <p class="text-right"><a href="#" title="Flere verktøy">Se flere</a></p>
	            </div>
	        </div>
	    </div>
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
	<div id=news class="row">
	    <p class="h1 front">{'News'|i18n('hials/design/news')}</p>
	    <div class="row bg-white">
	        <div class="container-sm-height colspacing">
                {if and( is_set( $zones[3].blocks ), $zones[3].blocks|count() )}
                    {foreach $zones[3].blocks as $block}
                        {include uri='design:parts/zone_block.tpl' zone=$zones[3]}
                    {/foreach}
                {/if}
	        </div>
	    </div>
    </div>
</div>