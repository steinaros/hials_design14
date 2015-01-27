{def $aktiv_shb_node_id = fetch('innstillinger', 'hent', hash('identifier', 'aktivhandbokid'))}
{def $current_shb = fetch( 'content', 'node', hash( 'node_id', $aktiv_shb_node_id ) )}
{if not($node.path_array|contains( $aktiv_shb_node_id ))}
<div class="alert alert-warning hidden-print" role="alert">{'You are now displaying <strong>archived information</strong>. You find the latest information in the <a class="alert-link" href="%url">current edition of the studyguide</a>.'|i18n('hials/design/shb', '', hash( '%url', $current_shb.url_alias|ezurl('no') ) )}</div>
{/if}
{undef $aktiv_shb_node_id $current_shb}