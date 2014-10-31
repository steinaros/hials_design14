{if not(is_set($menuitem))}{def $menuitem = 0}{/if}
{def $classes = array('hials_utdanningstilbud')
     $nivaa_sortorder = array( '0', '1', '2', '5', '4', '3')
     $nivaa_names = hash( 0, 'Bachelor', 1, 'Master', 2, 'Videreutdanning', 5, 'Årsstudium', 4, 'Maritime kurs', 3, 'Kurs' )
     $utdanninger = array()
     $utdanning_width = array()
     $utdanning_count = ''
     $col_width = 2
     $fagomraader = array()}

{set $fagomraader = fetch( 'content', 'list', hash( 'parent_node_id', $menuitem,
                                                    'sort_by', $node.sort_array,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'hials_fagomrade' ) ) )} 


<div class="col-sm-2">
    <ul class="nav nav-pills nav-stacked" role="tablist">
        {foreach $nivaa_sortorder as $nivaa_id}
            {foreach $fagomraader as $fagomrade}
        <li role="presentation" class="active"><a href="{concat('#utdnivaa_', $nivaa_id)}" role="tab" data-toggle="tab">{$nivaa_names[$nivaa_id]|wash()}</a></li>
            {set $utdanninger[$nivaa_id][$fagomrade.node_id] = fetch( 'content', 'list', hash( 'parent_node_id', $fagomrade.node_id,
                                             'sort_by', array( 'attribute', true(), 317),
                                             'class_filter_type', 'include',
                                             'class_filter_array', $classes,
                                             'attribute_filter', array( array( 325, '=', $nivaa_id ) ) ) )}
	   {/foreach}
	</ul>
</div>
<div class="tab-content col-sm-10">
{foreach $nivaa_sortorder as $nivaa_id}
    <div role="tabpanel" class="tab-pane active" id="{concat('utdnivaa_', $nivaa_id)}">
        <ul class="submenu col-sm-2">
            <li class="submenuhead"><a href="#">{$nivaa_names[$nivaa_id]|wash()}</a></li>
            <li><a href="#">Biomarin innovasjon</a></li>
            <li><a href="#">Bioteknologi</a></li>
            <li><a href="#">Bioingeniør</a></li>
        </ul>
    </div>
{/foreach}
</div>

<!-- {$utdanninger|attribute('show', 3, 'text')} -->

{*undef $classes $nivaa_sortorder $nivaa_names $utdanninger $utdanning_width $utdanning_count $col_width $fagomraader*}