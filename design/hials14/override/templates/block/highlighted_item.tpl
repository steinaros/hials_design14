{def $node = $block.valid_nodes[0]}
<div class="block-type-highlighted-item block-view-{$block.view}">
    <article class="col-sm-12 bg-white highlighted">
        {node_view_gui content_node=$node view=block_item_highlighted}
    </article>
</div>
{undef $node}