<div class="block-type-infoboks">
    <div class="attribute-header">
        <h3>{$block.name|wash()}</h3>
    </div>
    <article>
        <div class="attribute-short">
            <span>Opptakskrav: </span>{attribute_view_gui attribute=$node.data_map.opptakskrav }
        </div>
        <div class="attribute-short">
            <span>S&oslash;knadsfrist: </span>{$node.data_map.soknadsfrist|wash()}
        </div>
        <div class="attribute-short">
            <span>Studiepoeng: </span>{$node.data_map.cdm_studiepoeng|wash()}
        </div> 
    </article>
    <!-- DEBUG
    {$block|attribute('show',2,'text'}
         END DEBUG -->
</div>