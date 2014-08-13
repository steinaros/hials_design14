{def $box_width_class = "col-sm-3"}
{def $box_style_class = "box-white"}
{def $soknad_selection = $container_node.data_map.soknad_til.content.0|dec}
{def $soknad_text = false()}
{def $soknad_link = false()}
{switch match=$block.custom_attributes.width}
    {case match='1_col'}{set $box_width_class = "col-sm-3"}{/case}
    {case match='2_col'}{set $box_width_class = "col-sm-6"}{/case}
{/switch}
{switch match=$block.custom_attributes.color}
    {case match='white'}{set $box_style_class = "box-white"}{/case}
    {case match='gray'}{set $box_style_class = "box-gray"}{/case}
{/switch}
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

<div class="block-type-infoboks {$box_width_class}">
    <div class="{$box_style_class}">
	    <h3>{$block.name|wash()}</h3>
	    <dl>
	        <dt>Opptakskrav:</dt><dd>{attribute_view_gui attribute=$container_node.data_map.opptakskrav }</dd>
	        {if $soknad_text}<dt>S&oslash;knad:</dt><dd><a href={$soknad_link}>{$soknad_text}</a></dd>{/if}
	        <dt>S&oslash;knadsfrist:</dt><dd>{$container_node.data_map.soknadsfrist.content|wash()}</dd>
	        <dt>Studiepoeng:</dt><dd>{$container_node.data_map.cdm_studiepoeng.content|wash()}</dd>
	    </dl>
	</div>
</div>
{undef $box_width_class $box_style_class $soknad_selection $soknad_text $soknad_link}