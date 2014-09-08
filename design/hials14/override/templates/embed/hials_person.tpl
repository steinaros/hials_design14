{def $phone = ''}
{set $phone = $object.data_map.phone.content|wash|simplify|explode(' ')|implode('')}
{if eq($phone|count(),8)}
	{set $phone = concat('+47 ', $phone|extract(0,2), ' ', $phone|extract(2,2), ' ', $phone|extract(4,2), ' ', $phone|extract(6,2))}
{/if}
<div class="content-view-embed">
    <div class="class-person hials-box-wrapper h-card vcard">
        <div class="hials-box-cell-6 hials-box-cell-white">
	        <p class="p-name fn">{$object.data_map.first_name.content|wash()} {$object.data_map.last_name.content|wash()}</p>
	        <p class="p-job-title title">{$object.data_map.jobtitle.content|wash()}</p>
	        <p class="p-tel tel">{$phone|wash()}</p>
	        <p class="u-email email">{$object.data_map.email.content|wash|autolink()}</p>
	    </div> 
		<div class="hials-box-cell-6">
		    {if $object.data_map.image.has_content}
		        {attribute_view_gui attribute=$object.data_map.image image_class=small css_class='u-photo photo'}
		    {/if}
		</div>
    </div>
</div>