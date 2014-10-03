{def $node = $block.valid_nodes[0]}
<div class="block-type-highlighted-item block-view-{$block.view}">
    <article class="bg-white highlighted nopadding">
        <div class="row">
        {node_view_gui content_node=$node view=block_item_highlighted}
        </div>
    </article>
</div>
{undef $node}