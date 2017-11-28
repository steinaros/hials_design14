{if is_unset($has_subitems)}{def $has_subitems = false()}{/if}
<bookmark name="{$node.name}" href="#node_id_{$node.node_id}_{$language_code}" {if not($has_subitems)}/{/if}>