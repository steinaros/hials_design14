{def $box_width_class = "col-sm-3"}
{switch match=$block.view}
    {case match='1col'}{set $box_width_class = "col-sm-3"}{/case}
    {case match='default'}{set $box_width_class = "col-sm-6"}{/case}
{/switch}
<div class="block-type-applyhere boks {$box_width_class}">
    <div class="call-to-action boks-yellow"><a href="#">S&oslash;k her</a></div>
</div>