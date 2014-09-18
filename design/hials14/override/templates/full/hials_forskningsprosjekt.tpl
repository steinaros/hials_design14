{* Forskningsprosjekt - Full view *}
{def $extra_class = ""}
<section class="content-view-full">
    <div class="row">
	    {if $node.data_map.image.has_content}
	    <aside class="col-sm-6 col-left">
	        {attribute_view_gui attribute=$node.data_map.image image_class=banner_half css_class=img-responsive}
	    </aside>
	    {else}
	        {set $extra_class = "col-sm-offset-3"}
	    {/if}
	    <article class="class-hials_innholdsside col-sm-6 col-right {$extra_class}">
	        <h1>{$node.data_map.title.content|wash()}</h1>
	        <h2 class="tematitle">{$node.data_map.tema_title.content|wash()}</h2>
	
	        {if $node.data_map.intro.content.is_empty|not}
	        <section class="intro">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </section>
	        {/if}
	        {include uri='design:parts/byline.tpl'}
	        
	        {if $node.data_map.description.content.is_empty|not}
	        <section class="bodytext">
	            {attribute_view_gui attribute=$node.data_map.description}
	        </section>
	        {/if}
	    </article>
	</div>
</section>