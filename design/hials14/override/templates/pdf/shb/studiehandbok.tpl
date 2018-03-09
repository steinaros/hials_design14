{* Studiehandbok - PDF view *}
{def $language_code=$node.object.default_language}
<div id="titlepage" class="page_break_right">
	<a id="{concat("node_id_",$node.node_id)}"></a><p class="h1">{'Studyguide'|i18n('hials/design/shb')} {attribute_view_gui attribute=$node.data_map.tittel}</p>
	<div class="intro">
	    {attribute_view_gui attribute=$node.data_map.nettsidetekst}
	</div>
</div>
{include uri="design:shb/parts/shb_pdf_toc.tpl" language_code=$language_code}
           
{*def $classes = array('systemmappe', 'webpage', 'emne', 'emne_2014_2', 'studie', 'studie_2014_2', 'kurs' )*}
{def $classes = array('systemmappe', 'studie', 'studie_2014_2' )}
<div class="content">
{foreach fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                         'sort_by', $node.sort_array,
                                         'class_filter_type', 'include',
                                         'class_filter_array', $classes ) ) as $child }
{if and(eq($child.class_identifier, "systemmappe"), eq($child.data_map.identifier.content, "nettvisning"))}{continue}{/if}
<div class="page_break_after">
{node_view_gui view=full content_node=$child language_code=$language_code}
</div>
{/foreach}
</div>
{undef $classes $language_code}