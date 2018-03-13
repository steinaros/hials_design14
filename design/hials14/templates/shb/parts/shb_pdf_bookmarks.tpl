{def $node_id = $module_result.content_info.main_node_id
	 $emner = array()
	 $class_filter = array()
	 
	 $node = fetch('content', 'node', hash( 'node_id', $node_id,
	 										'language_code', $language_code))}
{switch match=$node.class_identifier}
	{case match='studiehandbok'}
{set $class_filter = ezini( 'MenuContentSettings', 'BookmarkIdentifierList', 'hials.ini' ) )}	
<bookmarks>
	<bookmark name="{'Studyguide'|i18n('hials/design/shb')} {$node.name|wash()}" href="#">
		<bookmark name="{"Table of contents"|i18n('hials/design/std')}" href="#tableofcontents" />
		{include uri='design:shb/parts/shb_pdf_bookmarks_sub.tpl' 
			root_item=$node 
			class_filter=$class_filter
			language_code=$language_code}		
	</bookmark>
</bookmarks>
	{/case}
	{case in=array('studie', 'studie_2014_2')}
		{set $emner = fetch('handbok', 'emne_noder_for_studie', hash('studie_node_id',$node_id,
																	 'language',$language_code))}
<bookmarks>
	<bookmark name="{$node.name|wash}" href="{concat("#node_id_",$node_id,"_",$language_code)}">
		<bookmark name="{'Courses'|i18n('hials/design/shb')}" href="{concat("#courses_node_id_",$node.node_id,"_",$language_code)}">
      	{foreach $emner as $emne}
      		{node_view_gui view=bookmarkitem content_node=$emne.node language_code=$language_code}
	  	{/foreach}
       	</bookmark>
    </bookmark>
</bookmarks>
	{/case}
	{case}{/case}
{/switch}
{*<!-- Switch bookmarks {$module_result.content_info.class_identifier} -->*}
{undef $emner $class_filter}
