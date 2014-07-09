<div class="block-type-infoboks">
    <div class="attribute-header">
        <h3>{$block.name|wash()}</h3>
    </div>
    <article>
        <div class="attribute-short">
            <span>Opptakskrav: </span>{attribute_view_gui attribute=$container_node.data_map.opptakskrav }
        </div>
        <div class="attribute-short">
            <span>S&oslash;knadsfrist: </span>{$container_node.data_map.soknadsfrist.content|wash()}
        </div>
        <div class="attribute-short">
            <span>Studiepoeng: </span>{$container_node.data_map.cdm_studiepoeng.content|wash()}
        </div> 
    </article>
</div>