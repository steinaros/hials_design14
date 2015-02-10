{if is_set( $content_version )}
<dl>
{foreach $content_version.contentobject_attributes as $attribute}
    {if not($attributes_in_box|contains( $attribute.contentclass_attribute.identifier ))}{skip}{/if}
    {if or(eq($attribute.content, ''), not($attribute.has_content))}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezxmltext'), eq($attribute.data_text|striptags|wstrim,'') )}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezdate'), or(is_null( $attribute.data_int), eq( $attribute.data_int, 0) ) )}{skip}{/if}
    <dt>{description($attribute.contentclass_attribute.id, $attribute.language_code)|wash}</dt>
    <dd>{attribute_view_gui attribute=$attribute}</dd>
{/foreach}
</dl>
{/if}
