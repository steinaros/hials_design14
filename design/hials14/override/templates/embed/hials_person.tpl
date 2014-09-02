<div class="content-view-embed">
    <div class="class-person h-card vcard">
        <div class="col-sm-3 boks-white">
	        <h3>{'Contact'|i18n('hials/design/utdanning')}</h3>
	        <p class="p-name fn">{$object.data_map.first_name|wash()} {$node.data_map.last_name|wash()}</p>
	        <p class="p-job-title title">{$object.data_map.jobtitle|wash()}</p>
	        <p class="p-tel tel">{$object.data_map.phone|wash()}</p>
	        <p class="u-email email"></p>
	    </div> 
		<div class="col-sm-3">
		    {if $object.data_map.image.has_content}
		        {attribute_view_gui attribute=$object.data_map.image image_class=small css_class='u-photo photo'}
		    {/if}
		</div>
    </div>
</div>