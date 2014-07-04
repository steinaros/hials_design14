{set $aspect_ratio = cond( and(is_set( $aspect_ratio ), $aspect_ratio ), concat( ' embed-responsive-', $aspect_ratio ), 'embed-responsive-16by9' )}
<div class="embed-responsive{$aspect_ratio|wash}">
  <iframe class="embed-responsive-item" src="{$source}" frameborder="0" {if and( is_set( $allow_full_screen ), eq( $allow_full_screen, '1' ) )}allowfullscreen{/if}></iframe>
</div>