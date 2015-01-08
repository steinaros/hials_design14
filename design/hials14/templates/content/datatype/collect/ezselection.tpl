{if is_unset( $attribute_base )}
    {def $attribute_base = 'ContentObjectAttribute'}
{/if}
{def $selected_id_array=cond( is_set( $#collection_attributes[$attribute.id] ), $#collection_attributes[$attribute.id].content, $attribute.content )}

{* Always set the .._selected_array_.. variable, this circumvents the problem when nothing is selected. *}
<input type="hidden" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}" value="">
<fieldset>
<ledgend>{$attribute.contentclass_attribute.name}</ledgend>
{if $attribute.class_content.is_multiselect}
{foreach $attribute.class_content.options as $item}
<div class="checkbox">
	<label><input type="checkbox" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}[]" value="{$item.id}" {if $selected_id_array|contains( $item.id )}checked{/if}>{$item.name|wash( xhtml )}</label>
</div>
{/foreach}
{else}
{foreach $attribute.class_content.options as $item}
<div class="radio">
	<label><input type="radio" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}[]" value="{$item.id}" {if $selected_id_array|contains( $item.id )}checked{/if}>{$item.name|wash( xhtml )}</label>
</div>
{/foreach}
{/if}
</fieldset>
{undef $selected_id_array}