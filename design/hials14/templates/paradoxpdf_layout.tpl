{*?template charset=utf8?*}
{set-block variable=$xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
{def $pagedata         = ezpagedata()}
{def $locales          = fetch( 'content', 'translation_list' )
     $current_node_id  = $pagedata.node_id
     $current_shb_name = $module_result.title_path[3].text}
{*<!--
Pagedata:
{$pagedata|attribute( 'show', 2, 'text' )}
Module_result.content_info:
{$module_result.content_info|attribute( 'show', 2, 'text' )}
-->*}
<link rel="stylesheet" type="text/css" href={"stylesheets/roboto.css"|ezdesign()} media="print,screen" />
<link rel="stylesheet" type="text/css" href={"stylesheets/hials-pdf-page.css"|ezdesign()} media="print,screen" />
{if eq($pagedata.class_identifier,'studiehandbok')}
<link rel="stylesheet" type="text/css" href={"stylesheets/hials-pdf-page-w-title.css"|ezdesign()} media="print,screen" />
{/if}
<link rel="stylesheet" type="text/css" href={"stylesheets/hials-pdf.css"|ezdesign()} media="print,screen" />
{* Uncomment the folowing code to test and enable pdf bookmarks*}
{include uri="design:shb/parts/shb_pdf_bookmarks.tpl"}
<title></title>
</head>
<body>
<div id="header">
    <div id="sitetitle">{$site.title} ({$current_shb_name|wash()})</div>
    <div id="line2">
      <div id="date">{'PDF generated'|i18n('hials/design/pagelayout')}: {currentdate()|l10n( 'shortdate' )}</div>
    </div>
</div>
{*
<div id="footer">
	{"Page"|i18n('hials/design/std')} <span id="pagenumber"/>
</div>
*}
{$module_result.content}
</body>
</html>
{/set-block}

{* Folowing Avoid printing debug on pdf files when debug enabled*}
<!-- DEBUG_REPORT -->

{*******************************************************************************************************
  You can tweak the pdf cache just as a template cache-block it's
  based on the same mecanisme. So for more information please refere
  to online documentation :
  http://ez.no/doc/ez_publish/technical_manual/4_0/reference/template_functions/miscellaneous/cache_block

  Usage :
        -Full : paradoxpdf(hash('xhtml',$xhtml,
                                'pdf_file_name',$pdf_file_name,
                                'keys',$keys,
                                'subtree_expiry',$subtree_expiry,
                                'expiry',$expiry ,
                                'ignore_content_expiry',$ignore_content_expiry))
        -Minium : paradoxpdf(hash('xhtml',$xhtml))

  Parameters :
        $xhtml : (required)
        $pdf_file_name : just the name (without .pdf extension) that will be assigned
                         to generated file during download if not given "file.pdf" will
                         be used
        $keys, $subtree_expiry, $expiry , $ignore_content_expiry : controls cache
                         (see cache-block documentation)

  Example :

  {def  $pdf_file_name  = $module_result.content_info.url_alias|explode('/')|reverse|extract(0)[0]
        $keys           = array($uri_string,$current_user.contentobject_id)
        $subtree_expiry = $module_result.node_id
        $expiry         = 6000
        $ignore_content_expiry=false()

        $paradoxpdf_params= hash('xhtml', $xhtml,
                                 'pdf_file_name',$pdf_file_name,
                                 'keys', $keys,
                                 'subtree_expiry', $subtree_expiry,
                                 'expiry',$expiry ,
                                 'ignore_content_expiry',$ignore_content_expiry)}

*******************************************************************************************************}
{* DEBUG *}
{*$xhtml*}
{def $paradoxpdf_params = hash('xhtml', $xhtml,
                               'pdf_file_name',$module_result.content_info.url_alias|explode('/')|reverse|extract(0)[0],
                               'subtree_expiry',$module_result.node_id )}

{paradoxpdf($paradoxpdf_params)}