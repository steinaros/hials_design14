{* KHB: Dokument - listitem view *}
<div class="view-listitem class-document">
{if $node.data_map.text.content.is_empty|not}
<h4><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h4>
{else}
<h4>{$node.name|wash()}</h4>
{/if}
{if $node.data_map.description.content.is_empty|not}
<div class="attribute-short">
    {attribute_view_gui attribute=$node.data_map.description}
</div>
{/if}
{if $node.data_map.file.has_content}
    {attribute_view_gui attribute=$node.data_map.file}
{/if}
<span>({"Updated"|i18n("design/hials/full/webpage")}: {$node.object.modified|l10n(shortdatetime)})</span>
</div>