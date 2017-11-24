{def $content_version=$node.contentobject_version_object
     $language_code=$node.object.default_language}
<a id="{concat("node_id_",$node.node_id,"_",$language_code)}"></a><h1>{$node.name}</h1>

{foreach $content_version.contentobject_attributes as $attribute}
    {if or(eq($attribute.content, ''), not($attribute.has_content), eq( $attribute.data_text|striptags|wstrim, ''))}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezdate'), or(is_null( $attribute.data_int), eq( $attribute.data_int, 0) ) )}{skip}{/if}
    <h3>{description($attribute.contentclass_attribute.id, $attribute.language_code)|wash}</h3>
    {switch match=$attribute.is_a}
        {case match='ezxmltext'}<div class="ezxmltext">{attribute_view_gui attribute=$attribute}</div>{/case}
        {case}<p>{attribute_view_gui attribute=$attribute}</p>{/case}
    {/switch}
{/foreach}
{include uri='design:shb/parts/shb_booklist.tpl'}
{undef $content_version $language_code}