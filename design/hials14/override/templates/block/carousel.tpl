{def $valid_nodes = $block.valid_nodes
     $big_image_class = 'frontcarousel'
     $interval = 5000}
{if is_set($block.custom_attributes.interval)}
    {set $interval = $block.custom_attributes.interval|int()}
    {if lt($interval, 0)}{set $interval = 0}{/if}
{/if}
 
<!-- BLOCK: START -->
<div id="carousel-{$block.zone_id}-{$block.id}" class="carousel slide col-md-9 col-md-height nopadding" data-ride="carousel" data-interval="{$interval|wash()}"> 
    <!-- Indicators -->
    <ol class="carousel-indicators">
    {foreach $valid_nodes as $key => $carousel_item}
        <li data-target="#carousel-{$block.zone_id}-{$block.id}" data-slide-to="{$key}"{if eq($key, 0)} class="active"{/if}></li>
    {/foreach}
    </ol>
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        {foreach $valid_nodes as $key => $carousel_item}       
        <div class="item{if eq($key, 0)} active{/if}">
            {node_view_gui view='carouselslide' big_class=$big_image_class content_node=$carousel_item}
        </div>        
        {/foreach}
    </div>
    
    <!-- Controls --> 
    <a class="left carousel-control" href="#carousel-{$block.zone_id}-{$block.id}" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">{'Previous'|i18n('hials/design/navigation')}</span> </a> <a class="right carousel-control" href="#carousel-{$block.zone_id}-{$block.id}" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">{'Next'|i18n('hials/design/navigation')}</span> </a>
</div>
{undef $valid_nodes $big_image_class $interval}
<!-- BLOCK: END -->