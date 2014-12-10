{def $tmp_office = $node.data_map.office.content|explode( ' ' )|implode('')
     $tmp_phone = $node.data_map.phone.content|explode( ' ' )|implode('')
     $tmp_mobile = $node.data_map.mobile.content|explode( ' ' )|implode('')}
    {if and( ne($tmp_phone|extract_left(1), '+'), gt($tmp_phone|count(), 5))}{set $tmp_phone = concat('+47', $tmp_phone)}{/if}
    {if and( ne($tmp_mobile|extract_left(1), '+'), gt($tmp_mobile|count(), 5))}{set $tmp_mobile = concat('+47', $tmp_mobile)}{/if}
<article class="h-card vcard">
    <h1 class="hidden">{$node.name}</h1>
    <div class="panel panel-person-info">
        <div class="panel-body">
            {if $node.data_map.image.has_content}
            <div class="pull-left person-image">{attribute_view_gui attribute=$node.data_map.image image_class=contact css_class='u-photo photo img-responsive'}</div>
            {else}
            <div class="pull-left dummy-image"><div class="text-center"><i class="fa fa-user"></i></div></div>
            {/if}
            <dl>
                <dt class="pull-left">{'Name'|i18n('hials/design/std')}</dt>
                <dd><span class="p-family-name">{$node.data_map.last_name.content|trim()|wash()}</span>, <span class="p-given-name">{$node.data_map.first_name.content|trim()|wash()}</span></dd>
                <dt class="pull-left">{'Title'|i18n('hials/design/std')}</dt>
                <dd class="p-job-title title">{$node.data_map.jobtitle.content|trim()|wash()}</dd>
                <dt class="pull-left">{'Office'|i18n('hials/design/std')}</dt>
                <dd>{$tmp_office|wash()}</dd>
                <dt class="pull-left">{'E-mail'|i18n('hials/design/std')}</dt>
                <dd class="u-email email"><a href="mailto:{$node.data_map.email.content|trim()|wash()}">{$node.data_map.email.content|trim()|wash()}</a></dd>
                <dt class="pull-left">{'Telephone'|i18n('hials/design/std')}</dt>
                <dd class="p-tel tel">{$tmp_phone|wash()}</dd>
                {if $node.data_map.publish_mobile}
                <dt class="pull-left">{'Mobile'|i18n('hials/design/std')}</dt>
                <dd class="p-tel tel">{$tmp_mobile|wash()}</dd>
                {/if}
                <dt class="pull-left">{'Area'|i18n('hials/design/std')}</dt>
                <dd>{$node.data_map.area.content|wash()}</dd>
            </dl>
        </div>
    </div>
</article>
