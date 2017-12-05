{def $content_version=$node.contentobject_version_object
     $language_code=$node.object.default_language}
{if eq($node.class_identifier, 'emne')}
    {def $attributes_in_box = array('kode','navn','erstatter','fagnivaa','poeng','varighet_semester','varighet_annen','spraak','fagansvarlig','revidert_dato','revidert_av','justert_dato')}
{else}
    {def $attributes_in_box = array('kode','navn','erstatter','fagnivaa','poeng','varighet_semester','varighet_annen','spraak','fagansvarlig','revidert_dato','revidert_av','justert_dato')}
{/if}
<div class="page_break_after">
<a id="{concat("node_id_",$node.node_id,"_",$language_code)}"></a><h3>{$node.name}</h3>
<div class="panel">
    <div class="panel-body">
{include uri='design:shb/parts/shb_box.tpl'}
    </div>
</div>
{foreach $content_version.contentobject_attributes as $attribute}
    {if $attributes_in_box|contains( $attribute.contentclass_attribute.identifier )}{skip}{/if}
    {if eq($attribute.contentclass_attribute.identifier, 'identifier')}{skip}{/if}
    {if eq($attribute.contentclass_attribute.identifier, 'publiser')}{skip}{/if}
    {if eq($attribute.contentclass_attribute.identifier, 'revidert_og_klar_for_oversendelse_til_studieutvalg')}{skip}{/if}    
    {if or(eq($attribute.content, ''), not($attribute.has_content))}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezxmltext'), eq($attribute.data_text|striptags|wstrim,'') )}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezdate'), or(is_null( $attribute.data_int), eq( $attribute.data_int, 0) ) )}{skip}{/if}
    {if and(eq($attribute.contentclass_attribute.data_type_string, 'ezinteger'), or(is_null( $attribute.data_int), eq( $attribute.data_int, 0) ) )}{skip}{/if}
    <h4>{description($attribute.contentclass_attribute.id, $attribute.language_code)|wash}</h4>
    {switch match=$attribute.is_a}
        {case match='ezxmltext'}<div class="ezxmltext">{attribute_view_gui attribute=$attribute}</div>{/case}
        {case}<p>{attribute_view_gui attribute=$attribute}</p>{/case}
    {/switch}
{/foreach}
{include uri='design:shb/parts/shb_booklist.tpl'}
</div>
{undef $content_version $attributes_in_box $language_code}