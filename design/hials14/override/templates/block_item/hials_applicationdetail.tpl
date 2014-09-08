{def $soknad_selection = $container_node.data_map.soknad_til.content.0}
{def $soknad_text = false()}
{def $soknad_link = false()}
{switch match=$soknad_selection}
    {case match=1}
        {set $soknad_text = $container_node.data_map.soknad_til.class_content.options[$soknad_selection].name|wash}
        {set $soknad_link = "http://www.samordnaopptak.no"|ezurl}
    {/case}
    {case match=2}
        {set $soknad_text = $container_node.data_map.soknad_til.class_content.options[$soknad_selection].name|wash}
        {set $soknad_link = "#"|ezurl}
    {/case}
    {case match=3}
        {if $container_node.data_map.soknad_egendefinert.has_content}
            {set $soknad_text = $container_node.data_map.soknad_egendefinert.content.name|wash}
            {def $file = $container_node.data_map.soknad_egendefinert.content.data_map.file}
            {set $soknad_link = concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl}
            {undef $file}
        {/if}  
    {/case}
{/switch}
<div class="class-hials_applicationdetail">
    <h3>{$node.name|wash()}</h3>
    <dl>
        <dt>{"Requirements"|i18n('design/hials/utdanning')}</dt><dd>{attribute_view_gui attribute=$container_node.data_map.opptakskrav }</dd>
        {if $soknad_text}<dt>{"Application to"|i18n('design/hials/utdanning')}</dt><dd><a href={$soknad_link}>{$soknad_text}</a></dd>{/if}
        <dt>{"Application deadline"|i18n('design/hials/utdanning')}</dt><dd>{$container_node.data_map.soknadsfrist.content|wash()}</dd>
        <dt>{"Credits"|i18n('design/hials/utdanning')}</dt><dd>{$container_node.data_map.cdm_studiepoeng.content|wash()}</dd>
    </dl>
</div>
{undef $soknad_selection $soknad_text $soknad_link}