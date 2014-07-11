{def $box_width_class = "col-sm-3"}
{def $video_aspectratio_class = "embed-responsive-16by9"}
{switch match=$block.custom_attributes.width}
    {case match='1_col'}{set $box_width_class = "col-sm-3"}{/case}
    {case match='2_col'}{set $box_width_class = "col-sm-6"}{/case}
{/switch}
{switch match=$block.custom_attributes.aspectratio}
    {case match='16by9'}{set $video_aspectratio_class = "embed-responsive-16by9"}{/case}
    {case match='4by3'}{set $video_aspectratio_class = "embed-responsive-4by3"}{/case}
{/switch}
<div class="block-type-infoboks {$box_width_class}">
    <div class="embed-responsive {$video_aspectratio_class}">
        <iframe class="embed-responsive-item" src="{$block.custom_attributes.source|wash()}" frameborder="0" allowfullscreen></iframe>
    </div>
</div>