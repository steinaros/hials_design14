{* Persongruppering - Full view *}
{def $menu_root = $node.path_array[4]}
{def $class_filter = array( 'hials_person_mappe' )
{def $menu_tree=fetch( 'content', 'list', hash( 'parent_node_id', $menu_root,
                                          'class_filter_type', 'include',
                                          'class_filter_array', $class_filter ) ) }
{def $mainnode_id = $node.main_node_id}
{def $persons = fetch( 'content', 'tree', hash( 'parent_node_id', $mainnode_id,
                                                'class_filter_type', 'include',
                                                'class_filter_array', array( 'hials_person' ),
                                                'sort_by', array( 
                                                    array( 'attribute', true(), 'hials_person/last_name' ),
                                                    array( 'attribute', true(), 'hials_person/first_name' ) ) ) )
    $tmp_office = ''
    $tmp_phone = ''
    $tmp_mobile = ''}
<div>
    <ul class="nav nav-pills hials-subnav-pills">
    {foreach $menu_tree as $item}
      <li role="presentation"{if eq($item.node_id, $node.node_id)} class="active"{/if}><a href="{$item.url_alias|ezurl( 'no' )}"><span class="text">{$item.title.content|wash()}</span><span class="glyphicon glyphicon-chevron-right"></span></a></li>
    {/foreach}
    </ul>           
</div>
<div class="content-view-full row">
    <article class="class-hials_person_mappe col-sm-12">
        <h1>{$node.data_map.title.content|wash()}</h1>
                                                
{if $persons|count()}
        <div class="table-responsive">
		<table class="table table-striped" summary="" width="100%">
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
		    <tr>
		        <td>{concat($person.data_map.last_name.content|trim(), ', ', $person.data_map.first_name.content|trim())|wash()}</td>
		        <td>{$person.data_map.jobtitle.content|trim()|wash()}</td>
		        <td>{$person.data_map.email.content|trim()|wash()}</td>
		        <td>{$tmp_office|wash()}</td>
		        <td>{$tmp_phone|wash()}</td>
		        <td>{if $person.data_map.publish_mobile}{$tmp_mobile|wash()}{else}&nbsp;{/if}</td>
		    </tr>
{/foreach}
		</tbody>
		</table>
		</div>
{/if}
    </article>
</div>
{undef $menu_root $class_filter $menu_tree $mainnode_id $persons $tmp_office $tmp_phone $tmp_mobile}