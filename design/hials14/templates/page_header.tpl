<header role="banner">
    {if ge(currentdate()|datetime( 'custom', '%Y' ), 2015)}<div id="pagealert" class="row"><div class="alert alert-danger" role="alert">{'January 1st 2016 we merged with NTNU. <strong>This page will no longer be updated.</strong> You will find updated information at <a href="http://www.ntnu.no/">www.ntnu.no</a>.'|i18n('hials/design/pagelayout')}</div></div>{/if}
    <div id="quicklinks" class="row hidden-xs">
    {include uri='design:page_header_links.tpl'}
    </div>
    
    <nav id="mainnav" role="navigation" class="row">
        <div class="navbar navbar-hials yamm" id="mainDropdown">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target="#navbar-collapse-grid" class="navbar-toggle collapsed" aria-expanded="false" aria-controls="navbar-collapse-grid"><span class="sr-only">{'Toggle navigation'|i18n('hials/design/pagelayout')}</span><i class="fa fa-bars fa-2x"></i></button>
                <button type="button" data-toggle="collapse" data-target="#searchMenu" class="navbar-toggle collapsed" aria-expanded="false" aria-controls="searchMenu"><i class="fa fa-search fa-2x"></i></button>         
                {include uri='design:page_header_logo.tpl'}
            </div>
            {include uri='design:parts/top_buttons.tpl'}
            {include uri='design:menu/top_menu.tpl'}
            {include uri='design:menu/search_menu.tpl'}
        </div>
    </nav>
{*
    <div class="container">
        <nav class="navbar navbar-default" role="navigation" id="hials-extranav">
            <div class="navbar-collapse row">
                {include uri='design:page_header_links.tpl'}
            </div>
        </nav>
        <nav class="navbar navbar-default" role="navigation" id="hials-mainnav">
            <div class="navbar-collapse row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#hials-navbar-main">
                        <span class="sr-only">Toggle navigation</span>
                        
                    </button>
                    {include uri='design:page_header_logo.tpl'}
                </div>
            </div>
            
            
        </div>
    </div>
    *}
</header>