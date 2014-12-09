{* Persongruppering - Full view *}
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
<div class="content-view-full row">
    <article class="class-hials_person_mappe col-sm-12">
        <h1>{$node.data_map.title.content|wash()}</h1>
                                                
{if $persons|count()}
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
		        <td>{concat($person.data_map.last_name.content, ', ', $person.data_map.first_name.content)|wash()}</td>
		        <td>{$person.data_map.jobtitle.content|wash()}</td>
		        <td>{$person.data_map.email.content|wash()}</td>
		        <td>{$tmp_office|wash()}</td>
		        <td>{$tmp_phone|wash()}</td>
		        <td>{if $person.data_map.publish_mobile}{$tmp_mobile|wash()}{else}&nbsp;{/if}</td>
		    </tr>
{/foreach}
		</tbody>
		</table>
{/if}
    </article>
</div>
