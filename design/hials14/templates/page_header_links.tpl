<ul class="nav nav-pills">
    <li id="contact"><a href={""|ezurl} title="{'Contact us'|i18n('design/hials/pagelayout')}">{'Contact us'|i18n('design/hials/pagelayout')}</a></li>
    <li id="positions"><a href={""|ezurl} title="{'Vacant positions'|i18n('design/hials/pagelayout')}">{'Vacant positions'|i18n('design/hials/pagelayout')}</a></li>
    <li id="sitemap"><a href={concat("/content/view/sitemap/", $pagedata.root_node)|ezurl} title="{'Site map'|i18n('design/hials/pagelayout')}">{'Site map'|i18n('design/hials/pagelayout')}</a></li>
{if $current_user.is_logged_in}
    <li id="myprofile"><a href={"/user/edit/"|ezurl} title="{'My profile'|i18n('design/hials/pagelayout')}">{'My profile'|i18n('design/hials/pagelayout')}</a></li>
    <li id="logout"><a href={"/user/logout"|ezurl} title="{'Logout'|i18n('design/hials/pagelayout')}">{'Logout'|i18n('design/hials/pagelayout')} ( {$current_user.contentobject.name|wash} )</a></li>
{else}
    <li id="login" class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">{'Login'|i18n('design/hials/pagelayout')}<span class="caret"></span></a>
        <form class="dropdown-menu col-md-3" action="{'/user/login'|ezurl( 'no' )}" method="post">
            <fieldset>
                <label>
                    <span class="hidden">{'Username'|i18n('design/hials/pagelayout')}</span>
                    <input type="text" name="Login" id="login-username" placeholder="Username">
                </label>
                <label>
                    <span class="hidden">{'Password'|i18n('design/hials/pagelayout')}</span>
                    <input type="password" name="Password" id="login-password" placeholder="Password">
                </label>
                <div class="clearfix">
                    <a href="{'/user/forgotpassword'|ezurl( 'no' )}" class="forgot-password">{'Forgot your password?'|i18n('design/hials/pagelayout')}</a>
                    <button class="btn btn-warning pull-right" type="submit">
                        {'Login'|i18n('design/hials/pagelayout')}
                    </button>
                </div>
            </fieldset>
            <input type="hidden" name="RedirectURI" value="" />
        </form>
    </li>
{/if}
</ul>
