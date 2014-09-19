{def $datediff=sub($node.object.published, $node.object.modified)}
<section class="byline">
    <p><i class="fa fa-clock-o"></i><span class="articlepublished">{"Published"|i18n('hials/design/std')} <time datetime="{$node.object.published|datetime('custom', '%c')}">{$node.object.published|l10n('shortdatetime')}</time></span>{if gt($datediff, 0)}&nbsp;<span class="articlemodified">{"Modified"|i18n('hials/design/std')} <time datetime="{$node.object.modified|datetime('custom', '%c')}">{$node.object.modified|l10n('shortdatetime')}</time></span>{/if}<span class="sharebuttons">{"Share"|i18n('hials/design/std')} <i class="fa fa-share-alt"></i></span></p>            
</section>
