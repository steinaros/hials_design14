{def $coursenode = array()
     $emnemap = array()
     $semesterstring = ''
     $colspan=$attribute.content.semestercount
     $langcode = ''
     $emneurl = ''}
{if is_unset($doc_view)}{def $doc_view = ''}{/if}
<!-- {$doc_view} -->     
<div class="table-responsive">
    <table  class="table table-striped">
        <thead>
            {if ne($attribute.content.viewmode, 'list')}
            <tr>
                <th colspan="4" scope="col"></th>
                <th colspan="{$colspan}" scope="col" class="text-center">{'Credits pr. semester'|i18n('hials/design/shb/ezsemestermatrix')}</th>
            </tr>
            {/if}
            <tr>
                <th scope="col">{'Code'|i18n('hials/design/shb/ezsemestermatrix')}</th>
                <th scope="col">{'Coursename'|i18n('hials/design/shb/ezsemestermatrix')}</th>
                <th scope="col" class="text-right">{'Credits'|i18n('hials/design/shb/ezsemestermatrix')}</th>
                {if ne($attribute.content.viewmode, 'list')}
                <th scope="col" class="text-center"><abbr title="{'Mandatory course'|i18n('hials/design/shb/ezsemestermatrix')}">{'M'|i18n('hials/design/shb/ezsemestermatrix')}</abbr>/<abbr title="{'Optional course'|i18n('hials/design/shb/ezsemestermatrix')}">{'O'|i18n('hials/design/shb/ezsemestermatrix')}</abbr></th>               
                {def $semesterHeader = $attribute.content.semesterheader}
                <!-- {$attribute.content.semestercount} -->
                {for 1 to $attribute.content.semestercount as $semester sequence array(fetch('handbok', 'language', hash('identifier','H','lang_code',$attribute.language_code,'context', 'emnetabell')), fetch('handbok', 'language', hash('identifier','V','lang_code',$attribute.language_code,'context', 'emnetabell'))) as $seq}
                <th scope="col" class="text-right">{if is_set($semesterHeader[$semester])}{$semesterHeader[$semester]}{else}S{$semester}({$seq}){/if}</th>    
                {/for}
                {undef $semesterHeader}
                {/if}
            </tr>
        </thead>
        <tbody>            
            {foreach $attribute.content.rows as $row}
            {if or(and(eq($row.type, 'course'), is_numeric($row.nodeid)), $row.error|ne(''))}
            <tr>
                <td>{$row.code}</td>
                {set $coursenode=fetch( 'content', 'node', hash('node_id', $row.nodeid))}
                {if $coursenode.object.language_codes|contains( $attribute.language_code )}
                	{set $langcode = $attribute.language_code}
                {else}
                	{set $langcode = $coursenode.object.language_codes.0}
                {/if}
                {set $emneurl = concat("/content/view/full/",$coursenode.node_id,"/language/",$langcode)|ezurl}
                {set $emnemap=fetch('handbok', 'data_map', hash('object_id', $coursenode.contentobject_id, 'language', $langcode))}
                {if and( is_set( $row.error ), $row.error|ne('') )}<td class="danger">{$row.error}</td>{else}<td><a href={$emneurl} hreflang="{$langcode}">{$emnemap['navn'].content|wash}</a></td>{/if}
                <td class="text-right">{attribute_view_gui attribute=$coursenode.data_map['poeng']}</td>
                {if ne($attribute.content.viewmode, 'list')}
                <td class="text-center">{if eq($row['optional'],'true')}<abbr title="{'Optional course'|i18n('hials/design/shb/ezsemestermatrix')}">{'O'|i18n('hials/design/shb/ezsemestermatrix')}</abbr>{else}<abbr title="{'Mandatory course'|i18n('hials/design/shb/ezsemestermatrix')}">{'M'|i18n('hials/design/shb/ezsemestermatrix')}</abbr>{/if}</td>
                {for 1 to $attribute.content.semestercount as $col}
                    {set $semesterstring=concat('semester', $col)}
                <td class="text-right">{if ne($row[$semesterstring], '')}{$row[$semesterstring]}{/if}</td>
                {/for}
                {/if}
            </tr>
            {elseif eq($row.type,'text')}
            <tr class="info">
                <!-- {$attribute.content.viewmode} -->
                {if eq($attribute.content.viewmode, 'list')}{set $colspan=3}{else}{set $colspan=sum($attribute.content.semestercount, 4)}{/if}
                <td colspan="{$colspan}">{$row.text|wash( xhtml )|nl2br}</td>
            </tr>
            {/if}
            {/foreach}
        </tbody>            
            {if ne($attribute.content.viewmode, 'list')}
        <tfoot>
            <tr>
                <th colspan="4" class="text-right" scope="row">{'Total'|i18n('hials/design/shb/ezsemestermatrix')}</th>
                {for 1 to $attribute.content.semestercount as $col}
                    {set $semesterstring=concat('sum', $col)}
                <td class="text-right">{$attribute.content.sums[$semesterstring]}</td>
                {/for}
            </tr>
        </tfoot>
            {/if}
    </table>
</div>
{*section show=ne($attribute.content.viewmode, 'list')}
<span class="emnetabell">{fetch('handbok', 'language', hash('identifier','*) O - Obligatorisk emne, V - Valgbare emne','lang_code',$attribute.language_code,'context', 'emnetabell'))}</span>
{/section*}
{undef $coursenode $emnemap $semesterstring $colspan $langcode $emneurl}