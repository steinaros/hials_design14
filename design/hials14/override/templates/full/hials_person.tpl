{def $tmp_office = $node.data_map.office.content|explode( ' ' )|implode('')
     $tmp_phone = $node.data_map.phone.content|explode( ' ' )|implode('')
     $tmp_mobile = $node.data_map.mobile.content|explode( ' ' )|implode('')
     $tmp_phone_formatted = $tmp_phone
     $tmp_mobile_formatted = $tmp_mobile}
     
    {if and( ne($tmp_phone|extract_left(1), '+'), eq($tmp_phone|count(), 8))}
        {set $tmp_phone = concat('+47', $tmp_phone)}
        {set $tmp_phone_formatted = concat($tmp_phone|extract(0,3), '&nbsp;', $tmp_phone|extract(3,2), '&nbsp;', $tmp_phone|extract(5,2), '&nbsp;', $tmp_phone|extract(7,2), '&nbsp;', $tmp_phone|extract(9,2) )} 
    {/if}
    {if and( ne($tmp_mobile|extract_left(1), '+'), eq($tmp_mobile|count(), 8))}
        {set $tmp_mobile = concat('+47', $tmp_mobile)}
        {set $tmp_mobile_formatted = concat($tmp_mobile|extract(0,3), '&nbsp;', $tmp_mobile|extract(3,3), '&nbsp;', $tmp_mobile|extract(6,2), '&nbsp;', $tmp_mobile|extract(8,3) )}
    {/if}
<article class="h-card vcard">
    <h1 class="hidden">{$node.name}</h1>
    <div class="panel panel-person-info">
        <div class="panel-body">
            {if $node.data_map.image.has_content}
            <div class="pull-left person-image">{attribute_view_gui attribute=$node.data_map.image image_class='contact2' css_class='u-photo photo img-responsive'}</div>
            {else}
            <div class="pull-left dummy-image"><div class="text-center"><i class="fa fa-user"></i></div></div>
            {/if}
            <dl>
                <dt class="pull-left">{'Name'|i18n('hials/design/std')}</dt>
                <dd class="fn"><span class="p-family-name">{$node.data_map.last_name.content|trim()|wash()}</span>, <span class="p-given-name">{$node.data_map.first_name.content|trim()|wash()}</span></dd>
                {if $node.data_map.jobtitle.has_content}
                <dt class="pull-left">{'Title'|i18n('hials/design/std')}</dt>
                <dd class="p-job-title title">{$node.data_map.jobtitle.content|trim()|wash()}</dd>
                {/if}
                {if $tmp_office|count()}
                <dt class="pull-left">{'Office'|i18n('hials/design/std')}</dt>
                <dd>{$tmp_office|wash()}</dd>
                {/if}
                {if $node.data_map.email.has_content}
                <dt class="pull-left">{'E-mail'|i18n('hials/design/std')}</dt>
                <dd class="u-email email"><a href="mailto:{$node.data_map.email.content|trim()|wash()}">{$node.data_map.email.content|trim()|wash()}</a></dd>
                {/if}
                {if $tmp_phone|count()}
                <dt class="pull-left">{'Telephone'|i18n('hials/design/std')}</dt>
                <dd class="p-tel tel"><a href="tel:{$tmp_phone|wash()}">{$tmp_phone_formatted}</a></dd>
                {/if}
                {if and($node.data_map.publish_mobile, $tmp_mobile|count())}
                <dt class="pull-left">{'Mobile'|i18n('hials/design/std')}</dt>
                <dd class="p-tel tel"><a href="tel:{$tmp_mobile|wash()}">{$tmp_mobile_formatted}</a></dd>
                {/if}
                {if $node.data_map.homepage.has_content}
                <dt class="pull-left">{'Homepage'|i18n('hials/design/std')}</dt>
                <dd><a href="{$node.data_map.homepage.content|wash|ezurl('no')}">{if gt($node.data_map.homepage.data_text|count(), 0)}{$node.data_map.homepage.data_text|wash}{else}{$node.data_map.homepage.content|wash()}{/if}</a></dd>
                {/if}
                {if $node.data_map.area.has_content}
                <dt class="pull-left">{'Area'|i18n('hials/design/std')}</dt>
                <dd>{$node.data_map.area.content|wash()}</dd>
                {/if}
            </dl>
        </div>
    </div>
</article>
