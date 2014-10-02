<div class="container-sm-height colspacing">
    <div class="row-sm-height">
        <div class="col-sm-6 col-sm-height nopadding{/if}">
		{if $node.data_map.image.has_content}
		    <a href="{$node.url_alias|ezurl( 'no' )}">
		        {attribute_view_gui css_class='img-responsive' image_class=banner_half attribute=$node.data_map.image}
		    </a>
		{/if}
        {if $object.data_map.url.content}
            <a href={$object.data_map.url.content|ezurl}>
                <img class="img-responsive" src={$object.data_map.image.content[$size].full_path|ezroot} alt="{$alternative_text}" />
            </a>
        {else}
            <img class="img-responsive" src={$object.data_map.image.content[$size].full_path|ezroot} alt="{$alternative_text}" />
        {/if}
        </div>
        {if $quote}
        <div class="col-sm-6 col-sm-height nopadding">
		    {if eq($node.parent.class_identifier,'hials_avdeling')}{$node.parent.data_map.name.content|wash()}{/if}
		    <h2><a href="{$node.url_alias|ezurl( 'no' )}">{$node.data_map.title.content|wash()}</a></h2>
		    {if $node.data_map.intro.content.is_empty|not}
		    <div class="intro">
		        {attribute_view_gui attribute=$node.data_map.intro}
		    </div>
		    {/if}
		    <p><a href="{$node.url_alias|ezurl( 'no' )}">Mer om dette prosjektet</a></p>
		    <p><a href="{$node.parent.url_alias|ezurl( 'no' )}">Alle prosjekter {if eq($node.parent.class_identifier,'hials_avdeling')}ved {$node.parent.data_map.name.content|wash()}{/if}</a></p> 
        </div>
        {/if}
    </div>
</div>
