<div class="block-item-user">
<div class="col-sm-3 boks-white">
    <div>
        <strong>{$node.data_map.first_name|wash()} {$node.data_map.last_name|wash()}</strong>
    </div 
</div>
<div class="col-sm-3">
    {if $node.data_map.image.has_content}
        {attribute_view_gui attribute=$node.data_map.image image_class=$image_class}
    {/if}
</div>