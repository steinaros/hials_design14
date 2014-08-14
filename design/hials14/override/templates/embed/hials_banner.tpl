{def $size = "banner_full"
     $alternative_text = $object.data_map.name.content
     $img_col_width = "12" }
     
{if $object.data_map.quote.content}
    {set $img_col_width = "6"
         $size = "banner_half" }
{/if}

{if is_set( $object_parameters.size )}
    {set $size = $object_parameters.size}
{/if}

{if is_set( $object.data_map.image.content[$size].alternative_text )}
    {set $alternative_text = $object.data_map.image.content[$size].alternative_text}
{/if}

<div class="content-view-embed">
	<div class="class-banner">
		<div class="col-sm-{$img_col_width}">
		{if $object.data_map.url.content}
		    <a href={$object.data_map.url.content|ezurl}>
		        <img class="img-responsive" src={$object.data_map.image.content[$size].full_path|ezroot} alt="{$alternative_text}" />
		    </a>
		{else}
		    <img class="img-responsive" src={$object.data_map.image.content[$size].full_path|ezroot} alt="{$alternative_text}" />
		{/if}
		</div>
		{if $object.data_map.quote.content}
		<div class="col-sm-6">
			<div class="quote-wrapper">
			   <blockquote>{attribute_view_gui attribute=$object.data_map.quote}{if $object.data_map.quote_from.content}<cite><span class="quote-name">{$object.data_map.quote_from.content|wash()}</span>{if $object.data_map.quote_title.content}<br><span class="quote-title">{$object.data_map.quote_title.content|wash()}</span>{/if}</cite>{/if}</blockquote>
			</div>
	    </div>
		{/if}
	</div>
</div>
