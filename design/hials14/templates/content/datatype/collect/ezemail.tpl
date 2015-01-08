{if is_unset( $attribute_base )}
    {def $attribute_base = 'ContentObjectAttribute'}
{/if}
{def $data_text = cond( is_set( $#collection_attributes[$attribute.id] ), $#collection_attributes[$attribute.id].data_text, $attribute.content )}
{if is_unset( $label_visible )}{def $label_visible = true()}{/if}
<label for="{$attribute_base}_ezemail_data_text_{$attribute.id}"{if not($label_visible)} class="sr-only"{/if}>{$attribute.contentclass_attribute.name}</label>
<input type="email" class="form-control {$css_class}" id="{$attribute_base}_ezemail_data_text_{$attribute.id}" name="{$attribute_base}_ezemail_data_text_{$attribute.id}" placeholder="{$placeholder|wash()}" value="{$data_text|wash( xhtml )}">
{undef $data_text}