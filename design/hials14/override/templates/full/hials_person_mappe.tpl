{* Persongruppering - Full view *}
{def $mainnode_id = $node.main_node_id}
{def $persons = fetch( 'content', 'tree', hash( 'parent_node_id', $mainnode_id,
                                                'class_filter_type', 'include',
                                                'class_filter_array', array( 'hials_person' ) ) )}
<div class="content-view-full">
    <article class="class-hials_person_mappe col-sm-9 col-sm-push-3">
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
		    <tr>
		        <td>{concat($person.data_map.last_name.content, ', ', $person.data_map.first_name.content)|wash()}</td>
		        <td>{$person.data_map.jobtitle.content|wash()}</td>
		        <td>{$person.data_map.email|wash()}</td>
		        <td>{$person.data_map.office|wash()}</td>
		        <td>{$person.data_map.phone|wash()}</td>
		        <td>{if $person.data_map.publish_mobile}{$person.data_map.mobile|wash()}{else}&nbsp;{/if}</td>
		    </tr>
{/foreach}
		</tbody>
		</table>
{/if}
    </article>
    <aside class="col-sm-3 col-sm-pull-9">
        {include uri='design:menu/leftmenu.tpl'}
    </aside>        
</div>
