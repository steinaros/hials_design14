{if is_unset($has_subitems)}{def $has_subitems = false()}{/if}
<li><a {if $has_subitems}class="toc_heading" {/if}href="#node_id_{$node.node_id}">{$node.name}</a>{if not($has_subitems)}</li>{/if}