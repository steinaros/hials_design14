<div class="{if $object_parameters.align}pull-{$object_parameters.align}{/if}{if ne($classification|trim,'')} {$classification|wash}{/if}"{if is_set($object_parameters.id)} id="{$object_parameters.id}"{/if}>
{content_view_gui view=$view link_parameters=$link_parameters object_parameters=$object_parameters content_object=$object classification=$classification}
</div>