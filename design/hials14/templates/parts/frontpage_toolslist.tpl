{def $TOOLS_node_id = ezini( 'HialsContentNodeIDs', 'FrontpageTools', 'content.ini' )
     $toolbox = fetch( 'content', 'node', hash( 'node_id', $TOOLS_node_id ) )}
{if $toolbox}     
<div class="toolmenu">     
<h2 class="front">{$toolbox.data_map.title.content|wash()}</h2>
{attribute_view_gui attribute=$toolbox.data_map.contents}
{*<p class="text-right"><a href="#" title="Flere verktøy">{'More...'|i18n('hials/design/std')}</a></p>*}
</div>
{/if}