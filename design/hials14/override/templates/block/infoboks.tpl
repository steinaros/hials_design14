<div class="block-type-infoboks">
    <div class="attribute-header">
        <h3>{$block.name|wash()}</h3>
    </div>
    <article>
        <div class="attribute-short">
            <span>Opptakskrav: </span>{attribute_view_gui attribute=$node.data_map.opptakskrav }
        </div>
        <div class="attribute-short">
            <span>Søknadsfrist: </span>{$node.data_map.soknadsfrist|wash()}
        </div>
        <div class="attribute-short">
            <span>Studiepoeng: </span>{$node.data_map.cdm_studiepoeng|wash()}
        </div> 
    </article>
</div>