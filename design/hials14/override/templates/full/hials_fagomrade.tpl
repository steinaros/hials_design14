{* hials_fagomrade - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
<div class="content-view-full class-hials_fagomrade container">
    {* Fjernet 24.11.2014 SSJ Bilde kun i karusell *}
    {*if $node.data_map.banner.has_content}
    <div class="attribute-banner row">{attribute_view_gui attribute=$node.data_map.banner}</div>
    {/if*}
    
    <div class="row">
	    <div class="col-sm-offset-3 col-sm-6">
	        <div class="attribute-header">
	            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
	        </div>
	
	        {if $node.object.data_map.intro.has_content}
	        <div class="intro">
	            {attribute_view_gui attribute=$node.data_map.intro}
	        </div>
	        {/if}
	        {include uri='design:parts/byline.tpl'}
	                        
	        {if $node.data_map.description.content.is_empty|not}
	        <div class="bodytext">
	            {attribute_view_gui attribute=$node.data_map.description}
	        </div>
	        {/if}
	
	        {def $classes = array('hials_utdanningstilbud')
	             $nivaa_sortorder = array( '1', '0', '2', '5', '6', '4', '3')
	             $nivaa_sortorder_name = hash( 1, 'Master', 0, 'Bachelor', 2, 'Videreutdanning', 5, 'Årsstudium', 6, 'Enkeltemne', 4, 'Maritime kurs', 3, 'Kurs' )
	             $children = array()
	             $children_count = ''}
	
	        <div class="content-view-children">
	            {foreach $nivaa_sortorder as $nivaa_id}
	                {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
	                                                         'sort_by', array( 'attribute', true(), 317),
	                                                         'class_filter_type', 'include',
	                                                         'class_filter_array', $classes,
	                                                         'attribute_filter', array( array( 325, '=', $nivaa_id ) ) ) )}
	                {if gt($children|count(),0)}
	                <h2>{$nivaa_sortorder_name[$nivaa_id]}</h2>
	                {foreach $children as $child }
	                    {node_view_gui view='line' content_node=$child fagomrade=$node.data_map.name}
	                {/foreach}
	                {/if}
	            {/foreach}
	        </div>
	    </div>
    </div>
</div>
