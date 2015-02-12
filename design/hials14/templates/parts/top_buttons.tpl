<ul class="nav nav-pills hials-btn pull-right">
    <li id="btnInsta" class="btnSocial hidden-xs hidden-sm"><a href="http://instagram.com/hials/" title="{'Instagram'|i18n('hials/design/parts/top_buttons')}"><i class="fa fa-instagram"></i></a></li>
    <li id="btnFace" class="btnSocial hidden-xs hidden-sm"><a href="https://www.facebook.com/hials" title="{'Facebook'|i18n('hials/design/parts/top_buttons')}"><i class="fa fa-facebook"></i></a></li>
    <li id="btnTweet" class="btnSocial hidden-xs hidden-sm"><a href="https://twitter.com/hials" title="{'Twitter'|i18n('hials/design/parts/top_buttons')}"><i class="fa fa-twitter"></i></a></li>
    <li id="btnSearch" class="dropdown yamm-fw hidden-xs"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-search"></i></a>
        <div class="dropdown-menu">
            <div class="directToMenu"></div>
            <div class="col-xs-12 col-sm-offset-3 col-sm-9 col-md-offset-6 col-md-6">
            {include uri='design:parts/search_google.tpl'}
            </div>
        </div>
        {* <form role="form" class="dropdown-menu" action="#" method="post">
            <div class="directToMenu">
	            <div class="searchOptGroup">
		            <label class="radio-inline"><input type="radio" name="searchOpt" id="searchOpt1" value="hials" checked disabled>{'hials.no'|i18n('hials/design/parts/top_buttons')}</label>
		            <label class="radio-inline"><input type="radio" name="searchOpt" id="searchOpt2" value="hials-ans" disabled>{'Employees'|i18n('hials/design/parts/top_buttons')}</label>
		            <label class="radio-inline"><input type="radio" name="searchOpt" id="searchOpt3" value="orio">Orio (Bibliotekstjeneste)</label>
	            </div>
            </div>
	        <fieldset class="col-xs-12 col-sm-offset-3 col-sm-9 col-md-offset-6 col-md-6">
	            <label><span class="hidden">{'Search'|i18n('hials/design/parts/top_buttons')}</span>
	                <input class="form-control" type="text" name="search" id="search-query" placeholder="{'Search not available yet'|i18n('hials/design/parts/top_buttons')}" disabled>
	            </label>
	        </fieldset>
	        <input type="hidden" name="RedirectURI" value="" />
        </form> *}
    </li>
</ul>
