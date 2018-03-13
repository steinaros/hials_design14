{* Modify default - remove empty paragraphs. Idealy should only remove if in end of ezxmltext datatype *}
<!-- custom paragraph template -->
{if ne( $content|trim(), '' )}
{set $classification = cond( and(is_set( $align ), $align ), concat( $classification, ' text-', $align ), $classification )}
<p{if $classification|trim} class="{$classification|wash}"{/if}>
{$content}
</p>{/if}