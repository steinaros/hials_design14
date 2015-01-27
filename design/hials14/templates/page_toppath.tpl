{if gt($pagedata.page_depth, 2)} {* Do not show breadcrumbs on frontpage *}
<div class="breadcrumb-wrapper hidden-print">
    {include uri=concat('design:parts/', $pagedata.show_path, '.tpl')}
</div>
{/if}