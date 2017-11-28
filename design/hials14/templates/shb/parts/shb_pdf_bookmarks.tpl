{def $node_id = $module_result.content_info.main_node_id
	 $language_code = $module_result.content_info.current_language
	 $node = fetch('content', 'node', hash( 'node_id', $node_id,
	 										'language_code', $language_code))
	 $emner = array()
	 $bookmark_tree = array()
	 $class_filter = array()
	 $prev_depth = $node.depth}
{switch match=$module_result.content_info.class_identifier}
	{case match='studiehandbok'}
{set $class_filter = ezini( 'MenuContentSettings', 'BookmarkIdentifierList', 'hials.ini' ) )}	
<bookmarks>
	<bookmark name="{'Studyguide'|i18n('hials/design/shb')} {$node.name|wash()}" href="">
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
	<bookmark name="{$node.name}" href="{concat("node_id_",$node_id,"_",$language_code)}">
		<bookmark name="{'Courses'|i18n('hials/design/shb')}" href="{concat("courses_node_id_",$node.node_id,"_",$language_code)}">
      	{foreach $emner as $emne}
      		{node_view_gui view=bookmarkitem content_node=$emne.node language_code=$language_code}
	  	{/foreach}
       	</bookmark>
    </bookmark>
</bookmarks>
	{/case}
	{case}{/case}
{/switch}
<!-- Switch bookmarks {$module_result.content_info.class_identifier} -->
{undef $emner $node_id $language_code $node $bookmark_tree $prev_depth $class_filter}