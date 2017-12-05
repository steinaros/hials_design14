{if is_unset($root_item)}{def $root_item = array()}{/if}
{if is_unset($class_filter)}{def $class_filter = array()}{/if}
{if is_unset($language_code)}{def $language_code = ''}{/if}
{def $toc = fetch( 'content', 'list', hash( 'parent_node_id', $root_item.node_id,
                                                'depth', 1,
                                                'class_filter_type', 'include',
                                                'class_filter_array', $class_filter,
                                                'sort_by', $root_item.sort_array ) ) }
{def $subitem_count = 0}
<!-- {$class_filter|attribute( 'show', 2, 'text' )} -->
<!-- {$language_code|attribute( 'show', 2, 'text' )} -->
<ol>
{foreach $toc as $item}
	{if and(eq($item.class_identifier, "systemmappe"), or(eq($item.children_count, 0), eq($item.data_map.identifier.content, "nettvisning")))}{continue}{/if}
	{* Get filtered count - only children of correct contenttypes *}
    {set $subitem_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $item.node_id,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', $class_filter ) ) }
	{node_view_gui view=tocitem content_node=$item language_code=$language_code has_subitems=gt($subitem_count, 0)}
	{if gt($subitem_count, 0)}
		{include uri='design:shb/parts/shb_pdf_toc_sub.tpl' 
			root_item=$item 
			class_filter=$class_filter 
			language_code=$language_code}
</li>
	{/if}
{/foreach}
</ol>
{undef $toc $subitem_count}