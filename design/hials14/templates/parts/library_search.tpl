<div role="tabpanel">
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#bib_search" aria-controls="bib_search" role="tab" data-toggle="tab">Oria</a></li>
    <li role="presentation"><a href="#bib_brage" aria-controls="bib_brage" role="tab" data-toggle="tab">{'Brage'|i18n('hials/design/library')}</a></li>
    <li role="presentation"><a href="#bib_scholar" aria-controls="bib_scholar" role="tab" data-toggle="tab">Google Scholar</a></li>
  </ul>
  <div class="tab-content hials-tab-content">
    <div role="tabpanel" class="tab-pane active" id="bib_search">
        <p>{'Search for title, author etc.'|i18n('hials/design/library')}</p>
        <form class="form-inline" role="form" action="http://www.oria.no/" enctype='application/x-www-form-urlencoded; charset=utf-8' method="post">
            <input name='institution' value='HAL' type='hidden'>
            <input name='vid' value='HAL' type='hidden'> 
            <input name='search_scope' value='default_scope' type='hidden'>
            <input name='lang' value='nor' type='hidden'> 
            <input type='hidden' value='true' name='afterPDS'>
            <input type='hidden' name='check' value='checked'>
            <div class="form-group" style="width:100%">
                <label class="sr-only" for="search-query-oria">{'Search'|i18n('hials/design/library')}</label>
                <input class="form-control" type="text" name="query" id="search-query-oria" placeholder="{'Search for title, author etc.'|i18n('hials/design/library')}" style="width:80%;">
                <button type="submit" value="Søk" class="btn btn-default">{'Search'|i18n('hials/design/library')}</button>
            </div>
        </form>
        <p><a href="http://bibsys-primo.hosted.exlibrisgroup.com/primo_library/libweb/action/myAccountMenu.do?vid=HAL">{'Log on Oria'|i18n('hials/design/library')}</a> | <a href="http://bibsys-primo.hosted.exlibrisgroup.com/primo_library/libweb/action/search.do?mode=Advanced&ct=AdvancedSearch">{'Advanced search'|i18n('hials/design/library')}</a></p>
    </div>
    <div role="tabpanel" class="tab-pane" id="bib_brage">
        <p>{'Search for title, author etc.'|i18n('hials/design/library')}</p>
        <form class="form-inline" role="form" action="http://brage.bibsys.no/xmlui/handle/11250/92929/discover" method="post">
            <div class="form-group" style="width:100%">
                <label class="sr-only" for="search-query-brage">{'Search'|i18n('hials/design/library')}</label>
                <input class="form-control" type="search" name="query" id="search-query-brage" placeholder="{'Search for title, author etc.'|i18n('hials/design/library')}" style="width:80%;">
                <button type="submit" class="btn btn-default">{'Search'|i18n('hials/design/library')}</button>
            </div>
        </form>
        <p>&nbsp;</p>
    </div>
    <div role="tabpanel" class="tab-pane" id="bib_scholar">
        <p>{'Search for title, author etc.'|i18n('hials/design/library')}</p>
        <form class="form-inline" role="form" action="https://scholar.google.com/scholar" method="get" name="gs" accept-charset="utf-8">
            <input name="hl" value="no" type="hidden">
            <div class="form-group" style="width:100%">
                <label class="sr-only" for="search-query">{'Search'|i18n('hials/design/library')}</label>
                <input class="form-control"name="q" type="text" maxlength="2048" placeholder="{'Search for title, author etc.'|i18n('hials/design/library')}" style="width:80%;">
                <button name="btnG" type="submit" class="btn btn-default">{'Search'|i18n('hials/design/library')}</button>
            </div>
        </form>
        <p>&nbsp;</p>        
    </div>
  </div>
</div>
