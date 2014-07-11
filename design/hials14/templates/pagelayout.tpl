<!DOCTYPE html>
<!--[if lt IE 9 ]><html class="unsupported-ie ie" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="{$site.http_equiv.Content-language|wash}"><!--<![endif]-->
<head>
{def $user_hash = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}
         
{include uri='design:page_head_displaystyles.tpl'}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{def $pagedata        = ezpagedata()
     $inner_column_size = $pagedata.inner_column_size
     $outer_column_size = $pagedata.outer_column_size}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $current_node_id  = $pagedata.node_id}
     
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
<body>
<!-- ########### DEBUG ############
Pagedata:
{$pagedata|attribute('show', 2, 'text')}
     ######### END DEBUG ##########
-->
<!-- Complete page area: START -->
<a class="sr-only" href="#content">{"Skip to main content"|i18n('design/hials/pagelayout')}</a>

<div id="page" class="container {$pagestyle}">
    <!-- Header area: START -->
    {include uri='design:page_header.tpl'}
    <!-- Header area: END -->

    {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}

    <div class="navbar main-navi">
    {*
        <!-- Top menu area: START -->
        {if $pagedata.top_menu}
            {include uri='design:page_topmenu.tpl'}
        {/if}
        <!-- Top menu area: END -->
    *}
        <!-- Path area: START -->
        {if $pagedata.show_path}
            {include uri='design:page_toppath.tpl'}
        {/if}
        <!-- Path area: END -->
    </div>

    <!-- Toolbar area: START -->
    {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
        {include uri='design:page_toolbar.tpl'}
    {/if}
    <!-- Toolbar area: END -->
{*
    <!-- Columns area: START -->
    <div class="container">
        <div class="row">
            <!-- Side menu area: START -->
            {if $pagedata.left_menu}
                {include uri='design:page_leftmenu.tpl'}
            {/if}
            <!-- Side menu area: END -->*}
    {/cache-block}
    {/cache-block}
            <!-- Main area: START -->
            {include uri='design:page_mainarea.tpl'}
            <!-- Main area: END -->
            {cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}
{*
            <!-- Extra area: START -->
            {if $pagedata.extra_menu}
                {include uri='design:page_extramenu.tpl'}
            {/if}
            <!-- Extra area: END -->
        </div>
    </div>
    <!-- Columns area: END -->
*}
    <!-- Footer area: START -->
    {* TEMP include uri='design:page_footer.tpl'*}
    <!-- Footer area: END -->

</div>
<!-- Complete page area: END -->

<!-- Footer script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->

{/cache-block}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>