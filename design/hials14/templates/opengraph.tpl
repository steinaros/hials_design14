{def $type = ''
     $title = ''
     $site_name = ''
     $url = ''
     $image = ''
     $desc = ''
     $node_info = fetch('content', 'node', hash( 'node_id', $pagedata.node_id ))
     $fb_app_id = ezini( 'SocialMediaSettings', 'FacebookID', 'hials.ini' )}
{set $site_name = $site.title}
{set $title = cond(is_set($node_info.data_map.title), $node_info.data_map.title.content, $node_info.name)}
{if ne($node_info.data_map.banner.content.relation_list|count(),0)}
    {def $tmp_content = fetch( 'content', 'object', hash( 'object_id', $node_info.data_map.banner.content.relation_list.0.contentobject_id ) )}
    {set $image = $tmp_content.data_map.image.content['original'].full_path|ezroot('double', 'full')}
    {undef $tmp_content}
{elseif $node_info.data_map.image.has_content}
    {set $image = $node_info.data_map.image.content['original'].full_path|ezroot('double', 'full')}
{/if} 
{switch match=$pagedata.class_identifier}
    {case match='hials_frontpage'}
        {set $type = 'website'}
        {set $url = "/"|ezurl('no', 'full')}
    {/case}
    {case}
        {set $type = 'article'}
        {set $url = $node_info.url_alias|ezurl('no', 'full')}
    {/case}
{/switch}
{if is_set($node_info.data_map.intro)}
    {set $desc = $node_info.data_map.intro.content.output.output_text|striptags()}
{/if}
{if $type|count()}
	<meta property="og:site_name" content="{$site_name|wash}">
	<meta property="og:title" content="{$title|wash}">
	<meta property="og:type" content="{$type|wash}">
	<meta property="og:url" content="{$url}">
	{if $desc|count()}<meta property="og:description" content="{$desc|wash}">{/if}
    {if ne($type, 'website')}
    <meta property="og:article:published_time" content="{$node_info.object.published|datetime('custom', '%c')}">
    <meta property="og:article:modified_time" content="{$node_info.object.modified|datetime('custom', '%c')}">
    {/if}
    {if $image|count()}<meta property="og:image" content={$image}>{/if}
    {*if $fb_app_id|count()}<meta property="fb:app_id" content="{$fb_app_id|wash}">{/if*}
{/if}
{undef $type $title $url $image $desc $node_info}