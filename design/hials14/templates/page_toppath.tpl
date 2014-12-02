{if gt($pagedata.page_depth, 2)} {* Do not show breadcrumbs on frontpage *}
<div id="breadcrumbs-area">
    <div class="container">
        <div class="row"> 
            <!-- Path content: START -->
{include uri=concat('design:parts/', $pagedata.show_path, '.tpl')}
            <!-- Path content: END --> 
        </div>
    </div>
</div>
{/if}