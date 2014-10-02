{if $node.data_map.image.has_content}
<div class="col-sm-6 col-left">
    <a href="{$node.url_alias|ezurl( 'no' )}">
        {attribute_view_gui css_class='img-responsive' image_class=banner_half attribute=$node.data_map.image}
    </a>
</div>
{/if}
<div class="{if not($node.data_map.image.has_content)}col-sm-offset-6{/if} col-sm-6 col-right">
    {if eq($node.parent.class_identifier,'hials_avdeling')}{$node.parent.data_map.name.content|wash()}{/if}
    <h2><a href="{$node.url_alias|ezurl( 'no' )}">{$node.data_map.title.content|wash()}</a></h2>
    {if $node.data_map.intro.content.is_empty|not}
    <div class="intro">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/if}
    <p><a href="{$node.url_alias|ezurl( 'no' )}">Mer om dette prosjektet</a></p>
    <p><a href="{$node.parent.url_alias|ezurl( 'no' )}">Alle prosjekter {if eq($node.parent.class_identifier,'hials_avdeling')}ved {$node.parent.data_map.name.content|wash()}{/if}</a></p> 
</div>
