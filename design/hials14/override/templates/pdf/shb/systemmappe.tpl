{* Systemmappe - PDF view *}
{def $language_code=$node.object.default_language}

<a id="{concat("node_id_",$node.node_id,"_",$language_code)}"></a><h2>{attribute_view_gui attribute=$node.data_map.navn}</h2>
<div class="intro">
    {attribute_view_gui attribute=$node.data_map.info}
</div>   
{def $classes = array()}

{switch match=$node.data_map.identifier.content}
    {case match='versjoner'}
        {set $classes = array('studiehandbok', 'webpage' )}
        {set $depth = 1}
    {/case}
    {case match='emner'}
        {set $classes = array('emne', 'emne_2014_2')}
    {/case}
    {case match='studier'}
        {set $classes = array('studie', 'studie_2014_2')}
    {/case}
    {case match='andrekurs'}
    	{set $classes = array('kurs')}
    {/case}
    {case}{/case}
{/switch}
{set $classes=$classes|append('systemmappe')}

{foreach fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                         'sort_by', $node.sort_array,
                                         'class_filter_type', 'include',
                                         'class_filter_array', $classes ) ) as $child }
{node_view_gui view=full content_node=$child}
{/foreach}

{undef $classes $language_code}