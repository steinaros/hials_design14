{def $phone = ''}
{set $phone = $object.data_map.phone.content|wash|simplify|explode(' ')|implode('')}
{if eq($phone|count(),8)}
	{set $phone = concat('+47 ', $phone|extract(0,2), ' ', $phone|extract(2,2), ' ', $phone|extract(4,2), ' ', $phone|extract(6,2))}
{/if}
{def $url = $object.main_node.url_alias}
<div class="row equal avoid-page-break">
	<div class="content-view-embed container-xs-height wrapper">
	    <div class="class-person row-xs-height h-card vcard">
	        <div class="col-xs-6 boks bg-white col-xs-height">
	            <h3>{'Contact'|i18n('hials/design/utdanning')}</h3>
		        <p class="p-name fn"><a href="{$url|ezurl('no')}">{$object.data_map.first_name.content|wash()} {$object.data_map.last_name.content|wash()}</a></p>
		        <p class="p-job-title title">{$object.data_map.jobtitle.content|wash()}</p>
		        <p class="p-tel tel">{$phone|wash()}</p>
		        <p class="u-email email">{$object.data_map.email.content|wash|autolink()}</p>
		        <p class="p-org org hidden">{"Aalesund University College"|i18n('hials/design/std')}</p>
		    </div> 
			<div class="col-xs-6 boks bg-white nopadding col-xs-height col-middle">
			    {if $object.data_map.image.has_content}
			        {attribute_view_gui attribute=$object.data_map.image image_class=contact css_class='u-photo photo img-responsive'}
			    {else}
			        <div class="dummy-image"><div class="text-center"><i class="fa fa-user"></i></div></div>    
			    {/if}
			</div>
	    </div>
	</div>
</div>
{undef $phone $url}