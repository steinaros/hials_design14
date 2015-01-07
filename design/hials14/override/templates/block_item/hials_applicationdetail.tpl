{def $soknad_selection = $container_node.data_map.soknad_til.content.0}
{def $soknad_link = false()}
{def $soknad_text = false()}
{def $soknad_object = false()}
{*def $css_class=false()*}

{switch match=$soknad_selection}
    {case match=1} {* Samordna opptak *}
        {set $soknad_text = $container_node.data_map.soknad_til.class_content.options[$soknad_selection].name|wash}
        {set $soknad_link = "http://www.samordnaopptak.no"|ezurl}
    {/case}
    {case match=2} {* Høgskolen i Ålesund - lokalt opptak *}
        {set $soknad_text = $container_node.data_map.soknad_til.class_content.options[$soknad_selection].name|wash}
        {def $lokal_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'HialsContentNodeIDs', 'LokaltOpptakID', 'hials.ini' ) )
        {set $soknad_link = $lokal_node.url_alias|ezurl}
    {/case}
    {case match=3} {* Egendefinert objektreferanse *}
        {if $container_node.data_map.soknad_egendefinert.has_content}
            {set $soknad_text = $container_node.data_map.soknad_egendefinert.content.name|wash}
            {set $soknad_object = $container_node.data_map.soknad_egendefinert.content}
        {/if}  
    {/case}
{/switch}
<div class="{$css_class|wash}">
	<div class="class-hials_applicationdetail">
	    <h3>{$node.name|wash()}</h3>
	    <dl>
	        <dt>{"Requirements"|i18n('hials/design/utdanning')}</dt><dd>{attribute_view_gui attribute=$container_node.data_map.opptakskrav }</dd>
	        {if $soknad_object}<dt>{"Application to"|i18n('hials/design/utdanning')}</dt><dd>{content_view_gui content_object=$soknad_object view=embed-inline}</dd>
	        {elseif $soknad_text}<dt>{"Application to"|i18n('hials/design/utdanning')}</dt><dd><a href={$soknad_link}>{$soknad_text}</a></dd>{/if}
	        <dt>{"Application deadline"|i18n('hials/design/utdanning')}</dt><dd>{$container_node.data_map.soknadsfrist.content|wash()}</dd>
	        <dt>{"Credits"|i18n('hials/design/utdanning')}</dt><dd>{$container_node.data_map.cdm_studiepoeng.content|wash()}</dd>
	    </dl>
	</div>
</div>	
{undef $soknad_selection $soknad_text $soknad_link}