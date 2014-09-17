{def $classification = "alert"}
{set $classification = cond( and(is_set( $alert_level ), $alert_level ), concat( $classification, ' alert-', $alert_level ), $classification )}
{set $classification = cond( and(is_set( $dismissable ), $dismissable ), concat( $classification, ' alert-dismissable' ), $classification )}
<div class="{$classification|wash}" role="alert">
    {$content}
</div>