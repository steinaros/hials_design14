{def $soknad_selection = $container_node.data_map.soknad_til.content.0}
{def $soknad_link = false()}
{switch match=$soknad_selection}
    {case match=1}
        {set $soknad_link = "http://www.samordnaopptak.no"|ezurl}
    {/case}
    {case match=2}
        {set $soknad_link = "#"|ezurl}
    {/case}
    {case match=3}
        {if $container_node.data_map.soknad_egendefinert.has_content}
            {def $file = $container_node.data_map.soknad_egendefinert.content.data_map.file}
            {set $soknad_link = concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl}
            {undef $file}
        {/if}  
    {/case}
{/switch}

<div class="class-hials_calltoaction">
    <p class="call-to-action"><a href={$soknad_link}>{$node.name|wash()}</a></p>
</div>
{undef $soknad_selection $soknad_link}