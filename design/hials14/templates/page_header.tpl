<header role="banner">
    <section id="quicklinks" class="row hidden-xs">
    {include uri='design:page_header_links.tpl'}
    </section>
    
    <nav id="mainnav" role="navigation" class="row">
        <div class="navbar navbar-hials yamm" id="myDropdown">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target="#navbar-collapse-grid" class="navbar-toggle collapsed"><span class="sr-only">Toggle navigation</span><i class="fa fa-bars fa-2x"></i></button>         
                {include uri='design:page_header_logo.tpl'}
            </div>
            {include uri='design:menu/top_menu.tpl'}
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
            
            {include uri='design:parts/top_buttons'}
        </div>
    </div>
    *}
</header>