{default collection=cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
                          fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}

{set-block scope=global variable=title}{'Feedback for %feedbackname'|i18n('design/standard/content/feedback',,hash('%feedbackname',$node.name|wash))}{/set-block}

<h1>{$object.name|wash}</h1>

{if $error}

{if $error_existing_data}
<p>{'You have already submitted feedback. The previously submitted data was:'|i18n('design/standard/content/feedback')}</p>
{/if}

{else}

<p>{'Thanks for your feedback. The following information was collected.'|i18n('design/standard/content/feedback')}</p>

{/if}

<div class="block">
{section loop=$collection.attributes}

<h3>{$:item.contentclass_attribute_name|wash}</h3>

{attribute_result_gui view=info attribute=$:item}

{/section}
</div>


<a href={$node.parent.url|ezurl}>{'Return to site'|i18n('design/standard/content/feedback')}</a>

{/default}
