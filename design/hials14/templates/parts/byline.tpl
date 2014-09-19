{def $datediff=sub($node.object.modified, $node.object.published)}
{def $published_df = 'shortdatetime'}
{def $modified_df = 'shortdatetime'}
{if eq($node.object.published|datetime('custom', '%Y%m%d'),$node.object.modified|datetime('custom', '%Y%m%d'))}{set $modified_df = 'shorttime'}{/if}
<!-- Datediff {$datediff} -->
<section class="byline">
    <p><i class="fa fa-clock-o"></i><span class="articlepublished">{"Published"|i18n('hials/design/std')}</span> <time datetime="{$node.object.published|datetime('custom', '%c')}">{$node.object.published|l10n($published_df)}</time>{if gt($datediff, 0)}&nbsp;<span class="articlemodified">{"Modified"|i18n('hials/design/std')}</span> <time datetime="{$node.object.modified|datetime('custom', '%c')}">{$node.object.modified|l10n($modified_df)}</time>{/if}<span class="sharebuttons">{"Share"|i18n('hials/design/std')} <i class="fa fa-share-alt"></i></span></p>            
</section>
