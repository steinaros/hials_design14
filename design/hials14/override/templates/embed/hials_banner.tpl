{def $size = "banner_full"
     $alternative_text = $object.data_map.name.content
     $img_col_width = "12" 
     $quote = not($object.data_map.quote.content.is_empty)}
     
{if $object.data_map.quote.has_content}
    {set $img_col_width = "6"
         $size = "banner_half" }
{/if}

{if is_set( $object_parameters.size )}
    {set $size = $object_parameters.size}
{/if}

{if is_set( $object.data_map.image.content[$size].alternative_text )}
    {set $alternative_text = $object.data_map.image.content[$size].alternative_text}
{/if}

<div class="content-view-embed container-sm-height{if $quote} colspacing{/if}">
	<div class="class-banner{if $quote} row-sm-height{/if}">
		<div class="col-sm-{$img_col_width}{if $quote} col-sm-height nopadding{/if}">
		{if $object.data_map.url.content}
		    <a href={$object.data_map.url.content|ezurl}>
		        <img class="img-responsive" src={$object.data_map.image.content[$size].full_path|ezroot} alt="{$alternative_text}" />
		    </a>
		{else}
		    <img class="img-responsive" src={$object.data_map.image.content[$size].full_path|ezroot} alt="{$alternative_text}" />
		{/if}
		</div>
		{if $quote}
		<div class="col-sm-{$img_col_width} bg-white col-sm-height col-middle nopadding">
		   <blockquote>{attribute_view_gui attribute=$object.data_map.quote}{if $object.data_map.quote_from.content}<cite><span class="quote-name">{$object.data_map.quote_from.content|wash()}</span>{if $object.data_map.quote_title.content}<br><span class="quote-title">{$object.data_map.quote_title.content|wash()}</span>{/if}</cite>{/if}</blockquote>
	    </div>
		{/if}
	</div>
</div>
{undef $size $alternative_text $img_col_width}