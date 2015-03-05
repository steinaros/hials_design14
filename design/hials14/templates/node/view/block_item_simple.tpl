{* block_item_simple DEFAULT view *}
{if is_unset($css_class)}{def $css_class=false()}{/if}
{def $box_title = cond($node.data_map.tagheading.has_content, $node.data_map.tagheading.content, $node.data_map.title.has_content, $node.data_map.title.content, $node.name)}
<a {if $css_class}class="{$css_class}" {/if}href="{$node.url_alias|ezurl( 'no' )}">{$box_title|wash()}</a>
{*
<div class="block_item_simple textcenter{if $css_class} {$css_class}{/if}">
	<div class="class-{$node.class_identifier}">
	    <span class="h3"><a href="{$node.url_alias|ezurl( 'no' )}">{$box_title|wash()}</a></span>
	</div>
</div>
*}
