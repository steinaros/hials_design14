<nav class="col-sm-12" role="navigation">
	<ul class="nav nav-pills pull-right">                
	    <li id="contact"><a href={""|ezurl} title="{'Contact us'|i18n('hials/design/pagelayout')}">{'Contact us'|i18n('hials/design/pagelayout')}</a></li>
	    <li id="positions"><a href={""|ezurl} title="{'Vacant positions'|i18n('hials/design/pagelayout')}">{'Vacant positions'|i18n('hials/design/pagelayout')}</a></li>
	    <li id="sitemap"><a href={concat("/content/view/sitemap/", $pagedata.root_node)|ezurl} title="{'Site map'|i18n('hials/design/pagelayout')}">{'Site map'|i18n('hials/design/pagelayout')}</a></li>
        <li id="langEng"><a href={"/eng"|ezurl} title="English">EN</a></li>
        <li id="langNor"><a href={"/nor"|ezurl} title="Norsk">NO</a></li>
{* Fjernet inntil vanlige brukere har en grunn til å logge på sidene...
	{if $current_user.is_logged_in}
	    <li id="myprofile"><a href={"/user/edit/"|ezurl} title="{'My profile'|i18n('hials/design/pagelayout')}">{'My profile'|i18n('hials/design/pagelayout')}</a></li>
	    <li id="logout"><a href={"/user/logout"|ezurl} title="{'Logout'|i18n('hials/design/pagelayout')}">{'Logout'|i18n('hials/design/pagelayout')} ( {$current_user.contentobject.name|wash} )</a></li>
	{else}
	    <li id="login" class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">{'Login'|i18n('hials/design/pagelayout')}<span class="caret"></span></a>
	        <form class="dropdown-menu" action="{'/user/login'|ezurl( 'no' )}" method="post">
	            <fieldset>
	                <label>
	                    <span class="hidden">{'Username'|i18n('hials/design/pagelayout')}</span>
	                    <input type="text" name="Login" id="login-username" placeholder="Username">
	                </label>
	                <label>
	                    <span class="hidden">{'Password'|i18n('hials/design/pagelayout')}</span>
	                    <input type="password" name="Password" id="login-password" placeholder="Password">
	                </label>
	                <div class="clearfix">
	                    <a href="{'/user/forgotpassword'|ezurl( 'no' )}" class="forgot-password">{'Forgot your password?'|i18n('hials/design/pagelayout')}</a>
	                    <button class="btn btn-warning pull-right" type="submit">
	                        {'Login'|i18n('hials/design/pagelayout')}
	                    </button>
	                </div>
	            </fieldset>
	            <input type="hidden" name="RedirectURI" value="" />
	        </form>
	    </li>
	{/if} *}
	</ul>
</nav>
