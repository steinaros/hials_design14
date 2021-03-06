{set $aspect_ratio = cond( and(is_set( $aspect_ratio ), $aspect_ratio ), concat( ' embed-responsive-', $aspect_ratio ), 'embed-responsive-16by9' )}
{if $source|begins_with('http://')}{set $source=$source|remove(0, 5)}{elseif $source|begins_with('https://')}{set $source=$source|remove(0, 6)}{/if}
<div class="embed-responsive{$aspect_ratio|wash}">
  <iframe class="embed-responsive-item" src="{$source}" {if and( is_set( $allow_full_screen ), eq( $allow_full_screen, '1' ) )}allowfullscreen{/if}></iframe>
</div>