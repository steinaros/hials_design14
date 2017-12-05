{if is_unset($root_item)}{def $root_item = array()}{/if}
{if is_unset($class_filter)}{def $class_filter = array()}{/if}
{if is_unset($language_code)}{def $language_code = ''}{/if}
{def $bookmarks = fetch( 'content', 'list', hash( 'parent_node_id', $root_item.node_id,
                                                'depth', 1,
                                                'class_filter_type', 'include',
                                                'class_filter_array', $class_filter,
                                                'sort_by', $root_item.sort_array ) ) }
{def $subitem_count = 0
     $hassubitems = false()}
{foreach $bookmarks as $item}
	{if and(eq($item.class_identifier, "systemmappe"), or(eq($item.children_count, 0), eq($item.data_map.identifier.content, "nettvisning")))}{continue}{/if}
	{* Get filtered count - only children of correct contenttypes *}
    {set $subitem_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $item.node_id,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', $class_filter ) ) }
	{if gt($subitem_count, 0)}{set $hassubitems = true()}{else}{set $hassubitems = false()}{/if}
<!-- Subitemcount: {$subitem_count} {$hassubitems} -->
	{node_view_gui view=bookmarkitem content_node=$item language_code=$language_code has_subitems=$hassubitems}
	{if $hassubitems}
		{include uri='design:shb/parts/shb_pdf_bookmarks_sub.tpl' 
			root_item=$item 
			class_filter=$class_filter 
			language_code=$language_code}
</bookmark>
	{/if}
{/foreach}
{undef $bookmarks $subitem_count}