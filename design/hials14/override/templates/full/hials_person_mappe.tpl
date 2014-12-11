{* Persongruppering - Full view *}
{def $menu_root = $node.path_array[4]
     $mainnode_id = $node.main_node_id
     $FINN_FRAM_nodeid = 345
     $class_filter = array( 'hials_person_mappe' )
     $menu_tree=fetch( 'content', 'list', hash( 'parent_node_id', $menu_root,
                                          'class_filter_type', 'include',
                                          'class_filter_array', $class_filter ) )
     $persons = fetch( 'content', 'tree', hash( 'parent_node_id', $mainnode_id,
                                                'class_filter_type', 'include',
                                                'class_filter_array', array( 'hials_person' ),
                                                'sort_by', array( 
                                                    array( 'attribute', true(), 'hials_person/last_name' ),
                                                    array( 'attribute', true(), 'hials_person/first_name' ) ) ) )
    $FINN_FRAM = fetch('content', 'node', hash( 'node_id', $FINN_FRAM_nodeid ))
    $tmp_office = ''
    $tmp_phone = ''
    $tmp_mobile = ''
    $tmp_phone_formatted = ''
    $tmp_mobile_formatted = ''
    $table_summary = concat('Employees at'|i18n('hials/design/person'), ' ', 'Aalesund University College'|i18n('hials/design/std'))}
    
<!-- 
{$node.data_map.menutitle|attribute('show',2,'text')}
{is_set($node.data_map.menutitle)}
{is_set($node.data_map.menutitle.content)}
{is_array($node.data_map.menutitle)}
{is_array($node.data_map.menutitle.content)}
{is_object($node.data_map.menutitle)}
-->    
<div class="hidden-xs">
    <ul class="nav nav-pills hials-subnav-pills">
    {foreach $menu_tree as $item}
      <li role="presentation"{if eq($item.node_id, $node.node_id)} class="active"{/if}><a href="{$item.url_alias|ezurl( 'no' )}"><span class="text">{'Employees at'|i18n('hials/design/person')} {cond($item.data_map.menutitle.has_content, $item.data_map.menutitle.content|wash()|downcase(), $item.data_map.title.content|wash() )}</span><span class="glyphicon glyphicon-chevron-right"></span></a></li>
    {/foreach}
    </ul>           
</div>
<div class="content-view-full row">
    <article class="class-hials_person_mappe col-sm-12">
        <h1>{cond($node.data_map.menutitle.has_content, $node.data_map.menutitle.content|wash(), $node.data_map.title.content|wash())}</h1>
                                                
{if $persons|count()}
    {if and( ne($menu_root, $node.node_id), $item.data_map.menutitle.has_content)}
        {set $table_summary = concat('Employees at'|i18n('hials/design/person'), ' ', $node.data_map.menutitle.content|wash()|downcase() )}
    {elseif ne($menu_root, $node.node_id)}
        {set $table_summary = concat('Employees at'|i18n('hials/design/person'), ' ', $node.name|wash()|downcase() )}
    {/if}
        <div class="table-responsive">
		<table class="table table-striped" summary="{$table_summary}" width="100%">
		<tbody>
		    <tr>
		        <th scope="col" valign="top">{'Name'|i18n('hials/design/std')}</th>
		        <th scope="col" valign="top">{'Title'|i18n('hials/design/std')}</th>
		        <th scope="col" valign="top">{'E-mail'|i18n('hials/design/std')}</th>
		        <th scope="col" valign="top">{'Office'|i18n('hials/design/std')}</th>
		        <th scope="col" valign="top">{'Telephone'|i18n('hials/design/std')}</th>
		        <th scope="col" valign="top">{'Mobile'|i18n('hials/design/std')}</th>
		    </tr>
{foreach $persons as $person}
    {set $tmp_office = $person.data_map.office.content|explode( ' ' )|implode('')
         $tmp_phone = $person.data_map.phone.content|explode( ' ' )|implode('')
         $tmp_mobile = $person.data_map.mobile.content|explode( ' ' )|implode('')}
    {set $tmp_mobile_formatted = $tmp_mobile
         $tmp_phone_formatted = $tmp_phone}
    {if and( ne($tmp_phone|extract_left(1), '+'), eq($tmp_phone|count(), 8))}
        {set $tmp_phone = concat('+47', $tmp_phone)}
        {set $tmp_phone_formatted = concat($tmp_phone|extract(0,3), '&nbsp;', $tmp_phone|extract(3,2), '&nbsp;', $tmp_phone|extract(5,2), '&nbsp;', $tmp_phone|extract(7,2), '&nbsp;', $tmp_phone|extract(9,2) )} 
    {/if}
    {if and( ne($tmp_mobile|extract_left(1), '+'), eq($tmp_mobile|count(), 8))}
        {set $tmp_mobile = concat('+47', $tmp_mobile)}
        {set $tmp_mobile_formatted = concat($tmp_mobile|extract(0,3), '&nbsp;', $tmp_mobile|extract(3,3), '&nbsp;', $tmp_mobile|extract(6,2), '&nbsp;', $tmp_mobile|extract(8,3) )}
    {/if}
    
		    <tr>
		        <td><a href="{$person.url_alias|ezurl( 'no' )}">{concat($person.data_map.last_name.content|trim(), ', ', $person.data_map.first_name.content|trim())|wash()}</a></td>
		        <td>{$person.data_map.jobtitle.content|trim()|wash()}</td>
		        <td><a href="mailto:{$person.data_map.email.content|trim()|wash()}">{$person.data_map.email.content|trim()|wash()}</a></td>
		        <td><a href="{$FINN_FRAM.url_alias|ezurl('no')}">{$tmp_office|wash()}</a></td>
		        <td>{if $tmp_phone|count()}<a href="tel:{$tmp_phone|wash()}">{$tmp_phone_formatted}</a>{else}&nbsp;{/if}</td>
		        <td>{if $person.data_map.publish_mobile}<a href="tel:{$tmp_mobile|wash()}">{$tmp_mobile_formatted}</a>{else}&nbsp;{/if}</td>
		    </tr>
{/foreach}
		</tbody>
		</table>
		</div>
{/if}
    </article>
</div>
<div>
    <ul class="nav nav-pills hials-subnav-pills">
    {foreach $menu_tree as $item}
      <li role="presentation"{if eq($item.node_id, $node.node_id)} class="active"{/if}><a href="{$item.url_alias|ezurl( 'no' )}"><span class="text">{'Employees at'|i18n('hials/design/person')} {cond($item.data_map.menutitle.has_content, $item.data_map.menutitle.content|wash()|downcase(), $item.data_map.title.content|wash() )}</span><span class="glyphicon glyphicon-chevron-right"></span></a></li>
    {/foreach}
    </ul>           
</div>
{undef $menu_root $class_filter $menu_tree $mainnode_id $persons $tmp_office $tmp_phone $tmp_mobile $FINN_FRAM $FINN_FRAM_nodeid $table_summary}