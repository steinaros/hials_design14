{def $contact_node_id = ezini( 'HialsContentNodeIDs', 'KontaktOssID', 'hials.ini' )
     $vacancy_node_id = ezini( 'HialsContentNodeIDs', 'LedigeStillingerID', 'hials.ini' )
     $library_node_id = ezini( 'HialsContentNodeIDs', 'BibliotekID', 'hials.ini' )
     $employees_node_id = ezini( 'HialsContentNodeIDs', 'ForAnsatteID', 'hials.ini' )}
{def $contact_node = fetch( 'content', 'node', hash( 'node_id', $contact_node_id ) )
     $vacancy_node = fetch( 'content', 'node', hash( 'node_id', $vacancy_node_id ) )
     $library_node = fetch( 'content', 'node', hash( 'node_id', $library_node_id ) )
     $employees_node = fetch( 'content', 'node', hash( 'node_id', $employees_node_id ) )}
<nav class="col-sm-12" role="navigation">
	<ul class="nav nav-pills pull-right">                
	    {if $contact_node}<li><a href={$contact_node.url_alias|ezurl} title="{'Contact us'|i18n('hials/design/pagelayout')}">{'Contact us'|i18n('hials/design/pagelayout')}</a></li>{/if}
	    {if $vacancy_node}<li><a href={$vacancy_node.url_alias|ezurl} title="{'Vacant positions'|i18n('hials/design/pagelayout')}">{'Vacant positions'|i18n('hials/design/pagelayout')}</a></li>{/if}
	    {if $library_node}<li><a href={$library_node.url_alias|ezurl} title="{'Library'|i18n('hials/design/pagelayout')}">{'Library'|i18n('hials/design/pagelayout')}</a></li>{/if}
	    {if $employees_node}<li><a href={$employees_node.url_alias|ezurl} title="{'For employees'|i18n('hials/design/pagelayout')}">{'For employees'|i18n('hials/design/pagelayout')}</a></li>{/if}
	    {*<li id="sitemap"><a href={concat("/content/view/sitemap/", $pagedata.root_node)|ezurl} title="{'Site map'|i18n('hials/design/pagelayout')}">{'Site map'|i18n('hials/design/pagelayout')}</a></li>*}
        <li id="langEng"><a href="/eng" title="English">EN</a></li>
        <li id="langNor"><a href="/" title="Norsk">NO</a></li>
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
