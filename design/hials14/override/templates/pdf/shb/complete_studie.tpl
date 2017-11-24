{def $content_version = $node.contentobject_version_object}
     
{cache-block keys=array($node.node_id,'complete')}
<article>
<h1>{$node.name}</h1>

{foreach $content_version.contentobject_attributes as $attribute}
    {*if $attributes_in_box|contains( $attribute.contentclass_attribute.identifier )}{skip}{/if*}
    {if or(eq($attribute.content, ''), not($attribute.has_content), eq( $attribute.data_text|striptags|wstrim, ''))}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezdate'), or(is_null( $attribute.data_int), eq( $attribute.data_int, 0) ) )}{skip}{/if}
    <h3>{description($attribute.contentclass_attribute.id, $attribute.language_code)|wash}</h3>
    {switch match=$attribute.is_a}
        {case match='ezxmltext'}<div class="ezxmltext">{attribute_view_gui attribute=$attribute}</div>{/case}
        {case}<p>{attribute_view_gui attribute=$attribute}</p>{/case}
    {/switch}
{/foreach}

{def $blocks = fetch('content', 'list', hash('parent_node_id', $node.node_id, 
                                             'sort_by', array("priority", true()),
                                             'class_filter_type', "include",
                                             'class_filter_array', array(ezini('Studiehandbokklasser', 'fagblokk'), ezini('Studiehandbokklasser', 'tekstblokk'))))
     $rowattributes = array()}                                         
{foreach $blocks as $block}
<div class="block">
    {set $rowattributes = fetch( 'handbok', 'attributes', hash('object_id', $block.contentobject_id, 'version', $block.contentobject_version, 'language', $language_code) )}
    {foreach $rowattributes as $row}
        {switch match=$row.is_a}
            {case match='ezstring'}{if ne($row.content, '')}<h3>{attribute_view_gui attribute=$row}</h3>{/if}{/case}
            {case}{attribute_view_gui attribute=$row language_code=$language_code}{/case}
        {/switch}
    {/foreach}
</div>
{/foreach}

{include uri='design:shb/parts/shb_booklist.tpl'}

{def $emner = fetch('handbok', 'emne_noder_for_studie', hash('studie_node_id',$node.main_node_id,language,$language_code))}
<!-- {$emner|attribute('show',2,'text')} -->
{foreach $emner as $emne}
<section class="page_break_before">
    {node_view_gui view=full content_node=$emne.node language_code=$language_code}
</section>    
{/foreach}

</article>
{/cache-block}

{undef $content_version $blocks $emner $rowattributes}