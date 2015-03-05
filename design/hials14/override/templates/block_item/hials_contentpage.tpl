{* Contentpage - Block view *}
{if is_unset($css_class)}{def $css_class=false()}{/if}
{def $box_title = cond($node.data_map.tagheading.has_content, $node.data_map.tagheading.content, $node.data_map.title.content)}
<div class="{concat($css_class,' textcenter')|wash}">
	<div class="class-hials_contentpage">
	    <span class="h3"><a href="{$node.url_alias|ezurl( 'no' )}">{$box_title|wash()}</a></span>
	</div>
</div>
