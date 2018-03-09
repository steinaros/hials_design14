{* Kurs - PDF view *}
{def $content_version=$node.contentobject_version_object
     $language_code=$node.object.default_language}
<div>
	<a id="{concat("node_id_",$node.node_id)}"></a><h3>{$node.name}</h3>
{foreach $content_version.contentobject_attributes as $attribute}
    {if $attributes_in_box|contains( $attribute.contentclass_attribute.identifier )}{skip}{/if}
    {if or(eq($attribute.content, ''), not($attribute.has_content), eq( $attribute.data_text|striptags|wstrim, ''))}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezdate'), or(is_null( $attribute.data_int), eq( $attribute.data_int, 0) ) )}{skip}{/if}
    <h4>{description($attribute.contentclass_attribute.id, $attribute.language_code)|wash}</h4>
    {switch match=$attribute.is_a}
        {case match='ezxmltext'}<div class="ezxmltext">{attribute_view_gui attribute=$attribute}</div>{/case}
        {case}<p>{attribute_view_gui attribute=$attribute}</p>{/case}
    {/switch}
{/foreach}
</div>
{undef $content_version $attributes_in_box $language_code}