{* Dokument - Full view *}
<div class="content-view-full class-dokument">
    <div class="row">
        <article class="col-sm-9 col-right col-sm-push-3">
            <h1>{$node.name|wash()}</h1>

		    {if $node.data_map.description.is_empty|not}
		    <div class="intro">
		       {attribute_view_gui attribute=$node.data_map.description}
		    </div>
		    {/if}
		    {include uri='design:parts/byline.tpl'}
		    <div class="bodytext">
		       {attribute_view_gui attribute=$node.data_map.text}
		    </div>

	        {if $node.data_map.file.has_content}
	           {attribute_view_gui view='line' attribute=$node.data_map.file}
	        {/if}
        </article>
        <aside class="col-sm-3 col-sm-pull-9 hidden-print">
            {include uri='design:menu/leftmenu.tpl'}
        </aside>
    </div>
</div>
