<header role="banner">
    {if ge(currentdate()|datetime( 'custom', '%Y' ), 2016)}<div id="pagealert" class="row"><div class="alert alert-danger" role="alert">{'January 1st 2016 we merged with NTNU. <strong>This page will no longer be updated.</strong> You will find updated information at <a href="http://www.ntnu.no/">www.ntnu.no</a>. Currently a student in Ålesund? Bookmark the new <a href="https://innsida.ntnu.no/studenter-i-alesund?p_p_id=82&p_p_lifecycle=1&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=3&_82_struts_action=%2Flanguage%2Fview&_82_redirect=%2Fstudenter-i-alesund&_82_languageId=en_GB">page for student information and tools</a>. <strong>NB!</strong> Information for exchange students is still valid on this site.'|i18n('hials/design/pagelayout')}</div></div>{/if}
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
            {*include uri='design:parts/top_buttons.tpl'*} {* REMOVE BUTTONS - NTNU-merger *}
            {include uri='design:menu/top_menu.tpl'}
            {*include uri='design:menu/search_menu.tpl'*} {* REMOVE SEARCHMENU - NTNU-merger *}
        </div>
    </nav>
</header>