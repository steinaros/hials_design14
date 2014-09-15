{* Utdanningstilbud - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $spesialiseringer = fetch_alias('children', hash( 'parent_node_id', $node.node_id,
                                              'class_filter_type', 'include',
                                              'class_filter_array', array( 'hials_spesialisering' ) ) )}
<section class="content-view-full">
    {if $node.data_map.banner.has_content}
    <div class="attribute-banner row equal">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    
    <div class="row">
	    <article class="class-hials_utdanningstilbud col-sm-6">
	        <h2><span class="utdanningsnivaa">{$node.data_map.nivaa.class_content.options[$node.data_map.nivaa.content[0]].name|wash()}</span> innen <span class="fagomraade">{$node.parent.data_map.name.content|wash()}</span></h2>
	        <h1>{$node.data_map.title.content|wash()}</h1>
	
	        {if $node.data_map.intro.content.is_empty|not}
	        <section class="intro">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </section>
	        {/if}
	        
	        <section class="byline">
                <p><span class="articlemodified">{'Modified'|i18n('design/hials')} <time>{$node.modified|l10n('shortdatetime')}</time></span>&emsp;<span class="sharebuttons">{'Share'|i18n('design/hials')} <i class="fa fa-share-alt"></i></span></p>	           
	        </section>
	            
	        {if $node.data_map.description.content.is_empty|not}
	        <section class="bodytext">
	            {attribute_view_gui attribute=$node.data_map.description}
	        </section>
	        {/if}
	        
	        {if $spesialiseringer|count()}
	        <h3>Tilgjengelige spesialiseringer:</h3>
	        <ul>
	        {foreach $spesialiseringer as $item}
	            <li><a href="{$item.url_alias|ezurl( 'no' )}">{$item.name|wash()}</a></li>
	        {/foreach}
	        </ul>
	        {/if}
	    </article>
	    <aside class="col-sm-6">
	        <div class="attribute-bokser">
	            {attribute_view_gui attribute=$node.data_map.bokser container_node=$node}
	        </div>
	        {if $node.data_map.contacts.has_content}
	        <div class="attribute-contacts">
	            {attribute_view_gui attribute=$node.data_map.contacts}
	        </div>
	        {/if}
	    </aside>
    </div>   
</section>
{undef $spesialieringer}