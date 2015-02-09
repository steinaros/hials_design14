{*
Input:
 image_class - Which image alias to show, default is large
 css_class     - Optional css class to wrap around the <img> tag, the
                 class will be placed in a <div> tag.
 alignment     - How to align the image, use 'left', 'right' or false().
 link_to_image - boolean, if true the url_alias will be fetched and
                 used as link.
 href          - Optional string, if set it will create a <a> tag
                 around the image with href as the link.
 border_size   - Size of border around image, default is 0
*}
{if is_unset($image_class)}{def $image_class = 'large'}{/if}
{if is_unset($css_class)}{def $css_class = false()}{/if}
{if is_unset($alignment)}{def $alignment = false()}{/if}
{if is_unset($link_to_image)}{def $link_to_image = false()}{/if}
{if is_unset($href)}{def $href = false()}{/if}
{if is_unset($target)}{def $target = false()}{/if}
{if is_unset($hspace)}{def $hspace = false()}{/if}
{if is_unset($border_size)}{def $border_size = 0}{/if}
{if is_unset($border_color)}{def $border_color = ''}{/if}
{if is_unset($border_style)}{def $border_style = ''}{/if}
{if is_unset($margin_size)}{def $margin_size = ''}{/if}
{if is_unset($alt_text)}{def $alt_text = ''}{/if}
{if is_unset($title)}{def $title = ''}{/if}
{if is_unset($usemap)}{def $usemap = ''}{/if}
{def $image_content = $attribute.content}
{def $tag_attributes = hash()}

{if $image_content.is_valid}
    {def $image = $image_content[$image_class]
         $inline_style = ''}

    {if $link_to_image}
        {set $href = $image_content['original'].url|ezroot}
    {/if}

    {if and( is_set( $image ), $image )}
        {if $alt_text|not}
            {if $image.text}
                {set $alt_text = $image.text}
            {else}
                {set $alt_text = $attribute.object.name}
            {/if}
        {/if}
        {set $tag_attributes = $tag_attributes|append( hash( 'name', 'alt', 'value', $alt_text ))}
        {if $title|not}
            {set $title = $alt_text}
        {/if}
        {set $tag_attributes = $tag_attributes|append( hash( 'name', 'title', 'value', $alt_text ))}
        {if $border_size|trim|ne('')}
            {set $inline_style = concat( $inline_style, 'border: ', $border_size, 'px ', $border_style, ' ', $border_color, ';' )}
        {/if}
        {if $margin_size|trim|ne('')}
            {set $inline_style = concat( $inline_style, 'margin: ', $margin_size, 'px;' )}
        {/if}
        {if $inline_style}{set $tag_attributes = $tag_attributes|append( hash( 'name', 'style', 'value', $inline_style ))}{/if}
        {if $css_class}{set $tag_attributes = $tag_attributes|append( hash( 'name', 'class', 'value', $css_class ))}{/if}
        {if $usemap}{set $tag_attributes = $tag_attributes|append( hash( 'name', 'usemap', 'value', $usemap ))}{/if}

        {switch match=$alignment}
            {case match='left'}
        <div class="imageleft">
            {/case}
            {case match='right'}
        <div class="imageright">
            {/case}
        {/switch}
        {if $href}<a href={$href}{if and( is_set( $link_class ), $link_class )} class="{$link_class}"{/if}{if and( is_set( $link_id ), $link_id )} id="{$link_id}"{/if}{if $target} target="{$target}"{/if}{if and( is_set( $link_title ), $link_title )} title="{$link_title|wash}"{/if}>{/if}
        <img src={$image.url|ezroot}{foreach $tag_attributes as $attr} {$attr.name}="{$attr.value|wash}"{/foreach}>
        {if $href}</a>{/if}
        {if $alignment}
        </div>
        {/if}
    {/if}
{/if}
