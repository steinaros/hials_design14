{def $toc_node_id = $node.main_node_id
	 $toc_node = fetch('content', 'node', hash( 'node_id', $toc_node_id,
	 										'language_code', $language_code))
	 $toc_class_filter = array()}
{switch match=$toc_node.class_identifier}
	{case match='studiehandbok'}
{set $toc_class_filter = ezini( 'MenuContentSettings', 'BookmarkIdentifierList', 'hials.ini' ) )}
<a id="tableofcontents"></a><h1>{"Table of contents"|i18n('hials/design/std')}</h1>
<ol id="toc" class="page_break_right">
	<li>{*<a class="toc_heading" href="{concat("#node_id_",$toc_node_id,"_",$language_code)}">{'Studyguide'|i18n('hials/design/shb')} {$toc_node.name|wash()}</a>
		<li><a class="toc_heading" href="#tableofcontents">{"Table of contents"|i18n('hials/design/std')}</a></li>*}
		{include uri='design:shb/parts/shb_pdf_toc_sub.tpl' 
			root_item=$toc_node 
			class_filter=$toc_class_filter
			language_code=$language_code}
	</li>
</ol>
	{/case}
	{case match='studie'}
	{/case}
	{case}{/case}
{/switch}
{undef $toc_node_id $toc_node $toc_class_filter}