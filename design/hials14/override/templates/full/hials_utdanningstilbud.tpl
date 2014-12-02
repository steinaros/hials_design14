{* Utdanningstilbud - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
{def $spesialiseringer = fetch_alias('children', hash( 'parent_node_id', $node.node_id,
                                              'class_filter_type', 'include',
                                              'class_filter_array', array( 'hials_spesialisering' ) ) )}
<div class="content-view-full container">
    {if $node.data_map.banner.has_content}
    <div class="attribute-banner row">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if}
    
    <div class="row">
	    <article class="class-hials_utdanningstilbud col-sm-6 col-left" itemscope itemtype="http://schema.org/Article">
	        <h2><span class="utdanningsnivaa">{$node.data_map.nivaa.class_content.options[$node.data_map.nivaa.content[0]].name|wash()}</span>{if eq($node.parent.class_identifier,'hials_fagomrade')} {"in"|i18n('hials/design/utdanning')} <span class="fagomraade">{$node.parent.data_map.name.content|wash()}</span>{/if}</h2>
	        <h1 itemprop="name">{$node.data_map.title.content|wash()}</h1>
	
	        {if $node.data_map.intro.content.is_empty|not}
	        <div class="intro" itemprop="description">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </div>
	        {/if}
	        
            {include uri='design:parts/byline.tpl'}
            	            
	        {if $node.data_map.description.content.is_empty|not}
	        <div class="bodytext" itemprop="text">
	            {attribute_view_gui attribute=$node.data_map.description}
	        </div>
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
	    <aside class="col-sm-6 col-right">
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
</div>
{undef $spesialieringer}