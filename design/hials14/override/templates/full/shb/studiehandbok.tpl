{* Studiehandbok - Full view *}
<div class="content-view-full class-studiehandbok">
    <div class="row">
        <div class="col-sm-6 col-sm-push-3">
            <h1>{attribute_view_gui attribute=$node.data_map.tittel}</h1>
            <div class="intro">
                {attribute_view_gui attribute=$node.data_map.nettsidetekst}
            </div>
        </div>
        <aside class="col-sm-3 col-sm-pull-6">
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
    </div>
</div>            