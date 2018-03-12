{default node_name=$node.name node_url=$node.url_alias}
<div>{if $node_url}<a href={$node_url|ezurl}>{/if}{$node_name|wash}{if $node_url}</a>{/if}
<p style="float:right"><a href={concat('/layout/set/pdf/', $node_url)|ezurl} role="no-follow" aria-label="{'Download PDF version'|i18n('hials/design/shb')}"><i aria-hidden="true" class="fa fa-file-pdf-o fa-lg"></i></a></p></div>{/default}
